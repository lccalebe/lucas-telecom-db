-- Select all active customers
SELECT customer_id, first_name, last_name, email_address
FROM Customer
WHERE account_status = 'Active';

-- Select all the details of all mobile service plans
SELECT plan_name, monthly_cost, data_allowance_gb, sms_allowance, call_minutes_allowance
FROM ServicePlan
WHERE plan_type = 'Mobile';

-- select all subscriptions for a specific customer
SELECT s.subscription_id, sp.plan_name, s.start_date, s.end_date, s.status
FROM Subscription s
JOIN ServicePlan sp ON s.plan_id = sp.plan_id
WHERE s.customer_id = 1;

-- Get total data usage (GB) for each subscription in a specific month (e.g., May 2024)
SELECT subscription_id, SUM(data_used_gb) AS total_data_gb
FROM UsageRec
WHERE usage_type = 'Data' AND usage_date BETWEEN '2024-05-01 00:00:00' AND '2024-05-31 23:59:59'
GROUP BY subscription_id;

-- List all unpaid bills for all customers
SELECT b.bill_id, c.first_name, c.last_name, sp.plan_name, b.amount_due, b.due_date
FROM Bill b
JOIN Subscription sub ON b.subscription_id = sub.subscription_id
JOIN Customer c ON sub.customer_id = c.customer_id
JOIN ServicePlan sp ON sub.plan_id = sp.plan_id
WHERE b.payment_status = 'Unpaid';

-- Calculate the total monthly bill for each active subscription
-- For simplicity, this query calculates the base monthly cost for active subscriptions.
SELECT
    sub.subscription_id,
    c.first_name,
    c.last_name,
    sp.plan_name,
    sp.monthly_cost AS base_monthly_cost
FROM Subscription sub
JOIN Customer c ON sub.customer_id = c.customer_id
JOIN ServicePlan sp ON sub.plan_id = sp.plan_id
WHERE sub.status = 'Active';

-- Identify high-value customers based on total data usage (top 3 customers by data usage)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(u.data_used_gb) AS total_data_usage_gb
FROM Customer c
JOIN Subscription sub ON c.customer_id = sub.customer_id
JOIN UsageRec u ON sub.subscription_id = u.subscription_id
WHERE u.usage_type = 'Data'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_data_usage_gb DESC
LIMIT 3;

-- Analyze calling patterns: Top 5 most frequent destination numbers
SELECT
    destination_number,
    COUNT(*) AS call_count,
    SUM(duration_seconds) AS total_duration_seconds
FROM UsageRec
WHERE usage_type = 'Call' AND destination_number IS NOT NULL
GROUP BY destination_number
ORDER BY call_count DESC
LIMIT 5;

-- Find customers who have subscribed to both 'Mobile' and 'Internet' plans
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM Customer c
JOIN Subscription sub_mobile ON c.customer_id = sub_mobile.customer_id
JOIN ServicePlan sp_mobile ON sub_mobile.plan_id = sp_mobile.plan_id
WHERE sp_mobile.plan_type = 'Mobile'
AND c.customer_id IN (
    SELECT sub_internet.customer_id
    FROM Subscription sub_internet
    JOIN ServicePlan sp_internet ON sub_internet.plan_id = sp_internet.plan_id
    WHERE sp_internet.plan_type = 'Internet'
);

-- Get the latest bill for each customer
SELECT
    b.bill_id,
    c.first_name,
    c.last_name,
    b.bill_date,
    b.amount_due,
    b.payment_status
FROM Bill b
JOIN Subscription sub ON b.subscription_id = sub.subscription_id
JOIN Customer c ON sub.customer_id = c.customer_id
WHERE b.bill_date = (
    SELECT MAX(b2.bill_date)
    FROM Bill b2
    WHERE b2.subscription_id = b.subscription_id
);



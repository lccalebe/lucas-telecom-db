USE telecom_company;

INSERT INTO Customer (first_name, last_name, date_of_birth, address, city, state, zip_code, phone_number, email_address, account_status) VALUES
(
    'Alice', 'Smith', '1990-05-15', '123 Main St', 'Anytown', 'CA', '90210', '555-111-2222', 'alice.smith@example.com', 'Active'
),
(
    'Bob', 'Johnson', '1985-11-22', '456 Oak Ave', 'Otherville', 'NY', '10001', '555-333-4444', 'bob.j@example.com', 'Active'
),
(
    'Charlie', 'Brown', '1992-03-01', '789 Pine Ln', 'Smallville', 'TX', '75001', '555-555-6666', 'charlie.b@example.com', 'Suspended'
),
(
    'Diana', 'Prince', '1978-08-10', '101 Hero Blvd', 'Metropolis', 'CA', '90001', '555-777-8888', 'diana.p@example.com', 'Active'
),
(
    'Eve', 'Adams', '1995-01-30', '202 Apple Rd', 'Tech City', 'WA', '98101', '555-999-0000', 'eve.a@example.com', 'Active'
);

INSERT INTO ServicePlan (plan_name, monthly_cost, data_allowance_gb, sms_allowance, call_minutes_allowance, plan_type) VALUES
(
    'Basic Mobile Plan', 29.99, 10, 500, 1000, 'Mobile'
),
(
    'Unlimited Data Plan', 59.99, 999, 9999, 9999, 'Mobile'
),
(
    'Home Internet 100Mbps', 49.99, 1000, 0, 0, 'Internet'
),
(
    'Home Internet 500Mbps', 79.99, 5000, 0, 0, 'Internet'
),
(
    'Basic Landline', 19.99, 0, 0, 500, 'Landline'
);

INSERT INTO Subscription (customer_id, plan_id, start_date, end_date, status) VALUES
(
    1, 1, '2023-01-01', NULL, 'Active'
),
(
    1, 3, '2023-02-10', NULL, 'Active'
),
(
    2, 2, '2023-03-01', NULL, 'Active'
),
(
    3, 1, '2023-04-01', '2024-04-01', 'Expired'
),
(
    4, 2, '2023-05-15', NULL, 'Active'
),
(
    5, 4, '2023-06-01', NULL, 'Active'
);

INSERT INTO UsageRec (subscription_id, usage_date, data_used_gb, sms_sent, call_minutes_used, usage_type, destination_number, duration_seconds) VALUES
(
    1, '2024-05-01 10:00:00', 0.5, 0, 0, 'Data', NULL, NULL
),
(
    1, '2024-05-01 10:05:00', 0, 1, 0, 'SMS', '555-111-3333', NULL
),
(
    1, '2024-05-01 10:10:00', 0, 0, 5.2, 'Call', '555-222-4444', 312
),
(
    2, '2024-05-02 11:00:00', 10.2, 0, 0, 'Data', NULL, NULL
),
(
    3, '2024-05-03 12:00:00', 2.1, 0, 0, 'Data', NULL, NULL
),
(
    3, '2024-05-03 12:15:00', 0, 0, 12.5, 'Call', '555-666-7777', 750
),
(
    5, '2024-05-04 09:00:00', 5.0, 0, 0, 'Data', NULL, NULL
),
(
    6, '2024-05-05 14:00:00', 25.0, 0, 0, 'Data', NULL, NULL
);

INSERT INTO Bill (subscription_id, bill_date, due_date, amount_due, payment_status, payment_date) VALUES
(
    1, '2024-05-01', '2024-05-15', 29.99, 'Paid', '2024-05-10'
),
(
    2, '2024-05-01', '2024-05-15', 49.99, 'Paid', '2024-05-10'
),
(
    3, '2024-05-01', '2024-05-15', 59.99, 'Unpaid', NULL
),
(
    5, '2024-05-01', '2024-05-15', 59.99, 'Paid', '2024-05-12'
),
(
    6, '2024-05-01', '2024-05-15', 79.99, 'Unpaid', NULL
);

INSERT INTO Payment (bill_id, payment_date, payment_amount, payment_method) VALUES
(
    1, '2024-05-10 09:30:00', 29.99, 'Credit Card'
),
(
    2, '2024-05-10 09:35:00', 49.99, 'Bank Transfer'
),
(
    4, '2024-05-12 10:00:00', 59.99, 'Credit Card'
);




-- Additional Customer Records
INSERT INTO Customer (first_name, last_name, date_of_birth, address, city, state, zip_code, phone_number, email_address, account_status) VALUES
(
    'Frank', 'Green', '1988-07-07', '303 Elm St', 'Springfield', 'IL', '62704', '555-101-2020', 'frank.g@example.com', 'Active'
),
(
    'Grace', 'Hall', '1991-09-19', '404 Birch Ave', 'Rivertown', 'OH', '43015', '555-202-3030', 'grace.h@example.com', 'Active'
),
(
    'Henry', 'King', '1975-02-28', '505 Cedar Ln', 'Mountain View', 'CA', '94043', '555-303-4040', 'henry.k@example.com', 'Active'
),
(
    'Ivy', 'Lee', '1993-04-12', '606 Willow Rd', 'Lake City', 'FL', '33101', '555-404-5050', 'ivy.l@example.com', 'Active'
),
(
    'Jack', 'Moore', '1980-06-25', '707 Poplar Dr', 'Desert Town', 'AZ', '85001', '555-505-6060', 'jack.m@example.com', 'Suspended'
),
(
    'Karen', 'Nash', '1996-10-03', '808 Spruce Ct', 'Forest Hills', 'OR', '97201', '555-606-7070', 'karen.n@example.com', 'Active'
),
(
    'Liam', 'Owen', '1987-12-01', '909 Fir Blvd', 'Ocean Side', 'CA', '92054', '555-707-8080', 'liam.o@example.com', 'Active'
),
(
    'Mia', 'Perez', '1994-02-14', '111 Palm St', 'Sun City', 'FL', '33133', '555-808-9090', 'mia.p@example.com', 'Active'
),
(
    'Noah', 'Quinn', '1982-03-20', '222 Oakwood Dr', 'Green Valley', 'NV', '89101', '555-909-0101', 'noah.q@example.com', 'Active'
),
(
    'Olivia', 'Reed', '1990-08-05', '333 River Rd', 'Bridgeport', 'CT', '06604', '555-010-1212', 'olivia.r@example.com', 'Active'
);

-- Additional ServicePlan Records
INSERT INTO ServicePlan (plan_name, monthly_cost, data_allowance_gb, sms_allowance, call_minutes_allowance, plan_type) VALUES
(
    'Premium Mobile Plan', 79.99, 50, 2000, 5000, 'Mobile'
),
(
    'Family Share Plan', 99.99, 100, 9999, 9999, 'Mobile'
),
(
    'Business Internet 1Gbps', 129.99, 9999, 0, 0, 'Internet'
),
(
    'Basic Home Phone', 14.99, 0, 0, 200, 'Landline'
);

-- Additional Subscription Records (linking new customers to plans, and existing customers to new plans)
INSERT INTO Subscription (customer_id, plan_id, start_date, end_date, status) VALUES
(
    6, 1, '2023-07-01', NULL, 'Active'
),
(
    7, 2, '2023-08-01', NULL, 'Active'
),
(
    8, 3, '2023-09-01', NULL, 'Active'
),
(
    9, 1, '2023-10-01', NULL, 'Active'
),
(
    10, 2, '2023-11-01', NULL, 'Active'
),
(
    11, 3, '2023-12-01', NULL, 'Active'
),
(
    12, 4, '2024-01-01', NULL, 'Active'
),
(
    13, 1, '2024-02-01', NULL, 'Active'
),
(
    14, 2, '2024-03-01', NULL, 'Active'
),
(
    15, 3, '2024-04-01', NULL, 'Active'
),
(
    1, 6, '2024-05-01', NULL, 'Active' -- Alice gets a new Premium Mobile Plan
),
(
    2, 7, '2024-05-10', NULL, 'Active' -- Bob gets Business Internet
);

-- Additional Usage Records (for various subscriptions)
INSERT INTO UsageRec (subscription_id, usage_date, data_used_gb, sms_sent, call_minutes_used, usage_type, destination_number, duration_seconds) VALUES
(
    7, '2024-05-06 08:00:00', 1.2, 0, 0, 'Data', NULL, NULL
),
(
    7, '2024-05-06 08:10:00', 0, 5, 0, 'SMS', '555-111-9999', NULL
),
(
    7, '2024-05-06 08:20:00', 0, 0, 8.5, 'Call', '555-222-8888', 510
),
(
    8, '2024-05-07 09:00:00', 50.0, 0, 0, 'Data', NULL, NULL
),
(
    9, '2024-05-08 10:00:00', 0.8, 0, 0, 'Data', NULL, NULL
),
(
    9, '2024-05-08 10:15:00', 0, 2, 0, 'SMS', '555-333-7777', NULL
),
(
    10, '2024-05-09 11:00:00', 2.5, 0, 0, 'Data', NULL, NULL
),
(
    11, '2024-05-10 12:00:00', 100.0, 0, 0, 'Data', NULL, NULL
),
(
    12, '2024-05-11 13:00:00', 0, 0, 3.0, 'Call', '555-444-6666', 180
),
(
    13, '2024-05-12 14:00:00', 0.1, 0, 0, 'Data', NULL, NULL
),
(
    14, '2024-05-13 15:00:00', 0, 10, 0, 'SMS', '555-555-5555', NULL
),
(
    15, '2024-05-14 16:00:00', 0, 0, 20.0, 'Call', '555-666-4444', 1200
),
(
    16, '2024-05-15 17:00:00', 5.0, 0, 0, 'Data', NULL, NULL
),
(
    17, '2024-05-16 18:00:00', 0, 0, 1.5, 'Call', '555-777-3333', 90
);

-- Additional Bill Records
INSERT INTO Bill (subscription_id, bill_date, due_date, amount_due, payment_status, payment_date) VALUES
(
    7, '2024-05-01', '2024-05-15', 29.99, 'Paid', '2024-05-10'
),
(
    8, '2024-05-01', '2024-05-15', 59.99, 'Unpaid', NULL
),
(
    9, '2024-05-01', '2024-05-15', 49.99, 'Paid', '2024-05-12'
),
(
    10, '2024-05-01', '2024-05-15', 29.99, 'Unpaid', NULL
),
(
    11, '2024-05-01', '2024-05-15', 59.99, 'Paid', '2024-05-13'
),
(
    12, '2024-05-01', '2024-05-15', 79.99, 'Unpaid', NULL
),
(
    13, '2024-05-01', '2024-05-15', 29.99, 'Paid', '2024-05-14'
),
(
    14, '2024-05-01', '2024-05-15', 59.99, 'Unpaid', NULL
),
(
    15, '2024-05-01', '2024-05-15', 49.99, 'Paid', '2024-05-15'
),
(
    16, '2024-05-01', '2024-05-15', 79.99, 'Unpaid', NULL
),
(
    17, '2024-05-01', '2024-05-15', 14.99, 'Paid', '2024-05-16'
);

-- Additional Payment Records
INSERT INTO Payment (bill_id, payment_date, payment_amount, payment_method) VALUES
(
    7, '2024-05-10 10:00:00', 29.99, 'Credit Card'
),
(
    9, '2024-05-12 11:00:00', 49.99, 'Bank Transfer'
),
(
    11, '2024-05-13 12:00:00', 59.99, 'Credit Card'
),
(
    13, '2024-05-14 13:00:00', 29.99, 'Online Wallet'
),
(
    15, '2024-05-15 14:00:00', 49.99, 'Credit Card'
),
(
    17, '2024-05-16 15:00:00', 14.99, 'Bank Transfer'
);



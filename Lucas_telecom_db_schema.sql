CREATE DATABASE telecom_company;
USE telecom_company;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL,
    account_status ENUM('Active', 'Suspended', 'Cancelled') DEFAULT 'Active'
);

CREATE TABLE ServicePlan (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100) UNIQUE NOT NULL,
    monthly_cost DECIMAL(10, 2) NOT NULL,
    data_allowance_gb INT,
    sms_allowance INT,
    call_minutes_allowance INT,
    plan_type ENUM('Mobile', 'Internet', 'Landline') NOT NULL
);

CREATE TABLE Subscription (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status ENUM('Active', 'Expired', 'Pending') DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (plan_id) REFERENCES ServicePlan(plan_id)
);

CREATE TABLE Usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT NOT NULL,
    usage_date DATETIME NOT NULL,
    data_used_gb DECIMAL(10, 3),
    sms_sent INT,
    call_minutes_used DECIMAL(10, 2),
    usage_type ENUM('Data', 'SMS', 'Call') NOT NULL,
    destination_number VARCHAR(20),
    duration_seconds INT,
    FOREIGN KEY (subscription_id) REFERENCES Subscription(subscription_id)
);

CREATE TABLE Bill (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT NOT NULL,
    bill_date DATE NOT NULL,
    due_date DATE NOT NULL,
    amount_due DECIMAL(10, 2) NOT NULL,
    payment_status ENUM('Paid', 'Unpaid', 'Overdue') DEFAULT 'Unpaid',
    payment_date DATE,
    FOREIGN KEY (subscription_id) REFERENCES Subscription(subscription_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    bill_id INT NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES Bill(bill_id)
);


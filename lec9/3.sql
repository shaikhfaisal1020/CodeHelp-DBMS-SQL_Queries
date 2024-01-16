# Page 3

-- CONSTRAINTS (DDL)
CREATE DATABASE IF NOT EXISTS temp;
USE TEMP;

-- 1. Primary Key
CREATE TABLE Customer (
	id INT PRIMARY KEY,
    cname VARCHAR(225),
    address CHAR(225),
    gender CHAR(2),
    city CHAR(225),
    pincode INT
);

INSERT INTO Customer (id, cname, address, gender, city, pincode) 
VALUES 
(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(1300, 'Shyam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 144001),
(245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
(210, 'Barkha Singh', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

-- 2. FOREIGN KEY 
select * from Customer;

CREATE TABLE Order_details (
	Order_id INT,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer(id)
);

-- 3. UNIQUE 4. CHECK
CREATE TABLE Account (
	id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT,
    CONSTRAINT acc_balance CHECK(balance > 1000)
);

INSERT INTO Account (id, name, balance) 
VALUE (1, 'A', 2000);

SELECT * FROM Account;

INSERT INTO Account (id, name, balance) 
VALUE (3, 'C', 200);

-- 5. DEFAULT
CREATE TABLE Account_New(
	id INT PRIMARY KEY, 
    name VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

INSERT INTO Account_New (id, name) 
VALUE (1, 'A');

SELECT * FROM Account_New;
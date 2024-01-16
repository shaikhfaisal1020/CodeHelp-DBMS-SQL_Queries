# Page 5
-- DML (Data Modification/Manipulation Language)

CREATE TABLE Customer_New (
	id INT PRIMARY KEY,
    cname VARCHAR(225),
    address CHAR(225),
    gender CHAR(2),
    city CHAR(225),
    pincode INT
);

SELECT * FROM Customer_New;

-- INSERT
# Inserting without giving the column names
INSERT INTO Customer_New
VALUE (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002);
# Inserting multiple values
INSERT INTO Customer_New (id, cname, address, gender, city, pincode) 
VALUES
(1300, 'Shyam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 144001),
(245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
(210, 'Barkha Singh', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);
# Inserting some values 
INSERT INTO Customer_New (id, cname) VALUES (1, 'Shaikh Faisal');

-- UPDATE
# Update row using WHERE filter
UPDATE Customer_New SET address='Mumbai', gender='M' WHERE id=1;
# Updating multiple rows 
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer_New SET pincode=110000;
UPDATE Customer_New SET pincode=pincode+1;

-- DELETE
# deleting single row
DELETE FROM Customer_New WHERE id=1;
# deleting all the rows
DELETE FROM Customer_New;

-- ON DELETE CASCADE AND ON DELETE NULL (BASED ON THE REFERENTIAL CONSTRAINTS)
CREATE TABLE Customer_Temp (
	id INT PRIMARY KEY,
    cname VARCHAR(225),
    address CHAR(225),
    gender CHAR(2),
    city CHAR(225),
    pincode INT 
);

INSERT INTO Customer_Temp (id, cname, address, gender) VALUE (1, 'Shaikh Faisal', 'Mumbai', 'M');

SELECT * FROM Customer_Temp;
DROP TABLE Customer_Temp;


# ON DELETE CASCADE
CREATE TABLE Order_details_temp (
	Order_id INT,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer_temp(id) ON DELETE CASCADE
);

INSERT INTO Order_details_temp VALUE (101, '2016-02-20', 1);
INSERT INTO Order_details_temp VALUE (102, '2016-02-22', 1);

SELECT * FROM Order_details_temp;
DROP TABLE order_details_temp;
DELETE FROM Customer_Temp WHERE id=1;

# ON DELETE SET NULL
CREATE TABLE Order_details_temp2 (
	Order_id INT,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer_temp(id) ON DELETE SET NULL
);

INSERT INTO Order_details_temp2 VALUE (101, '2016-02-20', 1);
INSERT INTO Order_details_temp2 VALUE (102, '2016-02-22', 1);

SELECT * FROM Order_details_temp2;
DROP TABLE order_details_temp2;
DELETE FROM Customer_Temp WHERE id=1;

-- REPLACE
SELECT * FROM Customer;
REPLACE INTO Customer (id, CITY) 
VALUES (1251, 'Colony');
# another way to replace using SET keyword
REPLACE INTO Customer SET id=1300, cname='MAC', city='Utah';
REPLACE INTO Customer SET id=1323, cname='MAC', city='Utah';

-- REPLACE vs UPDATE -> If row is not present then replace will create new row and insert it while update will do nothing
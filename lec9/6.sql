# Page 6

-- Joining Tables
CREATE TABLE Employee (
	id INT PRIMARY KEY NOT NULL, 
    fname VARCHAR(255), 
    lname VARCHAR(255), 
    age INT, 
    emailId VARCHAR(255), 
    phoneNo INT, 
    city VARCHAR(255)
);

INSERT INTO Employee
VALUES 
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

SELECT * FROM Employee;

CREATE TABLE Client (
	id INT PRIMARY KEY NOT NULL, 
    fname VARCHAR(255), 
    lname VARCHAR(255), 
    age INT, 
    emailId VARCHAR(255), 
    phoneNo INT, 
    city VARCHAR(255),
    empId INT,
    FOREIGN KEY(empId) REFERENCES Employee(id) ON DELETE CASCADE
);

INSERT INTO Client
VALUES 
(1, 'Mac', 'Rogers', 47, 'mac@gmail.com', 333, 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkate', 3),
(3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hyedarabad', 5),
(5, 'Pratap', 'Singh', 21, 'p@xyz.com', 77767, 'Mumbai', 2);

UPDATE Client SET city='Hyderabad' WHERE id=4;

SELECT * FROM Client;

CREATE TABLE Project (
	id INT PRIMARY KEY NOT NULL,
    empId INT,
    name VARCHAR(255),
    startdate DATETIME,
    clientId INT,
    FOREIGN KEY(empId) REFERENCES Employee(id) ON DELETE CASCADE,
    FOREIGN KEY(clientId) REFERENCES Client(id) ON DELETE SET NULL
);

INSERT INTO Project 
VALUES
(1, 1, 'A','2021-04-21', 3),
(2, 2, 'B','2021-03-12', 1),
(3, 3, 'C','2021-01-16', 5),
(4, 3, 'D','2021-04-27', 2),
(5, 5, 'E','2021-05-01', 4);

SELECT * FROM Project;

# INNER JOIN
-- Enlist all the employees ID's, names along with the project allocated to them.
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee AS e INNER JOIN Project AS p ON e.id = p.empId;
-- Can we do inner join without using INNER JOIN keyword ? Yes, using WHERE keyword
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee AS e, Project AS p WHERE e.id = p.empId;

-- Fetch out all the employee ID's and their contact detail who have been working
-- from jaipur with the clients name working in Hyderabad
SELECT e.id, e.fname, e.lname, e.phoneNo, e.emailId, c.id, c.fname, c.lname FROM Employee AS e 
INNER JOIN  Client AS c ON e.id = c.empID WHERE e.city = 'Jaipur' AND c.city = 'Hyderabad';

# LEFT JOIN
-- Fetch out each project allocated to each employee.
SELECT e.fname, e.lname, p.id, p.name FROM Employee AS e LEFT JOIN Project AS p ON e.id = p.empId;

# RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID.
SELECT p.id, p.name, e.fname, e.lname, e.emailId FROM Employee AS e RIGHT JOIN Project AS p ON e.id = p.empId;

# CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.id, p.name FROM Employee AS e CROSS JOIN Project AS p;
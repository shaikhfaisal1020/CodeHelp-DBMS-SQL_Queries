# Page 7

-- Set Operations

CREATE TABLE dept1 (
	empId INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) UNIQUE,
    role VARCHAR(255)
);

INSERT INTO dept1 (empId, name, role)
VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

SELECT * FROM dept1;

CREATE TABLE dept2 (
	empId INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) UNIQUE,
    role VARCHAR(255)
);

INSERT INTO dept2 (empId, name, role)
VALUES
(3, 'C', 'manager'),
(6, 'B', 'marketing'),
(7, 'G', 'salesman');

SELECT * FROM dept2;


# UNION
-- List out all the employees in the company
SELECT * FROM dept1
UNION
SELECT * FROM dept2;

-- List out all the employees in all departments who works as salesman
SELECT * FROM dept1 WHERE dept1.role = 'salesman'
UNION	
SELECT * FROM dept2 WHERE dept2.role = 'salesman';

# INTERSECTION
-- List out all the employees who work for both the departments
SELECT dept1.* FROM dept1 INNER JOIN dept2 using(empId);

# MINUS
-- List out all the employees working in dept1 but not in dept2
SELECT dept1.* FROM dept1 LEFT JOIN dept2 using(empId) WHERE dept2.empId IS NULL;
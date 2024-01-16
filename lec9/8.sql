# Page 8

-- Sub Queries -> Alternative to Joins

-- Where clause same table 
-- employees with age > 30
SELECT * FROM Employee WHERE age IN(Select age from Employee Where age > 30);

-- Where clause different table
-- employee details working in more than 1 project.
SELECT * FROM Employee WHERE id IN (SELECT empid FROM Project GROUP BY empId HAVING COUNT(empId) > 1);

-- Singe value subquery
-- employee details having age > avg(age)
SELECT * FROM Employee WHERE AGE > (SELECT AVG(age) FROM Employee);

-- FROM clause - have to give alias to the table
-- select max age person whose first name has 'a'
SELECT MAX(age) FROM (SELECT * FROM Employee WHERE fname LIKE '%a%') as e;

-- Corelated Subquery
-- find third oldest employee
SELECT * FROM Employee e1 
WHERE 3 = (
	SELECT COUNT(e2.age) 
    FROM EMPLOYEE e2 WHERE e2.age >= e1.age
);

-- VIEW
SELECT * FROM Employee;

-- Creating a custom VIEW
CREATE VIEW custom_view AS SELECT fname, age FROM Employee;

-- Viewing from VIEW
SELECT * FROM custom_view;

-- Altering the VIEW
ALTER VIEW custom_view AS SELECT fname, lname, age FROM Employee;

-- Dropping the VIEW
DROP VIEW IF EXISTS custom_view;
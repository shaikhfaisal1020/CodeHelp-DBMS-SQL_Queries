# Page 9
-- Solving 50 common SQL queries for interviews
-- Using the same db and tables created in the page 1

CREATE TABLE Worker 
( 
  WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  FIRST_NAME CHAR(25),
  LAST_NAME CHAR(25),
  SALARY INT(15),
  JOINING_DATE DATETIME,
  DEPARTMENT CHAR(25)
);  

Insert INTO Worker 
    (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
    VALUES
    (001, 'Monika' , 'Arora', 100000, '14-02-20 09:00:00'  , 'HR'),
    (002, 'Niharika' , 'Verma', 80000, '14-06-11 09:00:00' , 'Admin'),
    (003, 'Vishal' , 'Singhal', 300000, '14-02-20 09:00:00' , 'HR'),
    (004, 'Amitabh' , 'Singh', 500000, '14-02-20 09:00:00' , 'Admin'),
    (005, 'Vivek' , 'Bhati', 500000, '14-06-11 09:00:00' , 'Admin'), 
    (006, 'Vipul' , 'Diwan' , 200000 , '14-06-11 09:00:00' , 'Account'),
    (007, 'Satish' , 'Kumar' , 75000, '14-01-20 09:00:00' , 'Account'),
    (008, 'Geetika' , 'Chauhan' , 90000, '14-04-11 09:00:00' , 'Admin'); 

-- Inserting NULL Value for example 
INSERT INTO Worker VALUE (009, 'Shaikh', 'Faisal', 20000, '14-04-11 09:00:00', NULL);

SELECT * FROM Worker;

-- References from the Main Table 'Worker'
-- Stores the Amount of Bonus being given to some Worker Corresponding to their 'Worker_id'

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME, 
    FOREIGN KEY (WORKER_REF_ID) 
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
       (WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE)
       VALUES
       (001, 5000, '16-02-20'),
		   (002, 3000, '16-06-11'),
		   (003, 4000, '16-02-20'),
		   (001, 4500, '16-02-20'),
		   (002, 3500, '16-06-11');
		   
SELECT * FROM Bonus;

CREATE TABLE Title (
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);	   

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
	  (001, 'Manager', '2016-02-20 00:00:00'),
	  (002, 'Executive', '2016-06-11 00:00:00'),
	  (008, 'Executive', '2016-06-11 00:00:00'),
	  (005, 'Manager', '2016-06-11 00:00:00'),
	  (004, 'Asst. Manager', '2016-06-11 00:00:00'),
	  (007, 'Executive', '2016-06-11 00:00:00'),
	  (006, 'Lead', '2016-06-11 00:00:00'),
	  (003, 'Lead', '2016-06-11 00:00:00');
      
SELECT * FROM Title;

SELECT * FROM Worker;
SELECT * FROM Title;
SELECT * FROM Bonus;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;

-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME, 'b') FROM Worker WHERE FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY FIRST_NAME;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY FIRST_NAME,  DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM Worker WHERE DEPARTMENT LIKE 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%h' AND LENGTH(FIRST_NAME) = 6;
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE)=02;
SELECT * FROM Worker WHERE JOINING_DATE LIKE '2014-02%';

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING DEPARTMENT = 'Admin';
SELECT DEPARTMENT, COUNT(*) FROM Worker WHERE DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS FULL_NAME FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS no_of_worker FROM WORKER GROUP BY DEPARTMENT ORDER BY no_of_worker DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT * FROM Worker WHERE WORKER_ID IN (SELECT WORKER_REF_ID FROM TITLE WHERE WORKER_TITLE='Manager');
SELECT w.* FROM Worker AS w INNER JOIN TITLE AS t ON w.worker_id = t.worker_ref_id WHERE t.worker_title = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE FROM Title GROUP BY WORKER_TITLE HAVING COUNT(WORKER_REF_ID) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE WORKER_ID%2=1;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE Worker_clone LIKE Worker;
INSERT INTO Worker_clone SELECT * FROM Worker;
SELECT * FROM Worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT Worker.* FROM Worker INNER JOIN Worker_clone USING (WORKER_ID);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT Worker.* FROM Worker LEFT JOIN Worker_clone USING (WORKER_ID) WHERE Worker_clone.WORKER_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
SELECT NOW();
SELECT CURDATE();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT * FROM Worker AS w1
WHERE 4 = (
	SELECT COUNT(DISTINCT(w2.SALARY))
    FROM Worker AS w2 
    WHERE w2.SALARY >= w1.SALARY
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT w1.* FROM Worker w1, Worker w2 WHERE w1.SALARY = W2.SALARY AND w1.WORKER_ID != w2.WORKER_ID;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT MAX(SALARY) FROM Worker
WHERE SALARY NOT IN
(
SELECT MAX(SALARY) FROM Worker
UNION
SELECT MAX(SALARY) FROM Worker 
WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM Worker)
);

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker
ORDER BY WORKER_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT w.* FROM Worker w LEFT JOIN Bonus b ON WORKER_ID = WORKER_REF_ID WHERE b.WORKER_REF_ID IS NULL;
SELECT * FROM WORKER WHERE WORKER_ID NOT IN(SELECT DISTINCT WORKER_REF_ID FROM Bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE WORKER_ID <= (SELECT COUNT(*)/2 FROM Worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS count FROM Worker GROUP BY DEPARTMENT HAVING count < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS count FROM Worker GROUP BY DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 1;

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker LIMIT 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT CONCAT(w1.FIRST_NAME, ' ', w1.LAST_NAME) AS NAME, w1.SALARY, w2.department FROM Worker w1 
INNER JOIN 
(SELECT DEPARTMENT, MAX(SALARY) AS max FROM Worker GROUP BY DEPARTMENT) w2 ON w1.SALARY = w2.max AND w1.DEPARTMENT = w2.DEPARTMENT;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER w1
WHERE 3 >= (
	SELECT COUNT(DISTINCT SALARY) FROM WORKER w2 
    WHERE w2.SALARY >= w1.SALARY
) 
ORDER BY SALARY DESC;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER w1
WHERE 3 >= (
	SELECT COUNT(DISTINCT SALARY) FROM WORKER w2 
    WHERE w2.SALARY <= w1.SALARY
)
ORDER BY SALARY;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT SALARY FROM WORKER w1
WHERE n >= (
	SELECT COUNT(DISTINCT SALARY) FROM WORKER w2 
    WHERE w2.SALARY >= w1.SALARY
) 
ORDER BY SALARY DESC;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, SALARY FROM Worker WHERE SALARY = (SELECT MAX(SALARY) FROM Worker);

-- Q-51. Remove reversed pairs
CREATE TABLE Pairs (
	A INT,
	B INT
);

INSERT INTO Pairs VALUE (1,2), (2,4), (2,1), (3,2), (4,2), (5, 6), (6, 5), (7, 8);

SELECT * FROM Pairs;

-- Using Left Join Method
SELECT lt.* FROM Pairs lt LEFT JOIN Pairs rt ON lt.A = rt.B AND lt.B = rt.A
WHERE rt.A IS NULL OR rt.A > lt.A;

-- Using Corelation Method
Select * FROM Pairs p1 WHERE NOT EXISTS
(SELECT * FROM Pairs p2 WHERE p2.A=p1.B AND p2.B=p1.A AND p2.A < p1.A);
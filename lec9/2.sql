# Page 2

-- DQL (Data Query Language) / DRL (Data Retrieval Language)
-- * Fetches every thing
SELECT * FROM Worker;

-- Where keyword works as a condition
SELECT * FROM Worker WHERE SALARY >= 200000;
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- Between is used for the ranges values (inclusively)
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 300000;

-- IN keyword provides better way to apply many OR conditions
SELECT * FROM Worker WHERE DEPARTMENT IN('HR', 'Account', 'Admin');

-- We can use Select keyword without Where or any keyword
SELECT 22+22;

-- Not
SELECT * FROM Worker WHERE DEPARTMENT NOT IN('HR', 'Admin');

-- NULL
SELECT * FROM Worker WHERE DEPARTMENT IS NULL;

-- Pattern matching/Wildcard (% = any or no numbers of characters, _ = strictly only one character)
SELECT * FROM Worker WHERE LAST_NAME LIKE '%a_';

-- Sorting using Order By
SELECT * FROM Worker ORDER BY SALARY DESC;

-- DISTINCT 
SELECT DISTINCT DEPARTMENT FROM Worker;

-- GROUP BY is used to group the row values for data aggretion purpose
SELECT Department FROM Worker GROUP BY Department;
SELECT Department, COUNT(Department) FROM Worker GROUP BY Department;
SELECT Department, AVG(Salary) FROM Worker GROUP BY Department;
SELECT Department, MIN(Salary), MAX(Salary) FROM Worker GROUP BY Department;

-- GROUP BY HAVING
SELECT Department, MIN(Salary) FROM Worker GROUP BY Department HAVING MIN(Salary) >= 80000;



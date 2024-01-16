# Page 4
-- Alter Operations

CREATE TABLE Account (
	id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

SELECT * FROM Account;

-- ADD new column
ALTER TABLE Account ADD interest FLOAT NOT NULL DEFAULT 0;

DESC Account;
-- MODIFY - change attribute datatype
ALTER TABLE Account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

-- CHANGE COLUMN - renames column name
ALTER TABLE Account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN - drop/delete a column
ALTER TABLE Account DROP COLUMN saving_interest;

-- RENAME TO - rename the table itself
ALTER TABLE Account RENAME TO account_details;
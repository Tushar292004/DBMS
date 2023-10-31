-- Create the student database with the following tables and do the following:
--  assessment(reg_no,name, mark1, mark2, mark3, total)
--  dept_details (dept_no, dept_name, location).
CREATE TABLE assessment (
    reg_no INT PRIMARY KEY,
    name VARCHAR(255),
    mark1 INT,
    mark2 INT,
    mark3 INT,
    total INT
);

CREATE TABLE dept_details (
    dept_no INT PRIMARY KEY,
    dept_name VARCHAR(255),
    location VARCHAR(255)
);

-- Insert sample data into the assessment table
INSERT INTO assessment (reg_no, name, mark1, mark2, mark3, total)
VALUES
    (1, 'John Doe', 85, 90, 78, 253),
    (2, 'Alice Smith', 92, 88, 95, 275);

-- Insert sample data into the dept_details table
INSERT INTO dept_details (dept_no, dept_name, location)
VALUES
    (101, 'Computer Science', 'Building A'),
    (102, 'Mathematics', 'Building B');

-- i. Using alter command drop the column location from the table dept_details.
ALTER TABLE dept_details
DROP COLUMN location;

-- ii. Display all dept_name along withdept_no.
SELECT dept_no, dept_name
FROM dept_details;

-- iii. Drop the table dept_details.   insert and perform queries 
DROP TABLE dept_details;
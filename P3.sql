-- Create the Company database with the following tables and do the following:
--  Administration(employee_salary, development _cost, fund_amount,
-- turn_over,bonus)
--  Emp_details (emp_no, emp_name, DOB, address, doj, mobile_no, dept_no,
-- salary).
CREATE TABLE Administration (
    employee_salary DECIMAL(10, 2),
    development_cost DECIMAL(10, 2),
    fund_amount DECIMAL(10, 2),
    turn_over DECIMAL(10, 2),
    bonus DECIMAL(10, 2)
);

CREATE TABLE Emp_details (
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(255),
    DOB DATE,
    address VARCHAR(255),
    doj DATE,
    mobile_no VARCHAR(15),
    dept_no INT,
    salary DECIMAL(10, 2)
);

-- Insert sample data into the Administration table
INSERT INTO Administration (employee_salary, development_cost, fund_amount, turn_over, bonus)
VALUES
    (45000.00, 5000.00, 75000.00, 150000.00, 3000.00),
    (55000.00, 7000.00, 82000.00, 170000.00, 3500.00);

-- Insert sample data into the Emp_details table
INSERT INTO Emp_details (emp_no, emp_name, DOB, address, doj, mobile_no, dept_no, salary)
VALUES
    (1, 'John Doe', '1990-05-15', '123 Main St, City', '2020-01-10', '123-456-7890', 101, 50000.00),
    (2, 'Alice Smith', '1988-09-20', '456 Elm St, Town', '2019-03-05', '987-654-3210', 102, 55000.00);

-- i. Calculate the total and average salary amount of the employees of each
-- department.
SELECT dept_no, SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM Emp_details
GROUP BY dept_no;

-- ii. Display total salary spent for employees. 
-- insert the values then perform queries 
SELECT SUM(salary) AS total_salary_spent
FROM Emp_details;


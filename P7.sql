-- Consider the following relations for a transport management system application:
-- DRIVER (DCODE, DNAME, DOB, GENDER)
-- CITY (CCODE, CNAME)
-- TRUCK (TRUCKCODE, TTYPE)

-- i. Include the constraint as mentioned above and the gender of driver is
-- always 'male'.
CREATE TABLE DRIVER (
    DCODE INT PRIMARY KEY,
    DNAME VARCHAR(255),
    DOB DATE,
    GENDER VARCHAR(10) CHECK (GENDER = 'male')
);

CREATE TABLE CITY (
    CCODE INT PRIMARY KEY,
    CNAME VARCHAR(255)
);

CREATE TABLE TRUCK (
    TRUCKCODE INT PRIMARY KEY,
    TTYPE VARCHAR(255)
);

-- Insert sample data into the DRIVER table
INSERT INTO DRIVER (DCODE, DNAME, DOB, GENDER)
VALUES
    (1, 'John Doe', '1980-05-15', 'male'),
    (2, 'Alice Smith', '1985-09-20', 'male'),
    (3, 'Bob Johnson', '1990-03-10', 'male');

-- Insert sample data into the CITY table
INSERT INTO CITY (CCODE, CNAME)
VALUES
    (101, 'New York'),
    (102, 'Los Angeles'),
    (103, 'Chicago');

-- Insert sample data into the TRUCK table
INSERT INTO TRUCK (TRUCKCODE, TTYPE)
VALUES
    (201, 'Semi-Truck'),
    (202, 'Pickup Truck');


-- ii. Develop a SQL query to list the details of each driver and the number of
-- trips traveled.


-- iii. Write a PL/SQL Trigger to update and insert a data.


-- iv. Count the number of drivers available
SELECT COUNT(*) AS num_drivers
FROM DRIVER; 
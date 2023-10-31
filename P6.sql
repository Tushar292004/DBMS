-- Consider the following tables.
-- SAILOR(sid, sname, rating, age)
-- BOATS(bid, bname, colour)
-- RESERVES(sid, bid, day)
CREATE TABLE SAILOR (
    sid INT PRIMARY KEY,
    sname VARCHAR(255),
    rating INT,
    age INT
);

CREATE TABLE BOATS (
    bid INT PRIMARY KEY,
    bname VARCHAR(255),
    colour VARCHAR(255)
);

CREATE TABLE RESERVES (
    sid INT,
    bid INT,
    day DATE
);

-- Insert sample data into the SAILOR table
INSERT INTO SAILOR (sid, sname, rating, age)
VALUES
    (1, 'John', 8, 25),
    (2, 'Alice', 7, 22),
    (3, 'Bob', 8, 28),
    (4, 'Emma', 6, 20);

-- Insert sample data into the BOATS table
INSERT INTO BOATS (bid, bname, colour)
VALUES
    (101, 'Blue Boat', 'Blue'),
    (102, 'Red Boat', 'Red'),
    (103, 'Green Boat', 'Green');

-- Insert sample data into the RESERVES table
INSERT INTO RESERVES (sid, bid, day)
VALUES
    (1, 101, '2023-10-01'),
    (2, 102, '2023-10-02'),
    (1, 102, '2023-10-03'),
    (3, 103, '2023-10-04');


-- i. List the sailors in the descending order of their rating.
SELECT *
FROM SAILOR
ORDER BY rating DESC;

-- ii. List the sailors whose youngest sailor for each rating and who can vote.
SELECT s1.*
FROM SAILOR s1
WHERE age = (
    SELECT MIN(age)
    FROM SAILOR s2
    WHERE s2.rating = s1.rating
)
AND age >= 18;

-- iii. List the sailors who have reserved for both ‘RED’ and ‘GREEN’ boats. 
SELECT sid
FROM RESERVES
WHERE bid IN (
    SELECT bid
    FROM BOATS
    WHERE colour = 'RED'
)
INTERSECT
SELECT sid
FROM RESERVES
WHERE bid IN (
    SELECT bid
    FROM BOATS
    WHERE colour = 'GREEN'
);

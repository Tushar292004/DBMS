-- Consider the following Tables for a bus reservation system application:
-- BUS (ROUTENO, SOURCE, DESTINATION)
-- PASSENGER (PID, PNAME, DOB, GENDER)
-- BOOK_TICKET (PID, ROUTENO, JOURNEY_DATE, SEAT_NO)

CREATE TABLE BUS (
    ROUTENO INT PRIMARY KEY,
    SOURCE VARCHAR(255),
    DESTINATION VARCHAR(255)
);

CREATE TABLE PASSENGER (
    PID INT PRIMARY KEY,
    PNAME VARCHAR(255),
    DOB DATE,
    GENDER VARCHAR(10)
);

CREATE TABLE BOOK_TICKET (
    PID INT,
    ROUTENO INT,
    JOURNEY_DATE DATE,
    SEAT_NO INT
);

-- Insert sample data into the BUS table
INSERT INTO BUS (ROUTENO, SOURCE, DESTINATION)
VALUES
    (1, 'Mumbai', 'Chennai'),
    (2, 'Chennai', 'Delhi'),
    (3, 'Mumbai', 'Delhi'),
    (4, 'Chennai', 'Bangalore');

-- Insert sample data into the PASSENGER table
INSERT INTO PASSENGER (PID, PNAME, DOB, GENDER)
VALUES
    (1, 'John Doe', '2005-05-15', 'Male'),
    (2, 'Alice Smith', '1998-09-20', 'Female'),
    (3, 'Bob Johnson', '2002-03-10', 'Male'),
    (4, 'Sarah Brown', '2003-11-25', 'Female');

-- Insert sample data into the BOOK_TICKET table
INSERT INTO BOOK_TICKET (PID, ROUTENO, JOURNEY_DATE, SEAT_NO)
VALUES
    (1, 1, '2019-02-02', 1),
    (2, 1, '2019-02-02', 2),
    (3, 1, '2019-02-02', 3),
    (1, 2, '2020-03-15', 4),
    (2, 2, '2020-03-15', 5),
    (4, 3, '2021-07-20', 6),
    (3, 4, '2022-05-10', 7);


-- i. Include constraint that DOB of passenger should be after 2000
ALTER TABLE PASSENGER
ADD CONSTRAINT CHK_DOB CHECK (DOB > '2000-12-31');

-- ii. Display the passengers who had booked the journey from Mumbai to
-- Chennai on 02-Feb-2019
SELECT PNAME
FROM PASSENGER
WHERE PID IN (
    SELECT PID
    FROM BOOK_TICKET
    WHERE ROUTENO IN (SELECT ROUTENO FROM BUS WHERE SOURCE = 'Mumbai' AND DESTINATION = 'Chennai')
    AND JOURNEY_DATE = '2019-02-02'
);

-- iii. List the details of passengers who have traveled more than three times on
-- the same route.
SELECT PNAME, COUNT(*) AS travel_count
FROM PASSENGER
INNER JOIN BOOK_TICKET ON PASSENGER.PID = BOOK_TICKET.PID
GROUP BY PASSENGER.PID, PNAME
HAVING COUNT(*) > 3;

-- iv. Create a View that displays the RouteNo, source, destination and
-- journey_date which moves from Chennai to Delhi.   
CREATE VIEW ChennaiToDelhiJourneys AS
SELECT B.ROUTENO, B.SOURCE, B.DESTINATION, BT.JOURNEY_DATE
FROM BUS B
INNER JOIN BOOK_TICKET BT ON B.ROUTENO = BT.ROUTENO
WHERE B.SOURCE = 'Chennai' AND B.DESTINATION = 'Delhi';

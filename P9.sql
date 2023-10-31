-- Consider the following database of student enrollment in courses and books
-- adopted for that course.
-- STUDENT(regno, name, major, bdate)
-- COURSE(courseno, cname, dept)
-- ENROLL(regno, courseno, sem, marks)
CREATE TABLE STUDENT (
    regno INT PRIMARY KEY,
    name VARCHAR(255),
    major VARCHAR(255),
    bdate DATE
);

CREATE TABLE COURSE (
    courseno INT PRIMARY KEY,
    cname VARCHAR(255),
    dept VARCHAR(255)
);

CREATE TABLE ENROLL (
    regno INT,
    courseno INT,
    sem VARCHAR(255),
    marks INT,
    FOREIGN KEY (regno) REFERENCES STUDENT(regno),
    FOREIGN KEY (courseno) REFERENCES COURSE(courseno)
);

-- Insert sample data into the STUDENT table
INSERT INTO STUDENT (regno, name, major, bdate)
VALUES
    (1, 'John Doe', 'Computer Science', '1998-05-15'),
    (2, 'Alice Smith', 'Engineering', '1999-09-20'),
    (3, 'Bob Johnson', 'Mathematics', '2000-03-10');

-- Insert sample data into the COURSE table
INSERT INTO COURSE (courseno, cname, dept)
VALUES
    (101, 'Database Management', 'Computer Science'),
    (102, 'Mechanical Engineering', 'Engineering'),
    (103, 'Calculus', 'Mathematics');

-- Insert sample data into the ENROLL table
INSERT INTO ENROLL (regno, courseno, sem, marks)
VALUES
    (1, 101, 'Fall 2023', 90),
    (2, 102, 'Fall 2023', 85),
    (3, 103, 'Fall 2023', 92),
    (1, 102, 'Fall 2023', 88),
    (2, 101, 'Fall 2023', 95),
    (3, 102, 'Fall 2023', 90),
    (1, 103, 'Fall 2023', 88);


-- i. Display the total number of students register for more than two courses in a
-- department specified.
SELECT dept, COUNT(DISTINCT regno) AS num_students
FROM ENROLL
JOIN COURSE ON ENROLL.courseno = COURSE.courseno
WHERE dept = 'Computer Science'
GROUP BY dept
HAVING COUNT(DISTINCT regno) > 2;


-- ii. Display the students who have secured the highest mark in each course
SELECT E.courseno, E.regno, S.name, E.marks
FROM ENROLL E
JOIN STUDENT S ON E.regno = S.regno
WHERE (courseno, marks) IN (
    SELECT courseno, MAX(marks)
    FROM ENROLL
    GROUP BY courseno
);


-- iii. List the youngest student of each course in all departments. 
SELECT C.courseno, C.dept, S.regno, S.name, S.bdate
FROM COURSE C
JOIN ENROLL E ON C.courseno = E.courseno
JOIN STUDENT S ON E.regno = S.regno
WHERE (E.courseno, S.bdate) IN (
    SELECT E1.courseno, MIN(S1.bdate)
    FROM ENROLL E1
    JOIN STUDENT S1 ON E1.regno = S1.regno
    WHERE E1.courseno = C.courseno
    GROUP BY E1.courseno
);


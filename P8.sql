-- Consider the following relational schema for a banking database application:
-- CUSTOMER (CID, CNAME)
-- BRANCH (BCODE, BNAME)
-- ACCOUNT (ANO, ATYPE, BALANCE, CID, BCODE)
-- TRANSACTION (TID, ANO, TTYPE, TDATE, TAMOUNT)
CREATE TABLE CUSTOMER (
    CID INT PRIMARY KEY,
    CNAME VARCHAR(255)
);

CREATE TABLE BRANCH (
    BCODE INT PRIMARY KEY,
    BNAME VARCHAR(255)
);

CREATE TABLE ACCOUNT (
    ANO INT PRIMARY KEY,
    ATYPE VARCHAR(255),
    BALANCE DECIMAL(10, 2),
    CID INT,
    BCODE INT,
    FOREIGN KEY (CID) REFERENCES CUSTOMER(CID),
    FOREIGN KEY (BCODE) REFERENCES BRANCH(BCODE)
);

CREATE TABLE TRANSACTION (
    TID INT PRIMARY KEY,
    ANO INT,
    TTYPE VARCHAR(255),
    TDATE DATE,
    TAMOUNT DECIMAL(10, 2),
    FOREIGN KEY (ANO) REFERENCES ACCOUNT(ANO)
);

-- Insert sample data into the CUSTOMER table
INSERT INTO CUSTOMER (CID, CNAME)
VALUES
    (1, 'John Doe'),
    (2, 'Alice Smith'),
    (3, 'Bob Johnson');

-- Insert sample data into the BRANCH table
INSERT INTO BRANCH (BCODE, BNAME)
VALUES
    (101, 'Main Branch'),
    (102, 'Downtown Branch');

-- Insert sample data into the ACCOUNT table
INSERT INTO ACCOUNT (ANO, ATYPE, BALANCE, CID, BCODE)
VALUES
    (1001, 'Savings', 5000.00, 1, 101),
    (1002, 'Checking', 3500.00, 2, 101),
    (1003, 'Savings', 6000.00, 3, 102);

-- Insert sample data into the TRANSACTION table
INSERT INTO TRANSACTION (TID, ANO, TTYPE, TDATE, TAMOUNT)
VALUES
    (2001, 1001, 'Deposit', '2023-10-01', 1000.00),
    (2002, 1002, 'Withdrawal', '2023-10-01', 500.00),
    (2003, 1001, 'Deposit', '2023-10-01', 200.00),
    (2004, 1002, 'Withdrawal', '2023-10-01', 300.00),
    (2005, 1003, 'Deposit', '2023-10-01', 1500.00);

-- i. Develop a SQL query to list the details of branches and the number of
-- accounts in each branch.
SELECT B.BCODE, B.BNAME, COUNT(A.ANO) AS num_accounts
FROM BRANCH B
LEFT JOIN ACCOUNT A ON B.BCODE = A.BCODE
GROUP BY B.BCODE, B.BNAME;


-- ii. Develop a SQL query to list the details of customers who have performed
-- the most transactions today  
SELECT C.CID, C.CNAME, COUNT(T.TID) AS num_transactions
FROM CUSTOMER C
LEFT JOIN ACCOUNT A ON C.CID = A.CID
LEFT JOIN TRANSACTION T ON A.ANO = T.ANO
WHERE T.TDATE = '2023-10-01'
GROUP BY C.CID, C.CNAME
ORDER BY num_transactions DESC
LIMIT 1;

-- iii. Perform cross join from the given table.   insert data and then perform queries
SELECT * FROM CUSTOMER, BRANCH;
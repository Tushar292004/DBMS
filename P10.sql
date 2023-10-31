-- AUTHOR(author_id, name, city, country)
-- PUBLISHER(publisher_id, name, city, country)
-- CATALOG(book_id, title, author_id, publisher_id , category_id, year, price)
-- CATEGORY(category_id, description)
-- ORDER_DETAILS(order_no, book_id, quantity)
-- Create the tables
CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE PUBLISHER (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE CATALOG (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    publisher_id INT,
    category_id INT,
    year INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES AUTHOR(author_id),
    FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id),
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);

CREATE TABLE ORDER_DETAILS (
    order_no INT PRIMARY KEY,
    book_id INT,
    quantity INT
);

-- Insert sample data
-- You can insert your own data here

-- For example:
INSERT INTO AUTHOR (author_id, name, city, country)
VALUES
    (1, 'Author 1', 'City 1', 'Country 1'),
    (2, 'Author 2', 'City 2', 'Country 2');

INSERT INTO PUBLISHER (publisher_id, name, city, country)
VALUES
    (1, 'Publisher 1', 'City 3', 'Country 3'),
    (2, 'Publisher 2', 'City 4', 'Country 4');

INSERT INTO CATEGORY (category_id, description)
VALUES
    (1, 'Category 1'),
    (2, 'Category 2');

INSERT INTO CATALOG (book_id, title, author_id, publisher_id, category_id, year, price)
VALUES
    (1, 'Book 1', 1, 1, 1, 2022, 29.99),
    (2, 'Book 2', 2, 2, 1, 2023, 19.99);

INSERT INTO ORDER_DETAILS (order_no, book_id, quantity)
VALUES
    (1, 1, 10),
    (2, 2, 5);

-- i. List the author of the book that has minimum sales.
SELECT A.name AS author_name
FROM AUTHOR A
INNER JOIN CATALOG C ON A.author_id = C.author_id
WHERE C.book_id = (
    SELECT book_id
    FROM ORDER_DETAILS
    GROUP BY book_id
    ORDER BY SUM(quantity) ASC
    LIMIT 1
);

-- ii. Display total number of books in each category. 
SELECT CAT.category_id, CAT.description AS category_description, COUNT(CAT.book_id) AS total_books
FROM CATEGORY CAT
LEFT JOIN CATALOG C ON CAT.category_id = C.category_id
GROUP BY CAT.category_id, CAT.description;
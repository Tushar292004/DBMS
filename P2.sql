-- Create the Book database and do the following:
-- Book (book_name,author_name,price,quantity).

CREATE TABLE Book (
    book_name VARCHAR(255),
    author_name VARCHAR(255),
    price DECIMAL(10, 2),
    quantity INT
);

-- Insert sample data into the Book table
INSERT INTO Book (book_name, author_name, price, quantity)
VALUES
    ('Database for Dummies', 'John Doe', 29.99, 10),
    ('Python Programming', 'Alice Smith', 49.99, 5),
    ('Java Basics', 'Bob Johnson', 39.99, 8),
    ('Data Structures and Algorithms', 'Amy Adams', 59.99, 7),
    ('Web Development with JavaScript', 'Andrew Anderson', 34.99, 12),
    ('SQL Mastery', 'Alex Allen', 44.99, 6);

-- i. Write a query to update the quantity by double in the table book.
UPDATE Book
SET quantity = quantity * 2;

-- ii. List all the book_name whose price is greater than those of book named
-- "Database for Dummies".
SELECT book_name
FROM Book
WHERE price > (SELECT price FROM Book WHERE book_name = 'Database for Dummies');

-- iii. Retrieve the list of author_name whose first letter is ’a’ along with the
-- book_name and price.
SELECT author_name, book_name, price
FROM Book
WHERE author_name LIKE 'A%' OR author_name LIKE 'a%';



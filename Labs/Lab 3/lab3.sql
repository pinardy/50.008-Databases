# Pinardy Yang
# 1001520

/** ===== --- LAB 3  ===== --- */

/* Q1) Find the total number of copies */
SELECT COUNT(*) FROM copy;

/* Q2) Print the number of copies for each book.
(Output the primary key of the book and the number of copies) */
SELECT c.book, COUNT(*)
FROM copy c
GROUP BY c.book;

/* Q3) Find the books with the largest number of available copies */
SELECT book, SUM(Available) AS Copies 
FROM copy c
GROUP BY c.book
HAVING SUM(Available) = (
SELECT MAX(total)
FROM (
SELECT book, SUM(Available) AS total 
FROM copy 
GROUP by book) 
bookmax);

/* Q4) Find the names of the students who have borrowed some book by ‘Charles Dickens’ */
SELECT DISTINCT s.name
FROM student s, loan l, book b
WHERE (l.borrower = s.email AND l.book = b.ISBN13 AND b.authors = 'Charles Dickens');

/* Q5) Find the number of books written by ‘Charles Dickens’ */
SELECT COUNT(*) AS 'Book Count'
FROM book
WHERE authors = 'Charles Dickens';

# Number of books: 3

/* Q6) Find the names of students who have borrowed all the books by ‘Charles Dickens’.
Use aggregate functions */
SELECT s.name
FROM student s, loan l, book b
WHERE (l.borrower = s.email AND l.book = b.ISBN13 AND b.authors = 'Charles Dickens')
GROUP BY s.name
HAVING COUNT(DISTINCT b.ISBN13) = (
SELECT COUNT(*)
FROM book b
WHERE b.authors='Charles Dickens');

# We get LI YUZHAO

/* Q7) Find the names of students who have borrowed all the books by ‘Charles Dickens’.
Use NOT EXISTS only. (You may also try NOT EXISTS with NOT IN or EXCEPT.) */
SELECT s.name
FROM student s
WHERE NOT EXISTS
(SELECT * FROM book b
WHERE b.authors='Charles Dickens'
AND NOT EXISTS
(SELECT * FROM loan l
WHERE l.book=b.ISBN13 AND l.borrower=s.email));

/* Q8) Replace ‘Charles Dickens’ with ‘C. J. Date’.
Try again query 6 and 7. Describe and explain your findings */
# QUERY 6
SELECT s.name
FROM student s, loan l, book b
WHERE (l.borrower = s.email AND l.book = b.ISBN13 AND b.authors = 'C. J. Date')
GROUP BY s.name
HAVING COUNT(DISTINCT b.ISBN13) = (
SELECT COUNT(*)
FROM book b
WHERE b.authors='C. J. Date');

# QUERY 7
SELECT s.name
FROM student s
WHERE NOT EXISTS
(SELECT * FROM book b
WHERE b.authors='C. J. Date'
AND NOT EXISTS
(SELECT * FROM loan l
WHERE l.book=b.ISBN13 AND l.borrower=s.email));

# Query 6 returns nothing, while Query 7 returns everything. 
# This is because the book does not exist


/* Q9) Create views for the copies and loans for which the owner is a Computer Science student.
Output the number of tuples in the views and compare it with the original tables */
# Copies
CREATE VIEW copy_cs AS
SELECT c.owner, c.book, c.copy, c.available
from copy c, student s
WHERE c.owner=s.email and s.department='Computer Science';

# Loans
CREATE VIEW loan_cs AS
SELECT borrower, owner, book, copy, borrowed, returned
FROM loan l, student s
WHERE l.owner=s.email and s.department='Computer Science';

SELECT COUNT(*) FROM copy_cs; # 284
SELECT COUNT(*) FROM copy; 	  # 1244
SELECT COUNT(*) FROM loan_cs; # 1136
SELECT COUNT(*) FROM loan;    # 4976

/* Q10) We did not specify loan.borrower is a foreign key that references student table.
Create a trigger that propagates the update of a student’s email to the loan.borrower.
(Write code that is valid in MySQL, not SQL Standard.) */
CREATE TRIGGER cascade_update
AFTER UPDATE ON student
FOR EACH ROW
UPDATE loan SET borrower = NEW.email WHERE borrower = OLD.email;

/** ===== --- LAB 3  ===== --- */

/* Q1) Find the total number of copies */
SELECT COUNT(*) FROM copy;

/* Q2) Print the number of copies for each book.
(Output the primary key of the book and the number of copies) */
SELECT c.book, COUNT(*)
FROM copy c
GROUP BY c.book;

/* Q3) Find the books with the largest number of available copies */



/* Q4) Find the names of the students who have borrowed some book by ‘Charles Dickens’ */
SELECT DISTINCT s.name
FROM student s, loan l, book b
WHERE (l.borrower = s.email AND l.book = b.ISBN13 AND b.authors = 'Charles Dickens');


/* Q5) Find the number of books written by ‘Charles Dickens’ */
SELECT COUNT(*)
FROM book
WHERE authors = 'Charles Dickens';

/* Q6) Find the names of students who have borrowed all the books by ‘Charles Dickens’.
Use aggregate functions */


/* Q7) Find the names of students who have borrowed all the books by ‘Charles Dickens’.
Use NOT EXISTS only. (You may also try NOT EXISTS with NOT IN or EXCEPT.) */


/* Q8) Replace ‘Charles Dickens’ with ‘C. J. Date’.
Try again query 6 and 7. Describe and explain your findings */


/* Q9) Create views for the copies and loans for which the owner is a Computer Science student.
Output the number of tuples in the views and compare it with the original tables */


/* Q10) We did not specify loan.borrower is a foreign key that references student table.
Create a trigger that propagates the update of a student’s email to the loan.borrower.
(Write according to the SQL Standard) */

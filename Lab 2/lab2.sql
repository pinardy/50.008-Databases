/** ===== --- LAB 2  ===== --- */

/* Q1) Find the emails of students. */
SELECT email FROM student;

/* Q2) Find the distinct emails of students */
SELECT DISTINCT email FROM student;

/* Q3) Print the names of students in descending alphabetical order */
SELECT name FROM student
ORDER BY name DESC;

/* Q4) Are there students with the same name? Show your result */


/* Q5) Find the distinct names of students. Is the result sorted?
If you use Microsoft SQL Server, look at the execution plan */
SELECT DISTINCT name
FROM student;
-- The result is not sorted

/* Q6) Find the names of students who owned a copy of book ‘978-0262033848’.
Show your result */
SELECT name
FROM student s, copy c
WHERE (c.owner = s.email) AND (c.book = '978-0262033848');

/* Q7) Find the names of students who owned a copy of book with
more than 100 pages whose title contains the word ‘Computer’. Show your result */
SELECT name
FROM (student s, copy c, book b)
WHERE (c.owner = s.email) AND (c.book = b.ISBN13)
AND (b.title LIKE '%Computer%' AND b.pages > 100);

/* Q8) Find the number of A4 pages needed to photocopy the two books with
ISBN-13 '978-0262033848' and '978-0321295354' (2-sided copying). */
SELECT (b1.pages + b2.pages)/2
FROM book b1, book b2
WHERE (b1.ISBN13 = '978-0262033848' AND b2.ISBN13 = '978-0321295354');

/* Q9) Find the distinct names of students who owned a
copy of a book that is different from book ‘978-0262033848’ */
SELECT DISTINCT name
FROM student s, copy c
WHERE (c.book != '978-0262033848' AND c.owner = s.email);

/* Q10) Find the names of students who borrowed a copy of book ‘978-0262033848’ */
SELECT s.name
FROM student s, loan l
WHERE (l.borrower = s.email AND l.book = '978-0262033848');

/* Q11) Find the names of students who owned or borrowed
a copy of book ‘978-0262033848’. Use UNION */
SELECT s.name
FROM student s, copy c
WHERE (c.owner = s.email AND c.book = '978-0262033848')

UNION

SELECT s.name
FROM student s, loan l
WHERE (l.borrower = s.email AND l.book = '978-0262033848');

/* Q12) Find the names of students who owned or borrowed
a copy of book ‘978-0262033848’. USE OR. */
SELECT s.name
FROM student s, copy c, loan l
WHERE (c.owner=s.email AND c.book='978-0262033848')
OR (l.borrower=s.email AND l.book='978-0262033848');

/* Q13) Delete all the data in table loan (do not drop the table).
Try again query 11 and 12. Explain your finding */
DELETE FROM loan;

-- Query 11 works
-- Query 12 returns no results. This is because the cartesian product
-- in the FROM clause is empty
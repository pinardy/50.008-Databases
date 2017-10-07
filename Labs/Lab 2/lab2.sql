#   Pinardy Yang 
#   1001520

/** ===== --- LAB 2  ===== --- */

/* Q1) Find the emails of students. */
SELECT email FROM student;

/* Q2) Find the distinct emails of students */
SELECT DISTINCT email FROM student;

/* Q3) Print the names of students in descending alphabetical order */
SELECT name FROM student
ORDER BY name DESC;

/* Q4) Are there students with the same name? Show your result */
SELECT name from student 
GROUP BY name HAVING COUNT(*) > 1; # We get LIU JUN as our duplicate

/* Q5) Find the distinct names of students. Is the result sorted?
If you use Microsoft SQL Server, look at the execution plan */
SELECT DISTINCT name FROM student; 
# The result is sorted in alphabetical order for my computer (Dell XPS13)

/* Q6) Find the names of students who owned a copy of book ‘978-0262033848’.
Show your result */
SELECT name 
FROM student s, copy c
WHERE (c.book = '978-0262033848') AND (c.owner = s.email);

/* Q7) Find the names of students who owned a copy of book with
more than 100 pages whose title contains the word ‘Computer’. Show your result */
SELECT name 
FROM student s, copy c, book b
WHERE (b.title LIKE '%Computer%' AND b.pages > 100)
AND (c.book = b.ISBN13) AND (c.owner = s.email);

# If we put DISTINCT for the SELECT statement above, we get 17 queries instead

/* Q8) Find the number of A4 pages needed to photocopy the two books with
ISBN-13 '978-0262033848' and '978-0321295354' (2-sided copying). */
SELECT (b1.pages + b2.pages)/2
FROM book b1, book b2
WHERE (b1.ISBN13 = '978-0262033848' AND b2.ISBN13 = '978-0321295354');

/* Q9) Find the distinct names of students who owned a
copy of a book that is different from book ‘978-0262033848’ */
SELECT DISTINCT name 
FROM student s, copy c
WHERE NOT c.book = '978-0262033848' AND c.owner = s.email;

/* Q10) Find the names of students who borrowed a copy of book ‘978-0262033848’ */
SELECT name 
FROM student s, loan l
WHERE l.book = '978-0262033848' AND l.borrower = s.email;

/* Q11) Find the names of students who owned or borrowed
a copy of book ‘978-0262033848’. Use UNION */
SELECT name 
FROM student s, copy c
WHERE (c.book = '978-0262033848') AND (c.owner = s.email)

UNION

SELECT name 
FROM student s, loan l
WHERE l.book = '978-0262033848' AND l.borrower = s.email;

/* Q12) Find the names of students who owned or borrowed
a copy of book ‘978-0262033848’. USE OR. */
SELECT name
FROM student
WHERE 
email IN (SELECT borrower FROM loan WHERE book = '978-0262033848')
OR email in (SELECT owner FROM copy WHERE book = '978-0262033848');

/* Q13) Delete all the data in table loan (do not drop the table).
Try again query 11 and 12. Explain your finding */
DELETE FROM loan;

# Both queries 11 & 12 returned 4 entries. This is because query 12 uses both 
# the loan table and the copy table. As the SELECT statement from loan failed, 
# there is still the SELECT statement from copy which works



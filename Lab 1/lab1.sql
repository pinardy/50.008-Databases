/** ===== --- LAB 1 ===== --- */

/* Q1) Create a table book that contains information about books:
title, format (paperback or hardcover), number of pages, authors,
publisher, year, edition, ISBN-10 and ISBN-13. Choose a primary key.

Forbid NULL values for the title, ISBN-10 and ISBN-13,
make sure the format is either “paperback” or “hardcover”. */

CREATE TABLE "books"(
    'title' VARCHAR(128) NOT NULL,
    'format' VARCHAR(128) CHECK(format='paperback' OR format='hardcover'),
    'pages' INTEGER,
    'authors' VARCHAR(128),
    'publisher' INTEGER,
    'year' INTEGER,
    'edition' VARCHAR(128),
    'ISBN10' CHAR(10) NOT NULL UNIQUE,
    'ISBN13' CHAR(14) NOT NULL,
    PRIMARY KEY('ISBN10')
);

/* Q2) Insert one book called “Database Management Systems”.
Go to the Web to find actual details */

/* https://www.amazon.com/Database-Management-Systems-Raghu-Ramakrishnan/dp/0072465638 */
INSERT into books VALUES (
    'Database Management Systems',
    'hardcover',
    1104,
    'Raghu Ramakrishnan and Johannes Gehrke',
    'MacGraw-Hill',
    2012,
    3,
    '0072465638',
    '978-0072465631'
);

/* Q3) Insert five books with title containing “Database Management Systems” or authored by C. J. Date */
/* https://www.amazon.com/Guide-SQL-Standard-C-J-Date/dp/0201502097 */
INSERT into books VALUES (
    'A Guide to the SQL Standard',
    'paperback',
    240,
    'C.J. Date',
    'Addison-Wesley',
    1989,
    2,
    '0201502097',
    '978-0201502091'
);

/* https://www.amazon.com/Database-Design-Relational-Theory-Practice/dp/1449328016 */
INSERT into books VALUES (
    'Database Design and Relational Theory: Normal Forms and All That Jazz (Theory in Practice)',
    'paperback',
    260,
    'C.J. Date',
    'O''Reilly Media',
    2012,
    1,
    '1449328016',
    '978-1449328016'
);

/* https://www.amazon.com/Database-Depth-Relational-Theory-Practitioners/dp/0596100124 */
INSERT into books VALUES (
    'Database in Depth: Relational Theory for Practitioners',
    'paperback',
    208,
    'C.J. Date',
    'O''Reilly Media',
    2005,
    1,
    '0596100124',
    '978-0596100124'
);

/* https://www.amazon.com/Logic-Databases-Roots-Relational-Theory/dp/1425122906 */
INSERT into books VALUES (
    'Logic and Databases: The Roots of Relational Theory',
    'paperback',
    460,
    'C.J. Date',
    'Trafford Publishing',
    2007,
    1,
    '1425122906',
    '978-1425122904'
);

/* https://www.amazon.com/Database-management-systems-Understanding-technology/dp/0894353233 */
INSERT into books VALUES (
    'Database Management Systems',
    'hardcover',
    454,
    'Michael M. Gorman',
    'QED Information Sciences',
    1991,
    1,
    '0894353233',
    '978-0894353239'
);

/* Q4) Query your book table and output all the information about all books.
Show a screenshot of your query result */
SELECT * FROM books;

/* Q5) Modify all books authored by C. J. Date to mention the author’s first name */
UPDATE books SET authors='Christopher J. Date' WHERE authors='C.J. Date';

/* Q6) Find the title, authors, publisher, year, edition, ISBN-10 and ISBN-13 of the books.
Show a screenshot of your query result */
SELECT 'title', 'authors', 'publisher', 'year', 'edition', 'ISBN10', 'ISBN13' FROM books;

/* Q7) Find the authors of the books. Show a screenshot of your query result */
SELECT authors from books;

/* Q8) Find the authors of the books called “Database Management Systems” */
SELECT 'authors' from books where 'title'='Database Management Systems';

/* Q9) Add a language attribute to all books. Set the default language to English */
ALTER TABLE books
ADD language VARCHAR(32) DEFAULT 'English';

/* Q10) Delete all books authored by C. J. Date */
DELETE from books
WHERE authors='Christopher J. Date' or authors='C.J. Date';

/* Q11) Delete your book table */
DROP table books;
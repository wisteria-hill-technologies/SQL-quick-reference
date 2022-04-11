SELECT
    concat(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') AS 'Last Name Character Length'
FROM books;
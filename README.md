# SQL Quick Reference

### Databases
Display all the databases
```show databases;```

Create a new database
```CREATE DATABASE my_database;```

Select which database to use
```USE my_database;```

Display current database
```SELECT database();```

Delete database
```DROP DATABASE my_database;```

### Tables
Show tables
```SHOW TABLES;```
```SHOW COLUMNS FROM my_table;```
```DESC my_table;```

Delete database
```DROP TABLE my_table```

Create a table
```
CREATE TABLE my_table 
    (
        name VARCHAR(100),
        age INT
        ... ...
    )
```
To not allow null values
```
CREATE TABLE my_table
    (
        name VARCHAR(50) NOT NULL,
        age INT NOT NULL
    );
```
To specify default values
```
CREATE TABLE my_table
    (
        name VARCHAR(50) DEFAULT 'Unknown',
        age INT DEFAULT 10
    );

```

To set a unique identifier - Primary Key!
```
CREATE TABLE user2
    (
        user_id INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY (user_id),
        name VARCHAR(50) NOT NULL DEFAULT 'unknown',
        age INT NOT NULL
    );
```

If you want to modify or forgot to add something to table (e.g. auto_increment):
```
alter table table_name modify column column_name int not null auto_increment;
```



See data inside table
```SELECT * FROM my_table;```

Insert into a table
```
INSERT INTO my_table (name, age)
VALUES ('Tony' 25),
       ('Bob', 45),
       ('Ben', 38)
```

Show warnings
```SHOW WARNINGS;```


## Select
```
select * from my_table;
select column_name from my_table;
select column_name_1, column_name_2 from my_table;
```
### where
```
select * from my_table where column_name_1 = 'hello' AND column_name_2 = 4;
```

### Aliases
You can give aliases to column names as below.
```
select cat_id as id, name from cats;
select name AS 'cat name', breed AS 'kitty breed' FROM cats;
```

## Update
```
update my_table set column_name='new value', another_column_name="another new value" where column_name='some value';

update books set title='Oblivion 2', author_fname='David 2' where book_id=15;
```

## Delete
Similar to select syntax
```
delete from my_table where column_name = 'some value';
```
DON'T just 'delete from my_tables' without specifying an item with 'where'.  It will delete all the items in the table.

## Importing from sql file
Go to the file location of your sql file.
Then, go into sql.
Select your database.
Do below command (with correct path)

```
source filename.sql
```

## String Functions
String functions only change the query output, but they do not change actual data in the database.

### Concat
Examples:
```
select concat(column_1, column_2) from table_name;

select concat(column_1, 'can add text or space here', column_2) from table_name;

select concat(column_1, 'can add text or space here', column_2) as 'whatever you want to call it' from table_name;
```

```
select concat_ws(' _ ', title, author_fname, author_lname) as 'Some Title' from books;
```
concat_ws can concat with some text like ' - '.

### Substring (substring / substr)
```
select substring('Hello World', 1, 5); --> returns 'Hello'. Note that The first position in string is 1, not 0 in sql.
select substring('Hello, World', 7); --> returns 'World'
select substring('Hello, World', -4); --> returns 'orld'
select substring(title, 1, 4) from books;
select substring(title, 1, 4) as 'Short Title' from books;
```
'substr' is the shortcut for 'substring'.
```
select substr(title, 1, 4) as 'Short Title' from books;
```

You can also combine substring with concat, as below.
```
select concat(substring(title, 1, 4), '...') as 'Short Title' from books;
```

### Replace
Note that it is case sensitive.
```
select replace('Yo, World!', 'Yo', 'Hello') as Greeting;
select replace(title, 'a', 'replaced string') as Replaced;
```

### Reverse
```
select reverse(whatever. e.g. column_name) from table_name;
select reverse(title) from books;
```
### Char_length
```
select char_length('Hello, world');

select char_length(title) from books;

select concat(author_lname, ' is ',  char_length(author_lname), ' characters long') as 'Last Name Character Length' from books;
```

### Upper, Lower
They just convert all characters to upper or lower cases.
```
select upper(title) from books;
select lower(title) from books;
```

### Distinct
removes duplicates
```
select distinct column_name from books;
select distinct author_lname from books;
select distinct author_lname, author_fname from books;
```

### Order by
```
select author_lname from books order by author_name; <--- ASC by default
select author_lname from books order by author_name desc;
select author_lname from books order by author_name; 
select title, author_lname, released_year from books order by 3 desc; <--- order by 3 means order by the third selected item (which is 'released_year' in this case).

select author_lname, author_fname from books order by 1,2; <---- can also order by multiple items 
```

### limit
limit by first specified qty from the list. <br />
Note: ```limit``` always comes last in query.
```
select * from books limit 5;
select * from books order by title desc limit 3;
```
You can also specify the starting point as below.<br />
Note: starting point of the row starts with 0 not 1 (unlike string in sql)!!
```
select * from books limit 0,5;  <---- starting point, limit
select * from books limit 10, 5; <---- starting point, limit
select * from books limit 10, 999999999999; <--- there is no way to specify for selecting the rest from specific starting point with ``limit``
```

### Like
```
select title, author_lname from books where title like '%col%'; <--- any title which contains col.
select title, author_lname from books where title like 'li%'; <-- title starting with li.
select title, author_lname from books where title like '%er'; <--- title ending with er.
```

## Logical Operators

### In

```
select title, author_lname from books where author_lname in ('Smith', 'Davis', 'Harris');
```

```
select title, author_lname from books where released_year not in (2004, 2006, 2018);
```

### Modulo
```
select title, author_lname, released_year from books where released_year%2=0 order by released_year;
```

### Case Statement
```
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
```

## Relationship
### One To Many
Primary Key and Foreign Key
```
create table customers(
    id int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

create table orders(
    id int auto_increment primary key,
    order_date date,
    amount decimal(8,2),
    customer_id int,
    foreign key(customer_id) references customers(id)
);
```
Foreign key constraint prevents creating table without id existing in another table.

### Inner Join
-- IMPLICIT INNER JOIN

```
SELECT first_name, last_name, order_date, amount
FROM customers, orders 
WHERE customers.id = orders.customer_id;
```
 
-- EXPLICIT INNER JOINS

```
SELECT first_name, last_name, order_date FROM customers
JOIN orders
ON customers.id = orders.customer_id;
```


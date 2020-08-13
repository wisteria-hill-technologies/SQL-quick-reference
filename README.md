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

## Concat
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

 
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




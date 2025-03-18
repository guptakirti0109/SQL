#Q1) Write the SQL query?

create database Assign;
use Assign;
create table employees
(emp_id varchar(10) unique not null,
emp_name char(20) not null,
age int check(age >= 18),
email varchar(30) unique,
salary int default(30000));

insert into employees(emp_id, emp_name,age,email,salary) values 
('E1','Kirti_gupta',26,'kirti@gmail.com',35000),
('B1','Krtika_saxena',25,'kritika@gmail.com',40000),
('C1','Kartik_agarwal',21,'kartik@gmail.com',31000),
('D1','Ishita_goel',30,'ishita@gmail.com',30000),
('E2','Rajat_Khandelwal',38,'rajat@gmail.com',38000);

select * from employees;

#Q2) Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
#ANS- Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.
# Constraints can be column level or table level. Column level constraints apply to a column, and table level constraints apply to the whole table.
# The following constraints are commonly used in SQL:

# NOT NULL - Ensures that a column cannot have a NULL value
# UNIQUE - Ensures that all values in a column are different
# PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
# FOREIGN KEY - Prevents actions that would destroy links between tables
# CHECK - Ensures that the values in a column satisfies a specific condition
# DEFAULT - Sets a default value for a column if no value is specified

#Q3) Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
#ANS- The NOT NULL constraint is used to enforce that a column in a table must always contain a value; it cannot contain a NULL value. By default, columns in SQL can hold NULL values, meaning they can have no data. However, for certain columns—such as IDs, names, or any required fields—you may want to enforce the rule that no NULL values can be inserted.
# This constraint is similar to a primary key constraint in that both prevent NULL values. However, they are different in their purpose and application. A primary key uniquely identifies each record in a table, while the NOT NULL constraint simply ensures that a column cannot have empty or undefined values.

#Q4)  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
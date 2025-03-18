#Q7) You have two tables.Write a query to fetch the student_name and class_name for each student using an INNER JOIN.:
create table Students
(student_id int unique not null,
student_name char(15),
class_id int);

insert into Students(student_id,student_name,class_id) values
(1,'Alice',101),
(2,'Bob',102),
(3,'Charlie',101);
select * from Students; 

create table classes
(class_id int unique,
class_name char(10));
insert into classes(class_id,class_name) values
(101,'Maths'),(102,'Science'),(103,'History');
select * from classes;

#using inner join
select students.class_id,students.student_id,students.student_name,classes.class_name 
from classes inner join students on classes.class_id = students.class_id;

#Q8)  Consider the following three tables.Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order 
#Hint: (use INNER JOIN and LEFT JOIN
create table orders
(order_id int,
order_date datetime,
customer_id int);

insert into orders(order_id,order_date,customer_id) values
(1,date('2024-01-01'),101),
(2,date('2024-01-03'),102);
select * from orders;

create table customers
(customer_id int,
customer_name char(20));

insert into customers(customer_id,customer_name) values
(101,'Alice'),
(102,'Bob');
select * from customers;

create table products
(product_id int,
product_name char(20),
order_id int);

insert into products(product_id,product_name,order_id) values
(1,'Laptop',1),
(2,'Phone',NULL);
select * from products;

select orders.order_id,customers.customer_name,products.product_name 
from orders
inner join products on
orders.order_id = products.order_id
left join customers on 
orders.customer_id = customers.customer_id;
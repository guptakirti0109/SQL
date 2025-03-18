#Q9. Given the following tables.Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

create table Sales
(sale_id int,
product_id int,
amount int);
insert into Sales(sale_id,product_id,amount) values
(1,101,500),
(2,102,300),
(3,101,700);
select * from Sales;

create table Products
(product_id int,
product_name char(10));
insert into Products(product_id,product_name) values
(101,'Laptop'),
(102,'Phone');
select * from Products;

select Sales.sale_id,Sales.product_id,Sales.amount,Products.product_id, sum(amount) as total
from Sales 
inner join Products on
Sales.product_id = Products.product_id
group by Sales.sale_id,Sales.product_id,Sales.amount;

#Q10. You are given three tables.Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

create table orders
(order_id int,
order_date datetime,
customer_id int);
insert into orders(order_id,order_date,customer_id) values
(1,date('2024-01-01'),1),
(2,date('2024-01-03'),2);
select * from customers;

create table order_details
(order_id int,
product_id int,
quantity int);
insert into order_details values
(1,101,2),
(1,102,1),
(2,101,3);
select * from order_details;

select orders.order_id,customers.customer_name,order_details.quantity
from orders
inner join customers on 
orders.customer_id = customers.customer_id
inner join order_details on
orders.order_id = order_details.order_id;
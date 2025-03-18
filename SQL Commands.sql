#SQL Commands using Maven movies database

use mavenmovies;

#Q1.Identify the primary keys and foreign keys in maven movies db. Discuss the differences
#1. film Table
#Primary Key: film_id
#Reason: Uniquely identifies each film in the database.
#Foreign Key: language_id (referencing the language table)
#Reason: The language_id links the film to the language in which the film is made.
#2. inventory Table
#Primary Key: inventory_id
#Reason: Uniquely identifies each item in the inventory (i.e., a copy of a film in the store).
#Foreign Key: film_id (referencing the film table)
#Reason: Each inventory item represents a specific film. The film_id links each item to a specific film.
#Foreign Key: store_id (referencing the store table)
#Reason: If the database has multiple stores, store_id would link each inventory item to the store where it is located.
#3. rental Table
#Primary Key: rental_id
#Reason: Uniquely identifies each rental transaction.
#Foreign Key: inventory_id (referencing the inventory table)
#Reason: The inventory_id links the rental to a specific inventory item (film copy).
#Foreign Key: customer_id (referencing the customer table)
#Reason: The customer_id links each rental to the customer who made the rental.
#4. payment Table
#Primary Key: payment_id
#Reason: Uniquely identifies each payment made for a rental.
#Foreign Key: rental_id (referencing the rental table)
#Reason: The rental_id connects a payment to a specific rental transaction.
#Foreign Key: customer_id (referencing the customer table)
#Reason: The customer_id associates the payment with the customer who made the payment.
#5. customer Table
#Primary Key: customer_id
#Reason: Uniquely identifies each customer in the database.
#6. category Table
#Primary Key: category_id
#Reason: Uniquely identifies each movie category.
#Foreign Key: film_id (referencing the film_category table)
#Reason: The film_id in the film_category table links a film to its category (e.g., Action, Comedy).
#7. store Table
#Primary Key: store_id
#Reason: Uniquely identifies each store.
#Differences Between Primary and Foreign Keys
#Primary Key	                                                       Foreign Key
#Uniquely identifies each record in a table.	            Refers to a primary key in another table.
#Ensures that each row is unique and identifiable.	        Ensures referential integrity by linking tables.
#Cannot contain NULL values.	                            Can contain NULL values (except in certain cases).
#There can only be one primary key in a table.	            A table can have multiple foreign keys.
#Enforces uniqueness within the same table.	                Enforces the relationship between tables.

#Q2.List all details of actors.
select * from actor;

#Q3.List all customer information from DB.
select * from customer;

#Q4.List different countries.
select country as Countries from country;

#Q5.Display all active customers.
select first_name,last_name,active from customer
where active = 1;

#Q6.List of all rental IDs for customer with ID 1.
select customer_id, staff_id from rental
having staff_id = 1;

#Q7.Display all the films whose rental duration is greater than 5.
select title , rental_duration from film
having rental_duration > 5;

#Q8.List the total number of films whose replacement cost is greater than $15 and less than $20.
select title, replacement_cost from film
where replacement_cost between 15 and 20;

#Q9.Display the count of unique first names of actors.
select count(distinct first_name) as Unique_name from actor;

#Q10.Display the first 10 records from the customer table.
select * from customer
limit 10;

#Q11.Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer
where first_name like 'b%'
limit 3;

#Q12.Display the names of the first 5 movies which are rated as ‘G’.
select title,rating from film
where rating = 'G'
limit 5;

#Q13.Find all customers whose first name starts with "a".
select first_name from customer
where first_name like 'a%';

#Q14.Find all customers whose first name ends with "a".
select first_name from customer
where first_name like '%a';

#Q15.Display the list of first 4 cities which start and end with ‘a’ .
select city_id,city from city
where city like 'A%' and city like '%A'
limit 4;

#Q16.Find all customers whose first name have "NI" in any position.
select customer_id,first_name,email from customer
where first_name like '%NI%';

#Q17.Find all customers whose first name have "r" in the second position .
select customer_id,first_name,email from customer
where first_name like '_r%';

#Q18.Find all customers whose first name starts with "a" and are at least 5 characters in length.
select customer_id,first_name,email from customer
where first_name like 'a____%';

#Q19.Find all customers whose first name starts with "a" and ends with "o".
select customer_id,first_name from customer
where first_name like 'a%' and first_name like '%o';

#Q20.Get the films with pg and pg-13 rating using IN operator.
select film_id,title,release_year,rating from film
where rating in ('pg','pg-13');

#Q21.Get the films with length between 50 to 100 using between operator.
select film_id,title,release_year,length from film
where length between 50 and 100;

#Q22.Get the top 50 actors using limit operator.
select actor_id,
concat(first_name,' ',last_name) as Actors from actor
limit 50;

#Q23.Get the distinct film ids from inventory table.
select distinct film_id from inventory;
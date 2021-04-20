----------------------------- SQL ASSIGNMENT 1------------------------------
--------------------------------- DEEPA J ----------------------------------

-- 1. Do we have actors in the actor table that share the full name 
-- and if yes display those shared names.
SELECT first_name, last_name FROM actor;
-- Returns a total of 200 rows.

SELECT  COUNT (DISTINCT(first_name, last_name)) FROM actor;
-- Returns a total of 199 rows.
-- This means that there are two rows that have repeated values.

SELECT first_name, last_name, COUNT(*) FROM actor
GROUP BY first_name, last_name
HAVING COUNT(*)>1;
--first_name: SUSAN, last_name: DAVIS is repeated 2 times

--------------------------**********************-----------------------------------

-- 2.  Return the customer IDs of customers who have spent at least $110 
-- with the staff member who has an ID of 2.

SELECT customer_id, staff_id, SUM(amount) AS total_amount FROM payment
GROUP BY customer_id, staff_id
HAVING staff_id=2 AND (SUM(amount)>=110);
-- Returns 2 rows, with Customer ID: 187 and 148

-------------------------------********************---------------------------

-- 3. How many films begin with the letter J?
SELECT title FROM film
WHERE title ILIKE 'J%';

-- Returns 20 films whose title starts with 'J'

-----------------------------*************************----------------------------

-- 4. What customer has the highest customer ID number whose name starts with an 'E' 
-- and has an address ID lower than 500?

SELECT first_name, last_name, address_id, customer_id FROM CUSTOMER
WHERE customer_id = (SELECT MAX(customer_id) FROM CUSTOMER
WHERE address_id<500 AND first_name ILIKE 'e%');

-- Returns the customer "Eddie Tomlin" having customer_id= 434 and address_id= 439

---------------------------*************************-----------------------------

-- 5. How many films have the word Truman somewhere in the title?

SELECT title FROM film
WHERE title ILIKE '%truman%';

-- Returns 5 film titles having Truman in it.

-------------------------------***********************---------------------------

-- 6. Display the total amount paid by all customers in the payment table.

SELECT SUM(amount) AS total_amount FROM payment;

-- The total amount paid by all customers is 61312.04

-------------------------------***********************------------------------------

-- 7. Display the total amount paid by each customer in the payment table.

SELECT customer_id, SUM(amount) AS total_amount FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- Returns the details of 599 customers and the total amount paid by them, ordered 
-- by the customer id's in ascending order.

-----------------------------*************************------------------------------

-- 8. What is the highest total_payment done?

SELECT customer_id, SUM(amount) AS total_amount FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC LIMIT 1;

-- The highest total_payment made is 211.55 by customer_id 148.

--------------------------***************************-------------------------------

-- 9. Which customers have not rented any movies so far.

SELECT DISTINCT customer_id FROM customer
ORDER BY customer_id;

-- Returns a total of 599 customers in the customer table

SELECT DISTINCT (customer_id), COUNT(*)as no_of_rentals FROM rental
GROUP BY customer_id
ORDER BY customer_id;

-- Returns a total of 599 distinct customers who have rented movies.
-- Thus, we can conclude that there are no customer who have not rented a movie.

-- Alternate Method

SELECT DISTINCT(customer_id) FROM customer
WHERE customer_id NOT IN
(SELECT DISTINCT(customer_id) FROM rental);

-- Returns no rows, implying that there are no customers who have not rented a movie.

-----------------------------**************************-----------------------------

-- 10. How many payment transactions were greater than $5.00?

SELECT COUNT(*) as no_of_trans FROM payment
WHERE amount>5.00;

-- 3618 transactions were made where amount paid is greater than $5.00

SELECT DISTINCT(payment_id) FROM payment
WHERE amount > 5;

-- Returns a total of 3618 payment id's.

-------------------------------***************************-------------------------





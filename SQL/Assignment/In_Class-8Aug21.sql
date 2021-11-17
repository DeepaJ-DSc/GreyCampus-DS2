SELECT customer_id,ROUND(AVG(amount),2) FROM payment
GROUP BY (customer_id)
ORDER BY AVG(amount) DESC;

SELECT ROUND(AVG(length),2) FROM film;

SELECT rating, ROUND(AVG(length),2) FROM film
GROUP BY rating;

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY (staff_id, customer_id);

SELECT rating, COUNT (*) FROM film
GROUP BY rating;

SELECT rating, COUNT (*) FROM film
GROUP BY rating
HAVING rating = 'R';

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY (staff_id, customer_id);

-- How many payments did each staff member handle?
SELECT staff_id, COUNT(*) AS Num_of_Transaction FROM payment
GROUP BY (staff_id);

-- What is the average replacement cost per MPAA rating?
SELECT rating, ROUND(AVG (replacement_cost),3) AS Avg_replacement_cost FROM film
GROUP BY rating;

-- What are the customer ids of the top 5 customers by total spend?
SELECT customer_id, SUM(amount) AS total_amount_spent FROM payment
GROUP BY (customer_id)
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT category_id, COUNT(*) FROM film_category
GROUP BY category_id
ORDER BY category_id;

-- Platinum status for customers having 40 or more transactions. What customer_id's are eligible for this?
SELECT customer_id, COUNT(*) AS No_of_Transaction FROM payment
GROUP BY(customer_id)
HAVING COUNT(*)>= 40;

-- What are the customer ids of the customers who spent more than $100 in payment transactions with our staff id no. 2?
SELECT customer_id, SUM(amount) AS Total_Amount FROM payment
WHERE staff_id = 2
GROUP BY(customer_id)
HAVING SUM(amount)>100;

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member 
-- who has an ID of 2.
SELECT customer_id, SUM(amount) AS Total_Amount FROM payment
WHERE staff_id = 2
GROUP BY(customer_id)
HAVING SUM(amount)>=110; 
-- Ans: Customers 187 and 148.

-- 2. How many films begin with the letter J?
SELECT COUNT(*) FROM film
WHERE title ILIKE 'j%';
-- Ans: 20.

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and 
-- has an address ID lower than 500?
SELECT first_name, last_name FROM customer
WHERE first_name ILIKE 'e%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
-- Ans: Eddie Tomlin

-- JOINS
SELECT first_name, last_name, amount FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 2;


-- UNIONS
SELECT customer_id from payment where amount >3
UNION
SELECT customer_id from rental where rental_date > '2005-08-01';


-- 1. What are the emails of the customers who live in California?
SELECT first_name, last_name, email, district FROM customer
INNER JOIN address
ON customer.address_id = address. address_id
WHERE district ILIKE 'california';

-- 2.Get a list of all the movies "Nick Wahlberg" has been in.
SELECT film.film_id, title FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name ILIKE 'nick' AND actor.last_name ILIKE 'wahlberg';












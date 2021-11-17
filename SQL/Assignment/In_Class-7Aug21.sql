SELECT first_name, last_name, email FROM customer;

SELECT DISTINCT first_name FROM customer;

SELECT DISTINCT rating from film;

SELECT COUNT (DISTINCT first_name) FROM actor;

SELECT COUNT (first_name) FROM actor;

SELECT COUNT (rating) FROM film WHERE rating = 'R';

SELECT COUNT (DISTINCT rental_id) FROM rental;

SELECT COUNT (DISTINCT language_id) FROM film;

SELECT COUNT (DISTINCT language_id) FROM language;

SELECT email FROM customer
WHERE first_name ILIKE 'nancy'
AND last_name ILIKE 'thomas';

SELECT description FROM film
WHERE title ILIKE 'outlaw hanky';

SELECT COUNT(*) FROM film
WHERE rental_rate >= 5;

SELECT title, length FROM film
WHERE title ILIKE 'Angel%';

SELECT title, length FROM film
ORDER BY length DESC;

SELECT customer_id, amount FROM payment
ORDER BY amount DESC
LIMIT 10;

SELECT title,rental_rate FROM film
WHERE rental_rate < 3
ORDER BY rental_rate
LIMIT 5;

SELECT film_id, title, length FROM film
WHERE length BETWEEN 20 AND 60
ORDER BY length;

SELECT title, description FROM film
WHERE description ILIKE '%astro%';

--1. How many payment transactions were greater than $5.00?

SELECT COUNT(*) FROM payment
WHERE amount >5;		
-- Ans: 3618

-- 2. How many actors have a first name that starts with the letter P?

SELECT COUNT(*) FROM actor
WHERE first_name ILIKE 'P%'; 	
-- Ans: 5

-- 3. How many unique districts are our customers from?

SELECT COUNT (DISTINCT district) FROM address;		
-- Ans: 378


-- 4. Retrieve the list of names for those distinct district from the previous question.

SELECT DISTINCT (district) FROM address;

-- 5. How many films have a rating R and a replacement cost between $5 and $15?

SELECT COUNT (title) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;   
-- Ans: 52

-- 6. How many films have the word TRUMAN somewhere in the title?

SELECT COUNT (title) FROM film
WHERE title ILIKE '%truman%'; 
-- Ans: 5




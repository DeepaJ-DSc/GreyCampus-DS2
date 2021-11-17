-- Sum of payments in different months.

SELECT SUM(amount) AS total_amount, EXTRACT (month FROM payment_date) AS my_month
FROM payment
GROUP BY EXTRACT (month FROM payment_date)
ORDER BY EXTRACT (month FROM payment_date);

-- Age of database
SELECT AGE(payment_date) FROM payment

-- To_char

-- Sum of payments on different days of the week.
SELECT SUM(amount) AS total_amount, EXTRACT (DOW FROM payment_date) AS my_month
FROM payment
GROUP BY EXTRACT (DOW FROM payment_date)
ORDER BY EXTRACT (DOW FROM payment_date);

-- COUNT of payments on different days of the week.
SELECT COUNT(*) AS No_of_payments, EXTRACT (DOW FROM payment_date) AS day_of_week
FROM payment
GROUP BY EXTRACT (DOW FROM payment_date)
ORDER BY EXTRACT (DOW FROM payment_date);

-- COUNT of payments on different days of the week and Day having the highsest number of payments.
SELECT COUNT(*) AS No_of_payments, EXTRACT (DOW FROM payment_date) AS day_of_week
FROM payment
GROUP BY EXTRACT (DOW FROM payment_date)
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Get a count of payments accoring to the date.
SELECT TO_CHAR(payment_date,'DD') AS date, COUNT(*)
FROM payment
GROUP BY TO_CHAR(payment_date,'DD');

-- 1. During which months did payments occur?
SELECT DISTINCT TO_CHAR(payment_date,'MONTH') AS month
FROM payment;

-- 2. How many payments occurred on Monday.
SELECT COUNT(*) AS No_of_payments, EXTRACT (DOW FROM payment_date) AS day_of_week
FROM payment 
WHERE EXTRACT (DOW FROM payment_date)=1
GROUP BY EXTRACT (DOW FROM payment_date);

-- 3. Get 10 percent of replacement cost
SELECT ROUND(replacement_cost *10/100, 2) AS deposit
FROM film;

-- Percetage of PG-13 films in inventory
SELECT rating, COUNT(*)
FROM film
GROUP BY rating
HAVING rating = 'PG-13'
-- 223

SELECT COUNT(*)
FROM film
--1000

SELECT COUNT(rating) * 0.1 FROM film
WHERE rating = 'PG-13'
GROUP BY rating





-- 1. My partner and I want to come by each of the stores in person and meet the managers. 
-- Please send over the managers’ names at each store, with the full address of each property 
-- (street address, district, city, and country).

SELECT first_name AS manager_first_name, last_name AS manager_last_name, address, district, 
city, country
FROM staff INNER JOIN address
ON staff.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id;

-- 2. I would like to get a better understanding of all of the inventory that would come along with the business. 
-- Please pull together a list of each inventory item you have stocked, including the store_id number, the 
-- inventory_id , the name of the film, the film’s rating, its rental rate and replacement cost.

SELECT store_id, inventory_id, title, rating, rental_rate, replacement_cost FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id;

-- 3. From the same list of films you just pulled, please roll that data up and provide a summary level overview 
-- of your inventory. We would like to know how many inventory items you have with each rating at each store.

SELECT store_id, rating, COUNT(*) AS inventory_items FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY store_id, rating
ORDER BY store_id, rating;

-- 4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
-- see how big of a hit it would be if a certain category of the film became unpopular at a certain store. We would
-- like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by 
-- store and film category.


SELECT store_id, name AS category, COUNT(*) AS films, SUM(replacement_cost) AS total_replacement_cost,
AVG(replacement_cost) AS avg_replacement_cost FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY store_id, name
ORDER BY store_id, name;

-- 5. We want to make sure you folks have a good handle on who your customers are. Please provide a list of all 
-- customer names, which store they go to, whether or not they are currently active, and their full addresses 
-- street address, city, and country.

SELECT first_name, last_name, store_id, active, address, city, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id


-- 6. We would like to understand how much your customers are spending with you, and also to know who your most 
-- valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and the 
-- sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value,
-- with the most valuable customers at the top of the list.

SELECT first_name, last_name, COUNT (payment.rental_id) AS total_rentals, SUM(amount) AS 
total_payment_amount FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
INNER JOIN rental
ON payment.rental_id = rental.rental_id
GROUP BY first_name, last_name
ORDER BY SUM(amount) DESC;


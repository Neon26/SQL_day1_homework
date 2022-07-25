--Week 5 - Monday Questions

--1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
--2

--2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--5602

--3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;
-- tie with 8 inventory records
--There was a tie for first so i put a limit to 1 to only show the first one from the tie.

--4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
--Returns 0

SELECT last_name
FROM customer;
--no customer with lsat name 'William'. 



--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;
-- Staff id 2 sold the most rentals.
--staff id 2 sold 32739.92
--staff id 1 sold 31212.12


--6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
--Returns 378


--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;
--film id 508 has 15 actors

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id=1,COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;
--Returns 13 customers with the last name ending in 'es'.


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT DISTINCT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
-- Returns 3 payment amounts with a number of rentals above 250 for customers with ids between 380 and 430.


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;
-- PG-13 has the most movies, with a count of 223
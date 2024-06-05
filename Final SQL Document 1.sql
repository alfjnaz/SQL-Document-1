--1. How many actors are there with the last name ‘Wahlberg’? 
select count(*) 
from actor
where last_name ='Wahlberg'

--2. How many payments were made between $3.99 and $5.99? 
select count(*) as NumberOfPayments
from payment
where amount >= 3.99 and amount <= 5.99;

--3. What film does the store have the most of? (search in inventory) 
select title, count(title) as frequentfilm
from film 
group by title

--4. How many customers have the last name ‘William’? 
select count(*)
from customer
where last_name = 'William'

--5. What store employee (get the id) sold the most rentals? 
select staff_id, COUNT(*) AS NumberOfRentals
from rental
group BY staff_id
order BY NumberOfRentals DESC
limit 1;

--6. How many different district names are there?
SELECT COUNT(DISTINCT district) AS NumberOfDistricts
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id) 
select film_id, COUNT(actor_id) AS NumberOfActors
from film_actor
group by film_id
order by NumberOfActors DESC
limit 1;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) AS NumberOfCustomers
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430?
SELECT amount, COUNT(*) AS NumberOfRentals
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
WITH RatingCounts AS (
  SELECT rating, COUNT(*) AS NumberOfMovies
  FROM film
  GROUP BY rating
)

SELECT 
  (SELECT COUNT(DISTINCT rating) FROM film) AS RatingCategories,
  rating,
  NumberOfMovies
FROM RatingCounts
ORDER BY NumberOfMovies DESC
LIMIT 1;


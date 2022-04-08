use sakila;
-- How many distinct (different) actors' last names are there?
SELECT 
COUNT(DISTINCT(last_name)) AS different_actor_names 
FROM actor;



-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *
,DATE_FORMAT(rental_date, '%M') AS 'month'
,DATE_FORMAT(rental_date, '%W') AS 'weekday'
,CASE
WHEN DATE_FORMAT(rental_date, '%W') > 5 THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM rental
ORDER BY rental_date;

-- Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- Get 10 the longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;



-- How many films include Behind the Scenes content?
SELECT *
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length),2) as 'AVG length'
FROM film
GROUP BY rating
HAVING AVG(length)>120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length,RANK () OVER (ORDER BY length DESC) AS 'rank'
FROM film
WHERE length IS NOT NULL;



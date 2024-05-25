-- Write a query to find the total number of films each actor has acted in. 
-- The result should include the actor's first name, last name, and the total number of 
-- films they have acted in, ordered by the total number of films in descending order. 
-- If two actors have the same number of films, they should be further ordered by their 
-- last name in ascending order.

SELECT 
	a.first_name,
	a.last_name,
	COUNT(fa.film_id) total_films
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
LEFT JOIN film f 
ON fa.film_id = f.film_id
GROUP BY 
	a.actor_id,
	a.first_name,
	a.last_name
ORDER BY total_films DESC, a.last_name ASC
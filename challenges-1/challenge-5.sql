SELECT a.first_name, a.last_name, COUNT(*) AS total_movies
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
GROUP BY a.first_name, a.last_name 
ORDER BY total_movies DESC

--ADD INNER JOIN IS OPTIONAL, YOU CAN USE ONLY THE KEY WORD 'JOIN'. IN THIS GIVEN CASE, WHATEVER USE
-- JOIN, INNER JOIN OR LEFT JOIN. 

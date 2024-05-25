-- Write a query to find the most popular category in terms of the number of films. 
-- The result should include the category name and the total number of films in that category. 
-- If multiple categories have the same number of films, include all such categories.

SELECT 
	name,
	total_movies
FROM
	(SELECT 
		c.name,
		COUNT(f.film_id) total_movies,
		DENSE_RANK() OVER(ORDER BY COUNT(f.film_id) DESC) rank_movies
	FROM film f
	LEFT JOIN film_category fc
	ON f.film_id = fc.film_id
	LEFT JOIN category c
	ON fc.category_id = c.category_id
	GROUP BY 
		c.category_id,
		c.name) AS sub
WHERE rank_movies = 1;
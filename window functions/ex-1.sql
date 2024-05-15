--Write a query that returns the details of movies ans average length of movies in that category

SELECT
f.film_id, title, length, name,
ROUND(AVG(length) OVER(PARTITION BY name),2) AS avg_length_category
FROM film f 
LEFT JOIN film_category fc
ON f.film_id = fc.film_id 
LEFT JOIN category c
ON fc.category_id = c.category_id
ORDER BY film_id
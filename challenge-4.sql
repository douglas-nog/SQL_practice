SELECT c.name, COUNT(title)
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name 
ORDER BY 2 DESC

--ADD INNER JOIN IS OPTIONAL, YOU CAN USE ONLY THE KEY WORD 'JOIN'. IN THIS GIVEN CASE, WHATEVER USE
-- JOIN, INNER JOIN OR LEFT JOIN. 
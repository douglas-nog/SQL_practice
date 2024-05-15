--Write a query that returns all payment details including 
--The number of payments that were made by this customer and that amount 

SELECT
f.film_id, title, length, name AS category,
ROUND(AVG(length) OVER(PARTITION BY name),2) AS avg_length_category
FROM film f 
LEFT JOIN film_category fc
ON f.film_id = fc.film_id 
LEFT JOIN category c
ON fc.category_id = c.category_id
ORDER BY film_id
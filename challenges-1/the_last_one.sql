SELECT * FROM film LIMIT 10

SELECT * FROM payment LIMIT 10
SELECT * FROM rental LIMIT 10
SELECT * FROM inventory LIMIT 10


SELECT *, (SELECT SUM(amount))
FROM payment p
LEFT JOIN rental r 
ON p.rental_id = r.rental_id
LEFT JOIN inventory i
ON r.inventory_id = i.inventory_id
LEFT JOIN film f
ON i.film_id = f.film_id
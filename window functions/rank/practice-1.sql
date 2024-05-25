SELECT 
	title,
	rental_rate,
	total_rented
FROM
	(SELECT 
		f.title,
		f.rental_rate,
		COUNT(rental_date) AS total_rented,
		DENSE_RANK() OVER(ORDER BY f.rental_rate DESC, COUNT(r.rental_id) DESC) AS rank
	FROM film f
	LEFT JOIN inventory i 
	ON f.film_id = i.film_id 
	LEFT JOIN rental r 
	ON i.inventory_id = r.inventory_id
	GROUP BY 
		f.title,
		f.rental_rate
	) AS sub
WHERE rank <= 5
ORDER BY 
 	rental_rate DESC,
	total_rented DESC;

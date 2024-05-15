SELECT 
	p.customer_id,
	DATE(payment_date),
	title,
	SUM(amount) AS total
FROM 
	payment p
LEFT JOIN 
	rental r ON p.rental_id = r.rental_id
LEFT JOIN 
	inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN 
	film f ON i.film_id = f.film_id
GROUP BY
	CUBE(
		p.customer_id,
		DATE(payment_date),
		title
	 )
ORDER BY 
	1, 2, 3
	
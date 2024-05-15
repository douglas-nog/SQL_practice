SELECT
	first_name, 
	last_name, 
	staff_id, 
	SUM(amount) as total 
FROM
	customer c
LEFT JOIN 
	payment p 
ON c.customer_id = p.customer_id
GROUP BY 
	GROUPING SETS  (
		(first_name, last_name, staff_id),
		(first_name, last_name)
	)
ORDER BY first_name
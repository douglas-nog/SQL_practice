SELECT
	first_name, 
	last_name, 
	staff_id, 
	SUM(amount) as total,
	ROUND(SUM(amount) / FIRST_VALUE(SUM(amount)) OVER(PARTITION BY first_name, last_name ORDER BY SUM(amount) DESC),2) * 100 AS percentage
FROM
	customer c
LEFT JOIN 
	payment p 
ON c.customer_id = p.customer_id
GROUP BY 
	GROUPING SETS  (
		(first_name, last_name),
		(first_name, last_name, staff_id)
	)

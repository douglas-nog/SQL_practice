SELECT
	first_name,
	last_name,
	month, 
	total_transactions,
	total_spend
FROM
	(SELECT 
		c.first_name, 
		c.last_name,
		TO_CHAR( payment_date, 'MON') AS month,
		SUM(amount) total_spend,
		COUNT(*) total_transactions,
		ROW_NUMBER() OVER(PARTITION BY TO_CHAR( payment_date, 'MON') ORDER BY SUM(amount) DESC) AS row_n
	FROM customer c
	LEFT JOIN payment p ON c.customer_id = p.customer_id
	GROUP BY 
		c.first_name, 
		c.last_name,  
		month) sub
WHERE SUB.row_n IN (1,2,3) 
ORDER BY month

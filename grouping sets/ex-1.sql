SELECT 
	TO_CHAR(payment_date, 'Month') AS month,
	TO_CHAR(payment_date, 'Year') AS year,
	staff_id, 
	SUM(amount)
FROM 
	payment
GROUP BY GROUPING SETS (
	(staff_id),
	(month),
	(year),
	(staff_id, month)
	)
ORDER BY 
	1,2
	

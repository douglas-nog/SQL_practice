SELECT staff_id, customer_id, TO_CHAR(rental_date, 'Month') AS month, COUNT(*)
FROM
	rental
GROUP BY 
	GROUPING SETS (
		(staff_id),
		(staff_id, month),
		(customer_id),
		(month)
	)
ORDER BY 
	staff_id, customer_id, count(*) DESC
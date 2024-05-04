SELECT staff_id, AVG(amount)
FROM (SELECT staff_id, customer_id, SUM(amount) as amount
	 FROM payment
	 GROUP BY staff_id, customer_id
	 ORDER BY customer_id, staff_id)
GROUP BY staff_id
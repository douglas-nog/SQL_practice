-- Write a query to find the total rental revenue generated by each customer. 
-- The result should include the customer's first name, last name, and the total rental revenue, 
-- ordered by the total revenue in descending order.

SELECT 
	c.first_name,
	c.last_name,
	SUM(amount) AS revenue
FROM customer c 
LEFT JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY 
	c.customer_id,
	c.first_name,
	c.last_name
ORDER BY revenue DESC
Level: Difficult
Topic: Uncorrelated subquery
Task: Create a list with the average of the sales amount each staff_id has per customer.
Question: Which staff_id makes on average more revenue per customer?

SELECT staff_id, AVG(amount)
FROM (SELECT staff_id, customer_id, SUM(amount) as amount
	 FROM payment
	 GROUP BY staff_id, customer_id
	 ORDER BY customer_id, staff_id)
GROUP BY staff_id
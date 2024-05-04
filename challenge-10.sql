Level: Difficult to very difficult
Topic: EXTRACT + Uncorrelated subquery
Task: Create a query that shows average daily revenue of all Sundays.
Question: What is the daily average revenue of all Sundays?
Answer: 1410.65

-- SOLUTION

SELECT AVG(amount)
FROM (SELECT DATE(payment_date) AS date, SUM(amount) AS amount
	 FROM payment
	 WHERE EXTRACT(DOW from payment_date) = 0
	 GROUP BY date)
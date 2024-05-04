--Question 12:
--Level: Very difficult
--Topic: Uncorrelated subquery
--Task: Create a list that shows the "average customer lifetime value" grouped by the different districts.
--Example:
--If there are two customers in "District 1" where one customer has a total (lifetime) spent of $1000 and the second customer has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.
--So, first, you need to calculate the total per customer and then the average of these totals per district.
--Question: Which district has the highest average customer lifetime value?
--Answer: Saint-Denis with an average customer lifetime value of 216.54.

SELECT a.district, ROUND(AVG(custumer_avg),2) AS average_customer_lifetime
FROM (SELECT customer_id, SUM(amount) AS custumer_avg
	FROM payment 
	GROUP BY customer_id) P
INNER JOIN customer c
ON c.customer_id = p.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
GROUP BY a.district
ORDER BY average_customer_lifetime DESC
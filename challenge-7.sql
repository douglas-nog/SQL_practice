SELECT city, SUM(amount) AS total_sales_city
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ct
ON a.city_id = ct.city_id
GROUP BY city
ORDER BY total_sales_city DESC
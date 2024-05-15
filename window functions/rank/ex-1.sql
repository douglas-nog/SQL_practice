SELECT * 
FROM
	(SELECT name, country, COUNT(*) AS total_payments,
	DENSE_RANK() OVER(PARTITION BY country ORDER BY COUNT(*) DESC) AS rank
	FROM customer_list c
	LEFT JOIN payment p
	ON c.id = p.customer_id
	GROUP BY name, country) 
WHERE rank IN (1,2,3)

SELECT 
	country, 
	first_name,
	last_name,
	total_payments
FROM
	(SELECT 	
		 c.customer_id, 
		first_name, 
		last_name, 
		country, 
		COUNT(*) AS total_payments,
		FIRST_VALUE(first_name) OVER(PARTITION BY country ORDER BY COUNT(*) DESC) AS first_name_max_payments
	FROM 
		customer c 
	LEFT JOIN 
		address a ON c.address_id = a.address_id
	LEFT JOIN 
		city ct ON ct.city_id = a.city_id
	LEFT JOIN 
		country cnt ON ct.country_id = cnt.country_id
	LEFT JOIN 
		payment p ON p.customer_id = c.customer_id 
	GROUP BY 
		c.customer_id, 
		country 
	) AS subquery
WHERE 
    first_name = first_name_max_payments;

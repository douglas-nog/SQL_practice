SELECT CONCAT(country || ', ' || city) AS "Country, City", SUM(amount) AS revenue
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
LEFT JOIN address a 
ON c.address_id = a.address_id
LEFT JOIN city ct
ON a.city_id = ct.city_id
LEFT JOIN country 
ON country.country_id = ct.country_id
GROUP BY "Country, City"
ORDER BY revenue 
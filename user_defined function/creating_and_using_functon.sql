CREATE OR REPLACE FUNCTION search_total_by_name (f_name VARCHAR, l_name VARCHAR)
	RETURNS NUMERIC(9,2)
	LANGUAGE plpgsql
AS 
$$
DECLARE
total_spend NUMERIC(9,2);
BEGIN
SELECT SUM(amount)
INTO total_spend
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
WHERE c.first_name = f_name AND c.last_name = l_name ; 
RETURN total_spend;
END;
$$

DROP FUNCTION search_total_by_name

SELECT SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
WHERE first_name = 'JONATHAN' AND last_name = 'SCARBOROUGH'

SELECT search_total_by_name('JONATHAN', 'SCARBOROUGH')

SELECT 
	first_name,
	last_name,
	search_total_by_name(first_name, last_name)
FROM 
	customer
ORDER BY first_name
SELECT COUNT(*) 
FROM address a
LEFT JOIN customer c
ON a.address_id = c.address_id
WHERE customer_id is null
SELECT *,
DENSE_RANK() OVER(PARTITION BY customer_id order by amount)
FROM payment
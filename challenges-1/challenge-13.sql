--Level: Very difficult
--Topic: Correlated query
--Task: Create a list that shows all payments including the payment_id, amount, and the film category (name) plus the total amount that was made in this category. Order the results ascendingly by the category (name) and as second order criterion by the payment_id ascendingly.
--Question: What is the total revenue of the category 'Action' and what is the lowest payment_id in that category 'Action'?
--Answer: Total revenue in the category 'Action' is 4375.85 and the lowest payment_id in that category is 16055.

--THE CORRELATED SUBQUERY DON'T REPRESENT THE BEST APPROACH BECAUSE IT TAKE A LOT OF TIME
--BELOW, THE PROPOSED SOLUTION BY THE PROFESSOR OF COURSE
 
SELECT title, payment_id, name, amount, 
	(SELECT SUM(amount) FROM payment p 
	LEFT JOIN rental r 
	ON r.rental_id = p.rental_id
	LEFT JOIN inventory i
	ON i.inventory_id = r.inventory_id
	LEFT JOIN film f
	ON f.film_id = i.film_id
	LEFT JOIN film_category fc 
	ON f.film_id = fc.film_id
	LEFT JOIN category c2
	ON fc.category_id = c.category_id
	WHERE c.name = c2.name)
FROM payment p 
LEFT JOIN rental r 
ON r.rental_id = p.rental_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film f
ON f.film_id = i.film_id
LEFT JOIN film_category fc 
ON f.film_id = fc.film_id
LEFT JOIN category c 
ON fc.category_id = c.category_id
ORDER BY name, payment_id

-- HERE MY PROPOSAL
SELECT f.title, p.payment_id, c.name, 
       SUM(p.amount) OVER (PARTITION BY c.name) AS total_amount
FROM payment p 
LEFT JOIN rental r ON r.rental_id = p.rental_id
LEFT JOIN inventory i ON i.inventory_id = r.inventory_id
LEFT JOIN film f ON f.film_id = i.film_id
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
ORDER BY c.name, p.payment_id;

--WINDOW FUNCTION IN THE GIVEN CASE IS MUCH MORE FAST
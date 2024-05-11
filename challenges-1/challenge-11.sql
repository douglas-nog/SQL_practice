--Level: Difficult to very difficult
--Topic: Correlated subquery
--Task: Create a list of movies - with their length and their replacement cost - that are longer than the average length in each replacement cost group.
--Question: Which two movies are the shortest on that list and how long are they?

SELECT title, length, replacement_cost 
FROM film f1
WHERE length > (SELECT AVG(length) FROM film f2
			   WHERE f1.replacement_cost = f2.replacement_cost)
ORDER BY length

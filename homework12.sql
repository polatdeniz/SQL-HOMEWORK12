SELECT COUNT(*) FROM film 
WHERE length > ANY 
(
  SELECT AVG(length) FROM film
);
------------------------------------------------------------
SELECT COUNT(*) FROM film
WHERE rental_rate =
(
  SELECT MAX(rental_rate) FROM film
);
------------------------------------------------------------
SELECT * FROM film
WHERE rental_rate = 
(
  SELECT MIN(rental_rate) FROM film
) 
AND replacement_cost = 
(
  SELECT MIN(replacement_cost) FROM film
);
----------------------------------------------------------
SELECT customer_id, first_name, COUNT(*) FROM payment
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY COUNT(*) DESC;

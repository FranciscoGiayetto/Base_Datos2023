--List all the actors that share the last name. Show them in order
SELECT first_name, last_name FROM actor
WHERE last_name IN (
    SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) > 1)
ORDER BY last_name;

--Find actors that don't work in any film
SELECT * FROM actor
WHERE actor_id NOT IN (
    SELECT DISTINCT actor_id FROM film_actor
);

--Find customers that rented only one film
SELECT customer.customer_id, customer.first_name, customer.last_name FROM customer
INNER JOIN rental ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id HAVING COUNT(DISTINCT rental.rental_id) = 1;

--Find customers that rented more than one film
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);

--List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film
        WHERE title IN ('BETRAYED REAR', 'CATCH AMISTAD')
    )
);

--List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.title = 'BETRAYED REAR'
AND a.actor_id NOT IN (
    SELECT a2.actor_id
    FROM actor a2
    INNER JOIN film_actor fa2 ON fa2.actor_id = a2.actor_id
    INNER JOIN film f2 ON f2.film_id = fa2.film_id
    WHERE f2.title = 'CATCH AMISTAD'
);


--List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.title = 'BETRAYED REAR'
AND a.actor_id IN (
    SELECT a2.actor_id
    FROM actor a2
    INNER JOIN film_actor fa2 ON fa2.actor_id = a2.actor_id
    INNER JOIN film f2 ON f2.film_id = fa2.film_id
    WHERE f2.title = 'CATCH AMISTAD'
);


--List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT a2.actor_id
    FROM actor a2
    INNER JOIN film_actor fa2 ON fa2.actor_id = a2.actor_id
    INNER JOIN film f2 ON f2.film_id = fa2.film_id
    WHERE f2.title IN ('BETRAYED REAR', 'CATCH AMISTAD')
);


use sakila;
#Find the films with less duration, show the title and rating.
SELECT title, rating, length
FROM film
WHERE length <= (SELECT MIN(length) FROM film);

#Write a query that returns the tiltle of the film which duration is the lowest. If there are more 
#than one film with the lowest durtation, the query returns an empty resultset.
SELECT title, length
FROM film AS f1
WHERE length <= (SELECT MIN(length) FROM film) AND NOT EXISTS(SELECT * FROM film AS f2 WHERE f2.film_id <> f1.film_id AND f2.length <= f1.length);

#Generate a report with list of customers showing the lowest payments done by each of them. Show customer information, 
#the address and the lowest amount, provide both solution using ALL and/or ANY and MIN.
SELECT first_name, last_name, a.address, MIN(p.amount) AS lowest_payment
FROM customer
         INNER JOIN payment as p ON customer.customer_id = p.customer_id
         INNER JOIN address as a on customer.address_id = a.address_id
GROUP BY first_name, last_name, a.address;

#Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.
SELECT first_name, last_name, a.address, MIN(p.amount) AS PagoMasBajo, MAX(p.amount) AS PagoMasAlto
from customer
         INNER JOIN payment as p on customer.customer_id = p.customer_id
         INNER JOIN address as a on customer.address_id = a.address_id
GROUP BY first_name, last_name, a.address;
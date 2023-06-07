#  <p align="center">📊 APUNTE  BASE DE DATOS 📊</p>

## Normalizacion
1. __Primera Forma Normal (1NF)__:
   
    La Primera Forma Normal se centra en eliminar la redundancia de datos y asegurar que cada columna contenga valores atómicos. Para cumplir con esta forma normal, cada tabla debe tener una clave primaria única y las columnas no deben contener valores repetidos. Además, cada valor en una columna debe ser indivisible, es decir, no puede estar compuesto por varios valores.

2. __Segunda Forma Normal (2NF)__:
   
    La Segunda Forma Normal se basa en la Primera Forma Normal y establece que una tabla debe cumplir con 1NF y además, todos los atributos no clave deben depender completamente de la clave primaria. Esto significa que si una tabla tiene una clave primaria compuesta por múltiples columnas, cada atributo no clave debe depender de todas las columnas de la clave primaria en su totalidad, y no solo de una parte de ella.

3. __Tercera Forma Normal (3NF)__:
   
    La Tercera Forma Normal también se basa en las formas normales anteriores y establece que una tabla debe cumplir con 2NF y, además, no debe tener dependencias transitivas. Esto significa que ningún atributo no clave debe depender de otro atributo no clave. Si un atributo no clave depende de otro atributo no clave, se debe crear una nueva tabla para almacenar la información y establecer una relación entre ambas tablas utilizando una clave externa.

Estas tres formas normales son parte de un proceso gradual de normalización que busca eliminar la redundancia y las anomalías en la estructura de una base de datos, mejorando así su eficiencia y coherencia. Cabe destacar que existen formas normales adicionales, como la Cuarta Forma Normal (4NF) y la Quinta Forma Normal (5NF), que abordan problemas más específicos de diseño de bases de datos.

## Alterando tablas
### Agregar Primary Keys

```sql
ALTER TABLE table_name
  ADD CONSTRAINT [ constraint_name ]
    PRIMARY KEY [ USING BTREE | HASH ] (column1, column2, ... column_n)
```
*Ejemplo* 

```sql
ALTER TABLE contacts
  ADD CONSTRAINT contacts_pk
    PRIMARY KEY (last_name, first_name);
```

### Agregar columna
```sql
ALTER TABLE table_name
  ADD new_column_name column_definition
    [ FIRST | AFTER column_name ];
```

*Ejemplo* 

```sql
ALTER TABLE contacts
  ADD last_name varchar(40) NOT NULL
    AFTER contact_id;
```

### Modificar la columna (datatype)

```sql
ALTER TABLE table_name
  MODIFY column_name column_definition
    [ FIRST | AFTER column_name ];
```

*Ejemplo* 

```sql
ALTER TABLE contacts
  MODIFY last_name varchar(50) NULL;
```

### Eliminar Columna

```sql
ALTER TABLE table_name
  DROP COLUMN column_name;
```

### Renombrar columna

```sql
ALTER TABLE table_name
  CHANGE COLUMN old_name new_name 
    column_definition
    [ FIRST | AFTER column_name ]
```

*Ejemplo* 

```sql
ALTER TABLE contacts
  CHANGE COLUMN contact_type ctype
    varchar(20) NOT NULL;
```

### Renombrar tabla

```sql
ALTER TABLE table_name
  RENAME TO new_table_name;
```

*Ejemplo* 

```sql
ALTER TABLE contacts
  RENAME TO people;
```

## SELECT

```sql
SELECT A1, A2, A3..., An
FROM T1, T2, T3,..., Tn
WHERE condition
```

### Operaciones en el WHERE

| Comparison Operator | Description                                           |
| ------------------- | ----------------------------------------------------- |
| =                   | Equal                                                 |
| <=>                 | Equal (MySql, safe to compare NULL values)            |
| <>                  | Not Equal                                             |
| !=                  | Not Equal                                             |
| >                   | Greater Than                                          |
| >=                  | Greater Than or Equal                                 |
| <                   | Less Than                                             |
| <=                  | Less Than or Equal                                    |
| BETWEEN             | Within a range (inclusive)                            |
| NOT                 | Negates a condition                                   |
| IS NULL             | NULL value                                            |
| IS NOT NULL         | Non-NULL value                                        |
| LIKE                | Pattern matching with % and _                         |
| IN ( )              | Matches a value in a list                             |
| EXISTS              | Condition is met if subquery returns at least one row |

# Simple queries

## Condiciones
```sql
SELECT title, rating, length
FROM film
WHERE length > 100;
```
```sql
SELECT title, `length` FROM film
WHERE `length` BETWEEN 100 AND 120;
```

## Mutilples Tablas
```sql
SELECT city, district
FROM address, city
WHERE address.city_id = city.city_id;
```

## Agregando distinct
```sql
SELECT [DISTINCT] country, city
FROM address, city, country
WHERE address.city_id = city.city_id
AND city.country_id = country.country_id;
```

## Condiciones en diferentes columnas
```sql
SELECT title, name
FROM film, `language`
WHERE film.language_id = language.language_id
AND film.`length` > 100 AND language.name = 'English'
```

## Ambigous column names
```sql
SELECT title, category_id
 FROM film, film_category, category
WHERE film.film_id = film_category.film_id 
  AND film_category.category_id = category.category_id
``` 

## Agregando Order BY
```sql
SELECT title, special_features, rental_rate, name
 FROM film, film_category, category
WHERE film.film_id = film_category.film_id 
  AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC
```
### Inner join con mas de una columna
```sql
SELECT title, special_features, rental_rate, name
 FROM film, film_category, category
WHERE film.film_id = film_category.film_id 
  AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC, special_features ASC
```

## Ejemplos inner join
```sql
-- Mostrar la dirección, ciudad y país de la tienda con id 1
SELECT address, city.city, country.country FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE store.store_id = 1;
```

## Ejemplo mirar elementos sin repetir con variables
```sql
-- Mostrar el par de títulos de películas y la clasificación de las películas que tienen la misma clasificación.
SELECT f1.title, f2.title, f1.rating FROM film f1, film f2
WHERE f1.film_id <> f2.film_id AND f1.rating = f2.rating
ORDER BY f1.rating;
```

## Usando Limit
```sql
SELECT * FROM actor
LIMIT 10;
```

## Like

| Wildcard | Explanation                                                          |
| -------- | -------------------------------------------------------------------- |
| %        | Allows you to match any string of any length (including zero length) |
| _        | Allows you to match on a single character                            |

```sql
SELECT *
FROM film
WHERE special_features LIKE '%Trailers%'
```
Cuando se buscan los caracteres _ %, deben ser escapados con \ (carácter de escape por defecto)

```sql
SELECT * FROM address
WHERE address LIKE '%\_%';
```
## AS
```sql
SELECT title, description, rental_rate * 150 AS "In Pesos" 
FROM film
```

### UNION
```sql
SELECT name AS val FROM category
WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION 
SELECT title  FROM film
WHERE title LIKE 'A%' OR title LIKE 'S%'
```
La operación UNION elimina los duplicados y ordena el resultado. Para ver todos los valores, se debe utilizar UNION ALL

## Table Variables

```sql
SELECT f.title, f.special_features, f.rental_rate, c.name
 FROM film f, film_category fc,  category c 
WHERE f.film_id = fc.film_id 
  AND fc.category_id = c.category_id
ORDER BY f.rental_rate DESC, f.special_features ASC
```

```sql
SELECT f1.title, f2.title, f1.`length` 
  FROM film f1, film f2
WHERE f1.`length` = f2.`length`
```

```sql
SELECT f1.title, f2.title, f1.`length` 
  FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id <> f2.film_id;
```
### [Ejercicos clase 4](Clases/clase4.sql)


## Subqueries in WHERE

### IN Operator

El operador IN te permite especificar múltiples valores en una cláusula WHERE. El operador IN es una forma abreviada de utilizar varias condiciones OR.

Ejemplo 1:

```sql
-- Find customers who paid between $3 and $4
SELECT first_name,last_name 
  FROM customer,payment 
 WHERE customer.customer_id = payment.customer_id 
   AND payment.amount BETWEEN 3 AND 4; 
```

```sql
SELECT first_name,last_name 
  FROM customer 
 WHERE customer_id IN (SELECT customer_id 
                         FROM payment 
                        WHERE amount BETWEEN 3 AND 4); 
```

Agregando simplemente DISTINCT a la primera consulta, obtenemos el mismo resultado.

Ejmplo 2:

```sql
SELECT first_name 
  FROM customer,payment 
 WHERE customer.customer_id = payment.customer_id 
   AND payment.amount = 0.99 
   AND first_name LIKE ( 'W%' ) 
 ORDER BY first_name; 
```

```sql
SELECT first_name 
  FROM customer 
 WHERE customer_id IN (SELECT customer_id 
                         FROM payment 
                        WHERE amount = 0.99) 
   AND first_name LIKE ( 'W%' ) 
 ORDER BY first_name; 
```

En este caso, agregar DISTINCT nos da un resultado incorrecto. Por lo tanto, tenemos que usar una subconsulta.

### EXCEPT en subquery

```sql
SELECT first_name, last_name 
  FROM customer 
 WHERE customer_id IN (SELECT customer_id 
                         FROM payment 
                        WHERE amount = 0.99) 
   AND customer_id NOT IN (SELECT customer_id 
                             FROM payment 
                            WHERE amount = 1.99) 
   AND first_name LIKE ( 'W%' ) 
```

### EXISTS 

El operador EXISTS se utiliza para comprobar la existencia de cualquier registro en una subconsulta. El operador EXISTS devuelve true si la subconsulta devuelve uno o más registros.

Ejemplo: encontrar clientes que comparten el nombre.

Si ejecutas esta consulta, te dará un resultado incorrecto.

```sql
SELECT first_name,last_name 
  FROM customer c1 
 WHERE EXISTS (SELECT * 
                 FROM customer c2 
                WHERE c1.first_name = c2.first_name) 
```

Este ejemplo te dará el resultado correcto (un cliente no debe compararse consigo mismo):

```sql
SELECT first_name,last_name 
  FROM customer c1 
 WHERE EXISTS (SELECT * 
                 FROM customer c2 
                WHERE c1.first_name = c2.first_name 
                  AND c1.customer_id <> c2.customer_id) 
```

#### Buscando el Maximo

```sql
-- Find films with the max duration
SELECT title,`length` 
  FROM film f1 
 WHERE NOT EXISTS (SELECT * 
                     FROM film f2 
                    WHERE f2.`length` > f1.`length`); 
```
### [Ejercicos clase 6](Clases/clase6.sql)
## ALL / ANY

**ALL** significa "devolver VERDADERO si la comparación es VERDADERA para TODOS los valores en la columna que devuelve la subconsulta".

Por ejemplo:
```sql
SELECT s1 FROM t1 WHERE s1 > ALL (SELECT s1 FROM t2);
```
Supongamos que hay una fila en la tabla t1 que contiene (10). La expresión es VERDADERA si la tabla t2 contiene (-5, 0, +5) porque 10 es mayor que los tres valores en t2.
La expresión es FALSA si la tabla t2 contiene (12, 6, NULL, -100) porque hay un solo valor, 12, en la tabla t2 que es mayor que 10. La expresión es desconocida (es decir, NULL) si la tabla t2 contiene (0, NULL, 1).

Finalmente, la expresión es VERDADERA si la tabla t2 está vacía. Por lo tanto, la siguiente expresión es VERDADERA cuando la tabla t2 está vacía:
```sql
SELECT * FROM t1 WHERE 1 > ALL (SELECT s1 FROM t2);
```

```sql
SELECT title,length 
  FROM film 
 WHERE length >= ALL (SELECT length 
                        FROM film);
```                         


```sql
UPDATE film SET length = 200 WHERE film_id = 182;

SELECT title,length 
  FROM film f1 
 WHERE length > ALL (SELECT length 
                       FROM film f2
                      WHERE f2.film_id <> f1.film_id);
```


**ANY** significa "devolver VERDADERO si la comparación es VERDADERA para CUALQUIERA de los valores en la columna que devuelve la subconsulta".
Por ejemplo:

```sql
SELECT s1 FROM t1 WHERE s1 > ANY (SELECT s1 FROM t2);
```

Supongamos que hay una fila en la tabla t1 que contiene (10). La expresión es VERDADERA si la tabla t2 contiene (21, 14, 7) porque hay un valor 7 en t2 que es menor que 10. La expresión es FALSA si la tabla t2 contiene (20, 10), o si la tabla t2 está vacía.

```sql
SELECT title,length 
  FROM film f1 
 WHERE NOT length <= ANY (SELECT length 
                       FROM film f2 
                      WHERE f2.film_id <> f1.film_id);

UPDATE film SET length = 185 WHERE film_id = 182;                       
```

```sql
-- Films whose replacement cost is higher than the lowest replacement cost 
SELECT title,replacement_cost 
  FROM film 
 WHERE replacement_cost > ANY (SELECT replacement_cost 
                                 FROM film) 
 ORDER BY replacement_cost; 

-- Same query with exists
 SELECT title,replacement_cost 
  FROM film f1 
 WHERE EXISTS (SELECT * 
                 FROM film f2 
                WHERE f1.replacement_cost > f2.replacement_cost) 
 ORDER BY replacement_cost; 
```

## Subqueries in FROM

```sql
SELECT title,description,
rental_rate,
rental_rate * 150 AS in_pesos 
  FROM film 
 WHERE rental_rate * 150 > 10.0 
   AND rental_rate * 150 < 70.0;

-- Can be written

SELECT * 
  FROM (SELECT title,description,rental_rate,rental_rate * 150 AS in_pesos 
          FROM film) g 
 WHERE in_pesos > 10.0 
   AND in_pesos < 70.0; 

```    

## Subqueries in SELECT

Este es un ejemplo para demostrar que esto también se puede hacer, existen formas más simples de hacerlo.

```sql
SELECT customer_id, 
       first_name, 
       last_name, 
       (SELECT DISTINCT amount 
          FROM payment 
         WHERE customer.customer_id = payment.customer_id 
           AND amount >= ALL (SELECT amount 
                                FROM payment 
                               WHERE customer.customer_id = payment.customer_id))
	   AS max_amount 
  FROM customer 
 ORDER BY max_amount DESC, 
        customer_id DESC;
``` 
Is equivalent to

```sql
SELECT customer_id,
	   first_name,
	   last_name,
	   (SELECT MAX(amount) 
	      FROM payment 
	     WHERE payment.customer_id = customer.customer_id) AS max_amount
  FROM customer
 ORDER BY max_amount DESC,
          customer_id DESC;
``` 

```sql
SELECT customer.customer_id, 
       first_name, 
       last_name, 
       MAX(amount) max_amount 
  FROM customer, payment 
 WHERE customer.customer_id = payment.customer_id 
 GROUP BY customer_id, first_name, last_name 
 ORDER BY max_amount DESC, customer_id DESC 
 ```
### [Ejercicos clase 7](Clases/clase7.sql)
## Agregaciones

  * La función MIN() devuelve el valor más pequeño de la columna seleccionada.
  * La función MAX() devuelve el valor más grande de la columna seleccionada.
  * La función COUNT() devuelve el número de filas que coinciden con un criterio especificado.
  * La función AVG() devuelve el valor promedio de una columna numérica.
  * La función SUM() devuelve la suma total de una columna numérica.

#### Ejemplo simple

```sql
-- Encontrar el pago mínimo de los usuarios cuyo apellido comienza con R
SELECT MIN(amount)
  FROM customer, payment
 WHERE customer.customer_id = payment.customer_id
   AND customer.last_name LIKE 'R%'
```

####  Count
```sql
--
SELECT COUNT(*)
  FROM inventory
  WHERE store_id = 1;

SELECT COUNT(DISTINCT film_id)
  FROM inventory
  WHERE store_id = 1;
```

#### ¿Cuando uso subqueries?

```sql
-- wrong result
SELECT AVG(length)
  FROM film, inventory
 WHERE film.film_id = inventory.film_id
   AND inventory.store_id = 1

-- right result
SELECT AVG (length)
  FROM film
 WHERE film_id IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1)
```

```sql
-- same AS above
SELECT  str1.av
FROM ( SELECT AVG(length) av
         FROM film
        WHERE film_id IN (SELECT film_id
 		             	        	FROM inventory
 					                 WHERE store_id = 1)) AS str1
```


```sql
SELECT other_stores.av
FROM ( SELECT AVG(length) av
         FROM film
        WHERE film_id NOT IN (SELECT film_id
 		             			FROM inventory
 					           WHERE store_id = 1)) AS other_stores
```

```sql
-- Ejemplo complejo: Calcular la diferencia entre la duración promedio de las películas en la tienda 1 y las demás tiendas.

SELECT  str1.av - other_stores.av
FROM (
SELECT AVG(length) av
  FROM film
 WHERE film_id IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1)) AS str1,
(SELECT AVG(length) av
  FROM film
 WHERE film_id NOT IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1)) AS other_stores
```

Parecido pero con subquerie en el where

```sql
SELECT
(SELECT AVG(length) av
  FROM film
 WHERE film_id IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1))
  -
(SELECT AVG(length) av
  FROM film
 WHERE film_id NOT IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1)) AS diff_avg
FROM film;
```
## Group By

La cláusula GROUP BY se utiliza en una declaración SELECT para recopilar datos de múltiples registros y agrupar los resultados según una o más columnas.

### Syntax

```sql
SELECT expression1, expression2, ... expression_n,
       aggregate_function (expression)
FROM tables
[WHERE conditions]
GROUP BY expression1, expression2, ... expression_n;
```

```sql
SELECT rating, title
  FROM film
ORDER BY rating

-- Encontrar la cantidad de películas por clasificación
SELECT rating, COUNT(*)
FROM film
GROUP BY rating

-- Encontrar la duración promedio de las películas por clasificación
SELECT rating, AVG(length)
FROM film
GROUP BY rating
```

```sql
-- Encontrar la duración de las películas por clasificación y características especiales
SELECT rating, special_features, length
FROM film
ORDER BY rating, special_features

-- Utilizando otras funciones de agregación
SELECT rating, special_features, MIN(length), MAX(length)
FROM film
GROUP BY rating, special_features

-- Trabajando con columnas agregadas en la consulta externa
SELECT mx - mn AS diff
FROM (SELECT rating, special_features, MIN(length) AS mn, MAX(length) AS mx
FROM film
GROUP BY rating, special_features) t1
```


## Having

La cláusula HAVING se utiliza en combinación con la cláusula GROUP BY para restringir los grupos de filas devueltas a solo aquellos cuya condición es VERDADERA.

#### Syntax

```sql
SELECT expression1, expression2, ... expression_n, 
       aggregate_function (expression)
FROM tables
[WHERE conditions]
GROUP BY expression1, expression2, ... expression_n
HAVING condition;
```

*Ejemplo* 

```sql
-- Encontrar clientes que hayan alquilado solo una película.
SELECT c.customer_id, first_name, last_name, COUNT(*)
  FROM rental r1, customer c
 WHERE c.customer_id = r1.customer_id
GROUP BY c.customer_id, first_name, last_name
HAVING COUNT(*) = 1
```

```sql
-- Mostrar las clasificaciones de las películas donde la duración mínima de película en ese grupo es mayor que 46.
SELECT rating, MIN(`length`)
FROM film
GROUP BY rating
HAVING MIN(`length`) > 46
```

```sql
-- Mostrar las clasificaciones que tienen menos de 195 películas.
SELECT rating, COUNT(*) AS total
FROM film
GROUP BY rating
HAVING COUNT(*) < 195

-- Igual solo que con subqueries
SELECT DISTINCT rating,
(SELECT COUNT(*) FROM film f3 WHERE f3.rating = f1.rating) AS total
FROM film f1
WHERE (SELECT COUNT(*) 
FROM film f2 WHERE f1.rating = f2.rating) < 195
```

```sql
-- Mostrar las clasificaciones donde el promedio de duración de sus películas es mayor que el promedio de duración de todas las películas.
SELECT rating, AVG(`length`)
FROM film
GROUP BY rating
HAVING AVG(`length`) > (SELECT AVG(`length`) FROM film)
```
### [Ejercicos clase 9](Clases/clase9.sql)

## PRODUCTO CARTESIANO
Esto es lo que vimos en clases anteriores para obtener resultados de varias tablas

![cartesian-product](images/cartesian-product.png)

## INNER JOIN

[INNER] JOIN selecciona todas las filas de ambas tablas participantes para que aparezcan en el resultado si y solo si ambas tablas cumplen las condiciones especificadas en la cláusula ON.

### ON clause

![inner-join](images/inner-join.png)


### Using 

Cuando los nombres de columna coinciden en ambas tablas, se puede usar la cláusula USING.

![inner-join-using-clause](images/inner-join-using-clause.png)

Example

```sql
SELECT *
  FROM film
      INNER JOIN `language`
           USING (language_id)
```

### INNER JOIN with alias

Los nombres de las tablas se pueden definir y utilizar así:

**Ejemplo**

```sql
SELECT *
  FROM film AS f
      INNER JOIN `language` AS l
              ON f.language_id = l.language_id
```              

### INNER JOIN using tres tablas

![inner-join-more-tables](images/inner-join-more-tables.png)

### Primera Parte
![inner-join-more-tables-explanation-1](images/inner-join-more-tables-explanation-1.png)


### Segunda Parte
![inner-join-more-tables-explanation-2](images/inner-join-more-tables-explanation-2.png)


### Resultado Final
![inner-join-more-tables-explanation-3](images/inner-join-more-tables-explanation-3.png)

**Ejemplo**:

```sql
SELECT * 
  FROM film 
       INNER JOIN film_category 
               ON film.film_id = film_category.film_id 
       INNER JOIN category 
               ON film_category.category_id = category.category_id; 

-- same?
SELECT *
  FROM film, film_category, category
 WHERE film.film_id = film_category.film_id
   AND film_category.category_id = category.category_id;               

-- with using
SELECT * 
  FROM film 
       INNER JOIN film_category 
            USING ( film_id ) 
       INNER JOIN category 
            USING ( category_id );               

```

## NATURAL JOIN

NATURAL JOIN es una unión que realiza la misma tarea que una INNER (o LEFT JOIN), en la que la cláusula ON o USING se refiere a todas las columnas que tienen en común las tablas que se van a unir.

MySQL NATURAL JOIN está estructurado de tal manera que las columnas con el mismo nombre de las tablas asociadas aparecerán una sola vez.

1. Las tablas asociadas tienen uno o más pares de columnas con nombres idénticos.
2. Las columnas deben ser del mismo tipo de datos.
3. No use la cláusula ON en una UNIÓN NATURAL.


![natural-join](images/natural-join.png)

**Ejemplo**:

```sql
SELECT *
  FROM film
      NATURAL JOIN `language`
```

## Ejemplos

```sql
-- find films pairs with same duration
SELECT f1.title, f2.title, f1.`length` 
  FROM film f1, film f2
 WHERE f1.`length` = f2.`length` AND f1.film_id < f2.film_id;

-- with join
SELECT f1.title, f2.title, f1.`length` 
  FROM film f1 
       INNER JOIN film f2 USING(`length`)
WHERE f1.film_id < f2.film_id
```

```sql
-- natural join the same table... ???
SELECT *
  FROM actor a1
       NATURAL JOIN actor a2
```


## LEFT OUTER JOIN
LEFT [OUTER] JOIN une dos tablas y obtiene filas en función de una condición, que coinciden en ambas tablas e incluye las filas no coincidentes de la tabla escrita antes de la cláusula JOIN.

![left-outer-join](images/left-outer-join.png)


Example:

```sql
-- add a new copy of ACADEMY DINOSAUR to store 1
INSERT INTO inventory
(film_id, store_id, last_update)
VALUES(1, 1, '2017-02-15 05:09:17.000');

-- this shows what?
SELECT title, rental.*
  FROM film
       INNER JOIN inventory USING (film_id)       
       LEFT OUTER JOIN rental USING (inventory_id)
WHERE store_id = 1 
AND film_id = 1;
```

## RIGHT OUTER JOIN

RIGHT [OUTER] JOIN une dos tablas y obtiene filas en función de una condición, que coinciden en ambas tablas e incluye las filas no coincidentes disponibles en la tabla escrita después de la cláusula JOIN.

![right-outer-join](images/right-outer-join.png)


## Ejercicios TEO
```sql
select
    first_name,
    count(rental_id), (
        select max(r.return_date)
        from rental r
        where
            r.customer_id = c1.customer_id
    ) as maximo
from customer c1
    inner join rental using(customer_id)
group by first_name, maximo;

#informe de cada cliente su cantidad de rentals y su ultima devolucion
select c2.first_name
from customer c2, (
        select
            first_name,
            count(rental_id) as cantidad,
            max(return_date) as maximo
        from customer c1
            inner join rental using(customer_id)
        group by first_name
        having cantidad > 30
    ) as t1
where
    c2.first_name = t1.first_name;

select
    first_name,
    count(rental_id) as cantidad,
    max(return_date) as maximo
from customer c1
    inner join rental using(customer_id)
group by first_name;

select title,(select avg(`length`) from film)from film;

#class may 10 select title,(select max(length) from film)from film;

#venta maxima de los ventas promedio
select payment_id, amount
from payment
WHERE amount != (
        select min(amount)
        from payment
    ) AND amount != (
        select max(amount)
        from payment
    );

select
    c.first_name,
    sum(p.amount) as monto_total
from customer c
    inner join payment p using (customer_id)
group by c.first_name
having sum(p.amount) > 11;


#la diferencia entre las dos siguientes queries, el join pone un dato al lado del otro, por lo que toma valores de mas. Mientras que la subquery hace un filtrado de datos. 
select avg(f.length)#forma incorrecta
from film f, inventory i #obtiene el promedio buscando las pelis que esten en el inventario de la tienda 1
where f.film_id = i.film_id
    and i.store_id = 1;

select avg(length) #forma correcta
from film # busca el promedio de las pelis que esten dentro de un conjunto ya filtrado
WHERE film_id in(select film_id
        from inventory
        where store_id = 1
    );
 ```

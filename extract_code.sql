SELECT 
	CONCAT(cus.first_name,'  ',cus.last_name) AS Customers,
    cus.email AS 'Customers email',
    addr.phone,
    addr.address AS Address,
    addr.location,
    addr.district,
    city.city AS Cities,
    ctry.country AS Countries,
    cus.active AS 'Active Customers',
	CONCAT(act.first_name,'  ',act.last_name) AS Actors,
    act.last_update,
    fim.title,
    textFim.description AS 'Film Description',
    fim.release_year AS 'Movie Year',
    cat.name AS 'Category Name',
    CONCAT(staf.first_name,'  ',staf.last_name) AS Staff,
    staf.email AS 'Staff email',
    staf.active AS 'Active Staff',
    staf.picture AS 'Staff Pictures',
    fim.length,
    pay.amount AS 'Amount paid',
    pay.payment_date AS 'Payment Date',
    fim.rating AS Rating
FROM sakila.actor  act
JOIN sakila.film_actor actf
ON act.actor_id=actf.actor_id
JOIN sakila.film fim
ON fim.film_id=actf.film_id
JOIN sakila.film_category fica
ON fica.film_id=actf.film_id
JOIN sakila.category cat 
ON cat.category_id=fica.category_id
JOIN sakila.inventory invt
ON invt.film_id=fim.film_id
JOIN sakila.customer cus 
ON invt.store_id=cus.store_id
JOIN sakila.staff staf
ON staf.store_id=cus.store_id
JOIN sakila.payment pay 
ON pay.customer_id=cus.customer_id
JOIN sakila.film_text textFim
ON  fica.film_id=textFim.film_id
JOIN sakila.address addr 
ON addr.address_id=cus.address_id
JOIN sakila.city city
ON city.city_id=addr.city_id
JOIN sakila.country ctry
ON city.country_id=ctry.country_id
-- JOIN sakila.
-- ON
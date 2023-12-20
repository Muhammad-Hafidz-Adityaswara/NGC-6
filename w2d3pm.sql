SELECT  * FROM actor

-- SELECT CAST (last_update as timestamp) FROM actor

-- Mengambil beberapa karakter
-- CAST, LEFT, RIGHT
SELECT first_name, LEFT(first_name,3) FROM actor
SELECT first_name, RIGHT(first_name,3) FROM actor
SELECT first_name, SUBSTRING(first_name,3,5) FROM actor


-- Menghilangkan kata : TRIM
SELECT 
	film_id, 
	TRIM(leading 'Ali' FROM title) AS film_format,
	description 
FROM film 
WHERE title ILIKE 'Ali%'


-- Menggabungkan 2 value column : CONCAT
SELECT 
	actor_id, 
	CONCAT(first_name,last_name)AS "Full Name" 
FROM actor

SELECT 
	actor_id, 
	CONCAT(first_name,' ',last_name)AS "Full Name" 
FROM actor

SELECT 
	actor_id, 
	UPPER(CONCAT(first_name,' ',last_name,'(',actor_id,')')) AS "Full Name" 
FROM actor


-- EXTRACT
SELECT * FROM PAYMENT

SELECT payment_id, payment_date FROM payment

SELECT payment_id, EXTRACT(DOY FROM payment_date) FROM payment

SELECT 
	payment_id, 
	EXTRACT(DAY FROM payment_date) AS day,
	EXTRACT(MONTH FROM payment_date) AS month,
	EXTRACT(YEAR FROM payment_date) AS year
FROM payment


-- Contoh extact pada where
-- mendapatkan total payment yang diterima
-- pada tanggal 15,20,25
SELECT SUM(amount) FROM payment
WHERE EXTRACT(DAY FROM payment_date) IN (15,20,25)


-- CASE..END
SELECT 
	payment_id, 
	amount,
		CASE
			WHEN amount < 3 THEN 'Low'
			WHEN amount >3 AND amount <=6 THEN 'Medium'
			ELSE 'High'
		END
FROM payment
WHERE EXTRACT(DAY FROM payment_date) = 1
LIMIT 6

-- < 3 = low
-- 3 - 6 = Medium
-- > 6 = high


-- Subquery
SELECT amount FROM payment
ORDER BY amount DESC

SELECT * FROM payment
WHERE amount = (SELECT MAX(amount) FROM payment)

SELECT COUNT(amount) FROM payment
WHERE amount = (SELECT MAX(amount) FROM payment)















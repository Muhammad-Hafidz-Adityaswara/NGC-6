-- -- Create the students table
-- CREATE TABLE students (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(50),
--     age INTEGER,
--     campus_id INTEGER,
--     total_grade FLOAT
-- );

-- -- Insert data into the students table
-- INSERT INTO students (name, age, campus_id, total_grade)
-- VALUES
--     ('Rafif Iman', 20, 1, 85.5),
--     ('Hana Arisona', 21, 2, 90.2),
--     ('Raka Purnomo', 19, 1, 78.9),
--     ('Danu Irfansyah', 20, 3, 92.7),
--     ('Rachman Ardhi', 22, 2, 88.1);

-- -- Create the campus table
-- CREATE TABLE campus (
--     id SERIAL PRIMARY KEY,
--     campus_name VARCHAR(50),
--     batch VARCHAR(10),
--     start_date DATE
-- );

-- -- Insert data into the campus table
-- INSERT INTO campus (campus_name, batch, start_date)
-- VALUES
--     ('Remote', 'RMT-1', '2023-01-01'),
--     ('Jakarta', 'HCK-2', '2023-02-01'),
--     ('BSD', 'BSD-4', '2023-03-01'),
--     ('Surabaya', 'SUB-1', '2023-04-01'),
--     ('Singapore', 'SIN-1', '2023-05-01');



-- SELECT * FROM campus;

SELECT * FROM students;

-- SELECT name, total_grade FROM students;
SELECT name, total_grade as grade FROM students;


-- SELECT name, age FROM students;
-- DISTINCT untuk menampilkan data unique
SELECT DISTINCT age FROM students;

SELECT name, age FROM students
WHERE age > 20

SELECT name, age FROM students
WHERE age >= 21 AND age <= 22;

SELECT name, age FROM students
WHERE age BETWEEN 21 AND 22;



-- " " : nama tabel, nama column
-- ' ' : varchat, text --> value string

-- Text
SELECT * FROM students
WHERE name = 'Rafif Iman';

-- Menampilkan data yang namanya diawali huruf 'Ra'
SELECT * FROM students
WHERE name LIKE 'Ra%';

-- Untuk tidak case sensitive
SELECT * FROM students
WHERE name ILIKE 'ra%';

-- Untuk menampilkan nama yang terdapat huruf 'o'
SELECT * FROM students
WHERE name ILIKE '%o%';

-- Untuk menampilkan nama yang terdapat huruf 'o' dan huruf 'a'
SELECT * FROM students
WHERE name ILIKE '%o%' AND name ILIKE '%a%';

-- Untuk menampilkan nama yang terdapat huruf 'n' pada huruf ketiga
SELECT * FROM students
WHERE name ILIKE '__n%';

SELECT * FROM students
WHERE name ILIKE '%a_';

-- Menampilkan data yang namanya ada huruf 0 dan umur diatas 20
SELECT * FROM students
WHERE name ILIKE '%o%'
AND age > 20;

-- Menampilkan data yang namanya ada huruf 0 atau umur diatas 20
SELECT * FROM students
WHERE name ILIKE '%o%'
OR age > 20;

-- Menampilkan data yang tidak ada huruf 'o'
SELECT * FROM students
WHERE name NOT ILIKE '%o%'

-- Case Sensitive
SELECT * FROM students
WHERE name = 'RAFIF IMAN';


-- Menampilkan data yang age nya 20,22,19
SELECT * FROM students
WHERE age = 20 OR age = 22 OR age = 19;

-- Menampilkan data yang age nya 20,22,19 v
SELECT * FROM students
WHERE age IN (19,20,22)



-- == Aggregate Function ==

-- COUNT menghitung data
SELECT COUNT (total_grade) FROM students;

-- SUM mentotal data
SELECT SUM (total_grade) FROM students;

-- ===========
SELECT 
	MAX(total_grade) AS "Max Grade",
	MIN(total_grade) AS "Min Grade",
	AVG(total_grade) AS average,
	SUM(total_grade) AS total,
	COUNT(total_grade) 
FROM students;
-- ===========


-- == Group by ==

SELECT MAX(total_grade) FROM students
GROUP BY age;

-- Menampilan maximal total grade dan age , yg digroup dari age
SELECT age, MAX(total_grade) FROM students
GROUP BY age;

-- Menampilan maximal total grade dan age , 
-- yg digroup dari age
-- dan HAVING (kondisi) MAX MAX(total_grade) > 80

SELECT age, MAX(total_grade) FROM students
GROUP BY age
HAVING MAX(total_grade) > 80;

--Filtering data sebelum aggregate (WHERE)
SELECT age, COUNT(age), MAX(total_grade) FROM students
WHERE (total_grade) > 80
GROUP BY age;

-- Filtering hasil aggregate yang di group
SELECT age,  COUNT(age),MAX(total_grade) FROM students
GROUP BY age
HAVING MAX(total_grade) > 80;

-- == ORDER ==
SELECT * FROM students
ORDER BY age;

SELECT * FROM students
ORDER BY age DESC;

SELECT * FROM students
ORDER BY age DESC, name;

SELECT * FROM students
ORDER BY age DESC, name ASC;

SELECT 
	age,  
	COUNT(age),
	MAX(total_grade) AS maximum 
FROM students
GROUP BY age
ORDER BY maximum

SELECT * FROM students
LIMIT 1000;

SELECT * FROM students
ORDER BY age
LIMIT 3;



-- == JOIN ==
SELECT 
	s.id,
	s.name,
	c.id AS cid,
	c.campus_name
FROM students s
JOIN campus c ON c.id = s.campus_id;

SELECT 
	s.id,
	s.name,
	c.id AS cid,
	c.campus_name
FROM students s
LEFT JOIN campus c ON c.id = s.campus_id


SELECT 
	s.id,
	s.name,
	c.id AS cid,
	c.campus_name
FROM students s
RIGHT JOIN campus c ON c.id = s.campus_id


SELECT 
	s.id,
	s.name,
	c.id AS cid,
	c.campus_name
FROM students s
JOIN campus c ON c.id = s.campus_id
WHERE c.campus_name IN ("Jakarta", "Remote")





















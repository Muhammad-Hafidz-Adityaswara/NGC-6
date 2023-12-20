CREATE DATABASE w2d2;

-- Membuat table
CREATE TABLE instructors (
	id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	gender varchar
);

-- Akan ada pesan bahwa table buddies telah dibuat atau belum
CREATE TABLE IF NOT EXISTS buddies (
	id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	gender varchar,
	instructor_id INT,
	FOREIGN KEY (instructor_id)
		REFERENCES instructors (id)
);

-- dorp 1 table
DROP TABLE instructors;
DROP TABLE buddies;

-- drop multiple table
DROP TABLE instructors, buddies;


-- Mengupdate atau menambahkan tabel
-- ALTER
ALTER TABLE instructors
	ADD COLUMN age INT;


-- TRUNCATE tidak bisa digunakan di table sumber
TRUNCATE TABLE buddies;
-- Jika ingin menghapus sumber (akan menghapus seluruhnya)
TRUNCATE TABLE instructors CASCADE;


-- INSERT (menambahkan data)
INSERT INTO instructors (name, gender, age)
VALUES (Hafidz, 'Male', 22);

-- INSERT MULTIPLE (menambahkan data)
INSERT INTO instructors (name, gender, age)
VALUES
	('Yuda', 'Male', 20),
	('Ayu', 'Female', 18),
	('Rafif', 'Male', 24),
	('Riki', 'Male', NULL);
	

-- Menampilkan seluruh data pada tabel instructors 
SELECT *
FROM instructors
ORDER BY id ASC; --Untuk mengurutkan id


-- Mengubah kolom name yang ber id 6
UPDATE instructors
SET name = 'Hafidz'
WHERE id = 6;

-- Menghapus data 1 baris yang ber id 5
DELETE FROM instructors
WHERE id = 5;


-- Menampilkan data yang lebih detail
EXPLAIN SELECT *
FROM instructors
ORDER BY id ASC;
---
EXPLAIN ANALYZE SELECT *
FROM instructors
ORDER BY id ASC;



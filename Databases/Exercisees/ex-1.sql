CREATE DATABASE personsdb
	COLLATE Cyrillic_General_CI_AS;
 
/*Коя база данни да използва: */
GO
USE personsdb;
 
CREATE TABLE persons
/*opisvame kolonite i tehniq tip*/
(
	personal_id CHAR(10) PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	surname VARCHAR(20),
	family VARCHAR(20) NOT NULL,
	address VARCHAR(25),
	weight DECIMAL(6,3),
)
 
/*въвеждаме записи в таблицата:*/
/*ако въвеждам във всички колони мога да изтърва имената на колоните ето така: 
INSERT INTO persons
*/
INSERT INTO persons (personal_id, name, surname, family, address, weight)
VALUES ('9910104546', 'Петър', 'Петров', 'Петров', 'бул. Съединение 45', 100.5);
/*ако въвеждаме само в някои колони трябва да опишем кои са те: */
INSERT INTO persons (personal_id, name, family)
VALUES ('9910104547', 'Жак', 'Семизов');
/*ако въвеждаме няколко нови записа, ги разделяме със запетая: */
INSERT INTO persons
VALUES 
	('9404110987', 'Иван', 'Иванов', 'Иванов', 'Пловдив', 92.3),
	('9511072387', 'Милена', 'Колева', 'Томова', 'Варна', 68),
	('9501025423', 'Анета', 'Димова', 'Димова', 'Пловдив', 72.500);
 
-- извличане на всички колони от дадена таблица
SELECT * FROM persons
 
-- извличане на определени колони от дадена таблица
SELECT name, family, address 
FROM persons
 
-- извличане на определени колони от дадена таблица със зададена филтър
SELECT name, family, address 
FROM persons
WHERE personal_id='9404110987'
 
-- модифицираме запис от таблицата
UPDATE persons -- v koq tablica
SET family = 'Димова' -- kakva promqna prawq
WHERE  personal_id='9511072387' -- tochno na koi zapis
 
-- изтриване на таблица таблицата
DELETE FROM persons
WHERE name='Милена' AND family='Томова'
 
/*	NULL(po podrazbirane), 
	NOT NULL, 
	DEFAULT, 
	задава се така:
	registered DATETIME DEFAULT GETDATE()
 
	IDENTITY- автоматично да се попълва информация
	задава се така:
	person_id INT IDENTITY(10,2)
	т.е започва с 10 и всяко следващо увеличава с 2
	*/
 
/*
PRIMARY KEY- единствена колона в таблицата, не може да е NULL, съдържа уникални стойности
на ниво колона:
personal_id CHAR(10) PRIMARY KEY,
задаваме ограничение: 
	CONSTRAINT име_на_ограничение тин_на_ограчение име_на_колони
	например:
	CONSTRAINT pk_persons PRIMARY KEY (personal_id);
 
UNIQUIE- може да има няколко колони в таблицата, не може да е NULL, съдържа уникални стойности;
 
FOREIGN KEY- външен ключ
на ниво колона:
address VARCHAR(25) FOREIGN KEY REFERENCES addresses(address)
задаваме ограничение: 
	CONSTRAINT име_на_ограничение FOREIGN KEY REFERENCES име_на_таблица(име_на_колонa) ON DELETE CASCADE
	например:
	CONSTRAINT fk_persons FOREIGN KEY () REFERENCES addresses(address);
 
ON DELETE CASCADE - когато се изтрие записът във външната таблица, се трие и записът в нашата колона
ON UPDATE CASCADE - 
;
 
CHECK- проверява стойността в колоната да спазва определени правила
на ниво колона:
assesment TINYINTG check_assesment CHECK (assesment BETWEEN 2 AND 6)
*/
 
/*ako iskame da iztriem baza ot danni izpolzwame komandata: 
 DROP DATABASE db_name*/
 
/*ako iskame da iztriem tablica izpolzwame komandata: 
DROP TABLE table_name*/
 
/*
модифициране на структурата на таблица- добавяне на нови колони след като преди вече е била създадена
ALTER TABLE persons
ALTER COLUMN name
 
	ADD- добавяне, 
	DROP- изтриване, 
	WITH NOCHECK- модифицираме дадената колона без да правим проверка на вече въведените данни
*/
 
 
-- самостоятелно упражнение
CREATE TABLE students
(
	student_id INT,
	id CHAR(10) NOT NULL,
	name VARCHAR(20) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	phoneNumber VARCHAR(10) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (student_id)
)
 
ALTER TABLE students
DROP CONSTRAINT pk_persons;
 
ALTER TABLE students
ADD CONSTRAINT pk_persons PRIMARY KEY (id);
 
ALTER TABLE students
ALTER COLUMN phoneNumber VARCHAR(12) NOT NULL;
 
ALTER TABLE students
DROP COLUMN phoneNumber;
 
ALTER TABLE students
ADD email VARCHAR(15) NULL;
 
SELECT * FROM students;
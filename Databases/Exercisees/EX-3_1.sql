CREATE DATABASE students_db

GO
USE students_db

/*
INSERT [INTO] table_name [(column_list)]
(DEFAULT VALUES | <values_list> | select_statement ) [, ...n]
*/

CREATE TABLE students
(
	faculty_number VARCHAR(9) NOT NULL,
	pname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NULL,
	age TINYINT DEFAULT 18,
	CONSTRAINT pk_faculty_number PRIMARY KEY (faculty_number)
);


/*1ви начин- ако въвеждаме всички колони в техния ред, няма нужда да ги описваме допълнително в скоби*/
INSERT INTO students /*(faculty_number, pname, lname, phone, age)*/
VALUES ('161162163', 'Иван', 'Иванов', '0331 123123', 19);

INSERT INTO students 
VALUES ('161162166', 'Иванка', 'Николова', NULL, DEFAULT);

/*2ри начин- ако въвеждаме част от данните в даден запис или в разбъркан ред, трябва да си опищем в скоби*/
INSERT INTO students (pname, lname, phone, age, faculty_number)
VALUES ('Петър', 'Петров', '0331 111222', 19, '161162164');

/*3ти начин- попълваме част от данните и СУБД допълва липсващите*/
INSERT INTO students (faculty_number, pname, lname)
VALUES ('161162165', 'Георги', 'Георгиев');

-- Връща грешка, защото сме пропуснали задължително поле lname
--INSERT INTO students (faculty_number, pname)
--VALUES ('161162165', 'Георги');

/*4ти начин- добавяме много редове наведнъж*/
--

SELECT * FROM students

ALTER TABLE students
/*при ALTER TABLE, когато добавяме нова колона, не можем да й зададем ограничение NOT NULL*/
ADD graduated BIT DEFAULT 0;


/*нова таблица*/
CREATE TABLE graduated_students
(
	f_num VARCHAR(9) NOT NULL,
	p_name VARCHAR(50) NOT NULL,
	family VARCHAR(50) NOT NULL,
	CONSTRAINT pk_f_num PRIMARY KEY (f_num)
)

SELECT * FROM graduated_students

INSERT INTO graduated_students (f_num, p_name, family)
SELECT faculty_number, pname, lname
FROM students
WHERE graduated =1;

/*обновяване на съществуващ запис
Update table_name
SET <column_list>
[WHERE clause]

<column_list> ::= column_name = {expression | DEFAULT | NULL}
*/
UPDATE students 
SET graduated =1
WHERE faculty_number ='161162165'

UPDATE students 
SET pname ='Стоян'
WHERE faculty_number ='161162165'


-- ще променим всички записи, защото нямаме WHERE
UPDATE students 
SET pname ='Петко', lname='Петков'

INSERT INTO students (faculty_number, pname, lname)
VALUES ('161162169', 'снакцйхн', 'цлихсзц');
/* изтриване на запис
DELETE [FROM] table_name
[WHERE clause]
*/
DELETE FROM students
WHERE faculty_number ='161162169'

--трием всички записи, но не и таблицата
/*1ви начин*/
--DELETE FROM students (Ако имаме брояч, ще продължи от същото място напр. първичен ключ от 518)
/*2ри начин*/
--TRUNCATE TABLE table_name  (Ако имаме брояч, ще започне отначало напр. първичен ключ от 500)

 GO
USE LIBRARY
 
-- zad 1
INSERT INTO books
VALUES
	('1205', 'Красавицата и Звяра', 10.5, 2022),	
	('1206', 'Под игото', 15, 2000),	
	('1207', 'Снежанка', 20, 2023);
 
INSERT INTO authors
VALUES
	('1015', 'Иван', 'Вазов'),	
	('1016', 'Михаил', 'Билалав'),	
	('1017', 'Димитър', 'Рачков');
 
INSERT INTO clients
VALUES
	('9015', 'Стоян', 'Камбуров', 'kushtata na tqnata', '0897699358'),	
	('9016', 'Лидия', 'Димитрова', 'apartamenta na lidka', '0862499571'),	
	('9017', 'Жак', 'Семизов', 'kushtata na zhak', '0836482130');
 
 
INSERT INTO book_authors
VALUES
	('1205', '1015'),
	('1206', '1016'),
	('1207', '1017');
 
INSERT INTO clients_books
VALUES
	('1205','9015','10.03.2024', NULL),
	('1206','9016','10.01.2024', '20.02.2024'),
	('1207','9017','10.03.2024', '18.03.2024');
 
	--zad 2
INSERT INTO authors
VALUES
	('1018', 'Carlos', 'Corone'),	
	('1019', 'Steven', 'Morris');
 
ALTER TABLE books
DROP COLUMN title
 
ALTER TABLE books
ADD title VARCHAR(105)
 
INSERT INTO books
VALUES
	('1337627909', 134.95, 2019, 'Database Systems: Design, Implementation, & Management');
 
INSERT INTO book_authors
VALUES
	('1337627909', '1018'),
	('1337627909', '1019');
 
	--ZAD 3
INSERT INTO clients
VALUES
	('1234', 'Мария', 'Георгиева,', 'kushtata na mara', '0875633458');
 
	--Zad 4
INSERT INTO clients_books
VALUES
	('1337627909','1234','05.01.2023', NULL);
 
	--zad 5
	UPDATE clients
	SET pname='Милена'
	WHERE client_id='1234'
 
	--ZAD 6
	UPDATE clients_books
	SET returned_date='12.01.2023'
	WHERE isbn='1337627909'
 
	--ZAD 7
	DELETE books
	WHERE price < 2
 
	--ZAD 8
	DELETE FROM book_authors
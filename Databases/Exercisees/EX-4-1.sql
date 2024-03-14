CREATE DATABASE LIBRARY;
 
GO
USE LIBRARY
 
--2.1
CREATE TABLE books
(
	isbn VARCHAR(20) NOT NULL,
	title VARCHAR(45) NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	publ_year INT
 
	CONSTRAINT pk_isbn PRIMARY KEY (isbn)
)
 
CREATE TABLE authors
(
	author_id INT NOT NULL,
	name VARCHAR(20) NOT NULL,
	lname VARCHAR(20) NOT NULL,
 
	CONSTRAINT pk_author_id PRIMARY KEY (author_id)
)
 
CREATE TABLE clients
(
	client_id INT NOT NULL,
	pname VARCHAR(45) NOT NULL,
	lname VARCHAR(45) NOT NULL,
	email INT
 
	CONSTRAINT pk_client_id PRIMARY KEY (client_id)
)
 
CREATE TABLE book_authors
(
	isbn VARCHAR(20) NOT NULL,
	author_id INT NOT NULL,
 
	CONSTRAINT fk_book_authors_books FOREIGN KEY (isbn) REFERENCES books(isbn) ON UPDATE CASCADE,
	CONSTRAINT fk_book_authors_authors FOREIGN KEY (author_id) REFERENCES authors(author_id) ON UPDATE CASCADE
)
 
CREATE TABLE clients_books
(
	isbn VARCHAR(20) NOT NULL,
	client_id INT NOT NULL,
	taken_date VARCHAR(45) NOT NULL, 
	returned_date VARCHAR(45),
 
	CONSTRAINT fk_clients_books_books FOREIGN KEY (isbn) REFERENCES books(isbn),
	CONSTRAINT fk_clients_books_clients FOREIGN KEY (client_id) REFERENCES clients(client_id),
)
 
--2.2
ALTER TABLE clients
ALTER COLUMN email VARCHAR(50) NOT NULL
 
--2.3
ALTER TABLE clients
DROP COLUMN email 
 
ALTER TABLE clients
ADD address VARCHAR(30) NULL
 
ALTER TABLE clients
ADD phone VARCHAR(25) NOT NULL
 
--2.4
ALTER TABLE clients_books
ADD CONSTRAINT pk_client_books PRIMARY KEY (isbn, client_id, taken_date)
 
--2.5
ALTER TABLE book_authors
DROP CONSTRAINT fk_book_authors_authors
 
--2.6
ALTER TABLE book_authors
ADD CONSTRAINT fk_book_authors_authors FOREIGN KEY (author_id) REFERENCES authors(author_id) ON UPDATE CASCADE
 
ALTER TABLE book_authors
ADD CONSTRAINT pk_book_authors PRIMARY KEY (author_id, isbn)
 
SELECT * FROM clients

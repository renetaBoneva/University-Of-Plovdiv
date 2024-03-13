CREATE DATABASE personsdb;

/*��� ���� ����� �� ��������: */
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

/*��������� ������ � ���������:*/
/*��� �������� ��� ������ ������ ���� �� ������� ������� �� �������� ��� ����: 
INSERT INTO persons
*/
INSERT INTO persons (personal_id, name, surname, family, address, weight)
VALUES ('9910104546', '�����', '������', '������', '���. ���������� 45', 100.5);
/*��� ��������� ���� � ����� ������ ������ �� ������ ��� �� ��: */
INSERT INTO persons (personal_id, name, family)
VALUES ('9910104547', '���', '�������');
/*��� ��������� ������� ���� ������, �� ��������� ��� �������: */
INSERT INTO persons
VALUES 
	('9404110987', '����', '������', '������', '�������', 92.3),
	('9511072387', '������', '������', '������', '�����', 68),
	('9501025423', '�����', '������', '������', '�������', 72.500);

-- ��������� �� ������ ������ �� ������ �������
SELECT * FROM persons

-- ��������� �� ���������� ������ �� ������ �������
SELECT name, family, address 
FROM persons

-- ��������� �� ���������� ������ �� ������ ������� ��� �������� ������
SELECT name, family, address 
FROM persons
WHERE personal_id='9404110987'

-- ������������ ����� �� ���������
UPDATE persons -- v koq tablica
SET family = '������' -- kakva promqna prawq
WHERE  personal_id='9511072387' -- tochno na koi zapis

-- ��������� �� ������� ���������
DELETE FROM persons
WHERE name='������' AND family='������'

/*	NULL(po podrazbirane), 
	NOT NULL, 
	DEFAULT, 
	������ �� ����:
	registered DATETIME DEFAULT GETDATE()

	IDENTITY- ����������� �� �� ������� ����������
	������ �� ����:
	person_id INT IDENTITY(10,2)
	�.� ������� � 10 � ����� �������� ��������� � 2
	*/
	
/*
PRIMARY KEY- ���������� ������ � ���������, �� ���� �� � NULL, ������� �������� ���������
�� ���� ������:
personal_id CHAR(10) PRIMARY KEY,
�������� �����������: 
	CONSTRAINT ���_��_����������� ���_��_��������� ���_��_������
	��������:
	CONSTRAINT pk_persons PRIMARY KEY (personal_id);

UNIQUIE- ���� �� ��� ������� ������ � ���������, �� ���� �� � NULL, ������� �������� ���������;

FOREIGN KEY- ������ ����
�� ���� ������:
address VARCHAR(25) FOREIGN KEY REFERENCES addresses(address)
�������� �����������: 
	CONSTRAINT ���_��_����������� FOREIGN KEY REFERENCES ���_��_�������(���_��_�����a) ON DELETE CASCADE
	��������:
	CONSTRAINT fk_persons FOREIGN KEY REFERENCES addresses(address);
	
ON DELETE CASCADE - ������ �� ������ ������� ��� �������� �������, �� ���� � ������� � ������ ������
ON UPDATE CASCADE - 
;

CHECK- ��������� ���������� � �������� �� ������ ���������� �������
�� ���� ������:
assesment TINYINTG check_assesment CHECK (assesment BETWEEN 2 AND 6)
*/

/*ako iskame da iztriem baza ot danni izpolzwame komandata: 
 DROP DATABASE db_name*/

/*ako iskame da iztriem tablica izpolzwame komandata: 
DROP TABLE table_name*/

/*
������������ �� ����������� �� �������- �������� �� ���� ������ ���� ���� ����� ���� � ���� ���������
ALTER TABLE persons
ALTER COLUMN name

	ADD- ��������, 
	DROP- ���������, 
	WITH NOCHECK- ������������ �������� ������ ��� �� ������ �������� �� ���� ���������� �����
*/


-- ������������� ����������
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
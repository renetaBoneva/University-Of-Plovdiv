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


/*1�� �����- ��� ��������� ������ ������ � ������ ���, ���� ����� �� �� �������� ������������ � �����*/
INSERT INTO students /*(faculty_number, pname, lname, phone, age)*/
VALUES ('161162163', '����', '������', '0331 123123', 19);

INSERT INTO students 
VALUES ('161162166', '������', '��������', NULL, DEFAULT);

/*2�� �����- ��� ��������� ���� �� ������� � ����� ����� ��� � ��������� ���, ������ �� �� ������ � �����*/
INSERT INTO students (pname, lname, phone, age, faculty_number)
VALUES ('�����', '������', '0331 111222', 19, '161162164');

/*3�� �����- ��������� ���� �� ������� � ���� ������� ����������*/
INSERT INTO students (faculty_number, pname, lname)
VALUES ('161162165', '������', '��������');

-- ����� ������, ������ ��� ���������� ������������ ���� lname
--INSERT INTO students (faculty_number, pname)
--VALUES ('161162165', '������');

/*4�� �����- �������� ����� ������ ��������*/
--

SELECT * FROM students

ALTER TABLE students
/*��� ALTER TABLE, ������ �������� ���� ������, �� ����� �� � ������� ����������� NOT NULL*/
ADD graduated BIT DEFAULT 0;


/*���� �������*/
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

/*���������� �� ����������� �����
Update table_name
SET <column_list>
[WHERE clause]

<column_list> ::= column_name = {expression | DEFAULT | NULL}
*/
UPDATE students 
SET graduated =1
WHERE faculty_number ='161162165'

UPDATE students 
SET pname ='�����'
WHERE faculty_number ='161162165'


-- �� �������� ������ ������, ������ ������ WHERE
UPDATE students 
SET pname ='�����', lname='������'

INSERT INTO students (faculty_number, pname, lname)
VALUES ('161162169', '��������', '�������');
/* ��������� �� �����
DELETE [FROM] table_name
[WHERE clause]
*/
DELETE FROM students
WHERE faculty_number ='161162169'

--����� ������ ������, �� �� � ���������
/*1�� �����*/
--DELETE FROM students (��� ����� �����, �� �������� �� ������ ����� ����. �������� ���� �� 518)
/*2�� �����*/
--TRUNCATE TABLE table_name  (��� ����� �����, �� ������� �������� ����. �������� ���� �� 500)

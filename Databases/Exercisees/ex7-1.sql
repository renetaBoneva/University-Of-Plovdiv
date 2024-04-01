GO
USE personsdb;

/*	ФУНКЦИИ	*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

/* - Агрегатни(обобщаващи)- SELECT, HAVING
Извършват изчисления върху група от записи;
Въръща се една стойност
aggregate_function ([ALL|DISTINCT]) израз

SUM; AVG; MAX; MIN; игнорират NULL стойностите
COUNT(*)- връща броя на всички записи без да се игнорират NULL стойностите
*/

--зад 1
--извеждане на теглата с цел проверка
SELECT weight FROM persons;

--сума на теглата
SELECT SUM(weight) AS 'Общо тегло' FROM persons;

--зад 2
-- Да се изведе средно тегло, минимални, максимално на хората
SELECT AVG(weight) AS 'avg',
		MIN(weight) AS 'min',
		MAX(weight) AS 'max'
FROM persons

--зад 3
-- Да се изведе броя на всички хора и хората с адреси
SELECT name, family, address FROM persons

SELECT COUNT(*) AS 'Брой хора',
	COUNT(address) AS 'Брой известни адреси' --НЕ брои NULL стойностите
FROM persons

--зад 4
--Да се изведе броя на хората без адреси
SELECT COUNT(*) AS 'Брой на хора БЕЗ адреси' 
FROM persons 
WHERE address IS NULL;

-------------------------------------------------------------------------------------------------------------------------------------------------------
/*
- Конвертиращи 
От един към друг тип;
извеждат резултата от изчислението
CAST; CONVERT; PARSE; TRY_CAST; TRY_CONVERT; TRY_PARSE

CAST (expression AS data_type[(lenght)])

CONVERST (data_type [(lenght)], expression [, style])

style- използва се за форматиране на дати

TRY-функциите извеждат NULL при неусешно конвертиране, а  останалите връщат грешка
*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

/*	Функции за дата и време
GETDATE()- Връща системната дата и време т.е на компютъра;
CURRENT_TIMESTAMP- задава се БЕЗ скоби; може да се използва вместо GETDATE();
DATEADD(datepart, number, date)- Връща дата, която се образува към датата date на number от тип datepart(месец, дни, часове, години);
DATEDDiff(datepart, startdate, enddate)- Връща дата, която се образува към датата date на number от тип datepart(месец, дни, часове, години);
*/
--деклариране на променлива
DECLARE @datevar DATETIME2;
--Задзаване на стойност на променлива чрез низ преобразуван до DATETIME2, като се използва стандартен стил с номер 104
--Стилът указва как се интерпретират частите на низа
SET @datevar = CONVERT(DATETIME2, '25.12.2030 10:20:50', 104);

/*	други начини
	- с използване на параметъра <culture>, в случая  'BG'
	SET @datevar = PARSE('25.12.2030' AS DATETIME2 USING 'BG');

	- при по-стандартни стилове не е необходиме да се указва номер на стил 
	SET @datevar = CONVERT(DATETIME2, '25.12.2030 10:20:50')
*/

SELECT @datevar AS "Формат по подразбиране",
		FORMAT(@datevar, 'dd-MM-yyyy г,')  AS "Свободен стил",
		FORMAT(@datevar, 'MMMM')  AS "Месец-EN",
		FORMAT(@datevar, 'dd')  AS "Ден от месеца"

--Извличане на части от датата
SELECT DATEPART(WK, @datevar) AS 'week',
	   DATEPART(YEAR, @datevar) AS 'year', 
	   YEAR( @datevar) AS 'year2';

--разлика на дати
DECLARE @d1 DATETIME2 = CONVERT(DATETIME2, '2030-12-25'); 
DECLARE @d2 DATETIME2 = CONVERT(DATETIME2, '2031-12-26'); 

SELECT DATEDIFF(DAY, @d1, @d2) AS 'Брой на дни от @d1 до @d2',
	   DATEDIFF(MONTH, @d1, @d2) AS 'Брой на месеци от @d1 до @d2',
	   DATEDIFF(YEAR, @d1, @d2) AS 'Брой на години от @d1 до @d2',
	   DATEDIFF(MINUTE, @d1, @d2) AS 'Брой на минути от @d1 до @d2';

--добавяне на части към дата
SELECT DATEADD(MONTH, 2, @d1) AS 'Добавяне на 2 месеца към @d1',
	   DATEADD(DAY, -40, @d1) AS 'Изваждане на 40 дена от @d1';
-------------------------------------------------------------------------------------------------------------------------------------------------------

/*
- Математически функции
PI();
POWER(float_expression, y)
ABS(numeric_expression), 
SQUARE(float_expression), --повдигане на втора степен
SQRT(float_expression) -- корен квадратен
SIN(float_expression) --ъгъл зададен в радиани;
COS(float_expression) --ъгъл зададен в радиани

*/
SELECT SIN(PI()/2) AS "SIN от 90 градуса",
	   COS(PI()/2) AS "COS от 90 градуса";

SELECT SQRT(81) AS "Корен квадратен от 81",
	   POWER(81, 0.5) AS "корен квадратен от 81";

--закръгляване на цели числа
--CEILING- закръглява числото нагоре
--FLOOR- закръглява числото надолу
--ROUND- закръглява числото до по-близкото цяло число
SELECT CEILING(5.5) AS "Закръгляване нагоре",
		FLOOR(5.5) AS "Закръгляване надолу",
		ROUND(5.5, 0) AS "Закръгляване към по-близкото цяло число";
SELECT ROUND(5.49, 0) AS "Закръгляване към по-близкото цяло число1",
		ROUND(5.49, 1) AS "Закръгляване до 1-вия знак след десетичната запетая";

/*Функции за работа с низове
TRIM(character_expression)
LTRIM(character_expression)
RTRIM(character_expression)
LOWER(character_expression)
UPPER(character_expression)
LEN(string_expression)
SUNSTRING(string_expression, start, length)
RIGHT(string_expression, integer_expression)-връща дясната част на символен низ, с дължина integer_expression
LEFT(string_expression, integer_expression)-връща лявата част на символен низ, с дължина integer_expression
PATINDEX()
REPLACE()
*/
SELECT name, 
		LEN(name) AS "len",
		SUBSTRING(name, 1, 1) AS "First",
		REPLACE(name, 'а', 'А') AS "Replaced"--ВНИМАВАЙ буквите да са на езика на въведените данни!!!
FROM persons;

/*Други функции
ISNULL()
COALESCE()
ISNUMERIC()
*/
SELECT ISNUMERIC('123.45') AS "123.45",
		ISNUMERIC('12345') AS "12345",
		ISNUMERIC('1a') AS "1a";

SELECT name, address,
ISNULL(address, 'НЕ е зададен адрес!') AS "Address ISNULL",
COALESCE(address, NULL, 'НЕ е зададен адрес!') AS "Address COALESCE"
FROM persons;
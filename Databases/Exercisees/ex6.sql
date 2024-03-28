GO 
USE personsdb;

/*Зад 1: Да се изведат всички хора, които живеят в София, Пловдив, Бургас или Варна. */
--вариант 1
SELECT *
FROM persons
WHERE address IN ('София', 'Варна', 'Пловдив', 'Бургас');

--вариант 2
SELECT *
FROM persons
WHERE address IN ('София', 'Варна', 'Пловдив', 'Бургас');

/*Зад 2: Да се изведат всички хора, които НЕ живеят в София или Варна*/
--вариант 1
SELECT *
FROM persons
WHERE address NOT IN ('София', 'Варна');

--вариант 2
SELECT *
FROM persons
WHERE NOT(address='София' OR address='Варна');

/* Зад. 3: Да се изведат всички хора, които са с тегло в затворен 
	интервал [70, 90] кг.*/
--вариант 1
SELECT *
FROM persons
WHERE weight >= 70 AND weight <= 90;

--вариант 2
SELECT *
FROM persons
WHERE weight BETWEEN 70 AND 90;

/* Зад.4: Да се изведат всички хора, за които не е зададен адрес. */
SELECT *
FROM persons
WHERE address IS NULL;

/*Зад. 5: Да се изведе информация за хора- име, презиме, фамилия и тегло
*/
--три начина
SELECT name + ' ' + surname + ' ' + family + ' -> ' + CONVERT(varchar, weight) AS info1,
		CONCAT(name,' ', surname, ' ', family, ' -> ', weight) AS info2,
		CONCAT_WS(' ', name, surname, family, ' -> ', weight) AS info3
FROM persons;

/*Зад. 6: Да се изведе изформация за хора, чиято фамилия
завършва на "ов", "ев", "ова" или "ева". */
--вариант 1
SELECT * FROM persons
WHERE family LIKE '%ов' 
		OR family LIKE  '%eв' 
		OR family LIKE  '%ова' 
		OR family LIKE  '%ева';

--вариант 2
SELECT * FROM persons
WHERE family LIKE  '%[ео]в' 
		OR family LIKE  '%[ое]ва';

/*Зад. 7: Да се изведе информация за хора с personal_id започващ с 95*/
SELECT * FROM persons
WHERE personal_id LIKE  '95%';

GO 
USE REAL_ESTATES;

/*	Операторът UNION	*/
-- Повтарящите се имена се излючват т.е. ако имаме два пъти 'Марта' ще се изключи
-- Операторът UNION ALL
-- Повтарящите се имена се включват 1 път т.е. ако имаме два пъти 'Марта' ще се включи 1 път
SELECT agent_pname AS "Всички имена" FROM agents
UNION
SELECT client_pname FROM clients;

SELECT agent_pname AS "Всички имена" 
--Създаваме нова таблица 
	INTO names
FROM agents
UNION
SELECT client_pname FROM clients
-- Подреждаме по азбучен ред
ORDER BY 1;

SELECT agent_pname AS "Всички имена" , agent_lname AS "Всички фамилии" 
--Създаваме нова таблица 
	INTO names1
FROM agents
UNION
SELECT client_pname, client_lname FROM clients
-- Подреждаме по азбучен ред
-- Ако имаме повече от 1 колона задаваме номена на колоната
ORDER BY 2;

/* INTERSECT- сечение */
--Извежда само имената, които се съдържат и в двете таблици
SELECT agent_pname AS "Имена и в двете таблици" 
FROM agents
INTERSECT
SELECT client_pname FROM clients
-- Подреждаме по азбучен ред
ORDER BY 1;

/*	EXCEPT- разлика	*/
--Връща всички записи от първата таблица и изключва тези, оито се повтарят във втората
-- НЕ е комутативна
SELECT agent_pname AS "Имена само при брокери" 
FROM agents
EXCEPT
SELECT client_pname FROM clients
ORDER BY 1;

SELECT client_pname AS "Имена само при клиенти"  
FROM clients
EXCEPT
SELECT agent_pname FROM agents
ORDER BY 1;

/*	JOIN- */
-- Извждане на информация от една или повече таблици на база на външните/първичните ключове
/*

- INNER JOIN - ПО ПОДРАЗБИРАНЕ т.е ако напишем само JOIN се разбира INNER JOIN
	избира записите, които имат съвпадащи записи и в двете таблици;
- CROSS JOIN- декартово произведение на таблиците	т.е комбинация на всеки с всеки ред;

(външни съединиения)
- LEFT JOIN- връщат се всички брокери от първата таблица и всички съвпадащи им имоти, ако не е зададен имот, изписва се NULL
- RIGHT JOIN- връщат се всички имоти от първата таблица и всички съвпадащи им брокери, ако не е зададен брокер, изписва се NULL;
- FULL OUTER JOIN- връща всичко и от двете таблици, ако ня,а съвпадения връща NULL на съответните места;
*/

-- CROSS JOIN - комбинация на всеки коментар с всеки статус;
--1 начин
SELECT *
FROM comments CROSS JOIN comment_statuses;

--2 начин
SELECT *
FROM comments, comment_statuses;

-- INNER JOIN-САМО записите, които удовлетворяват условието
SELECT *
FROM properties INNER JOIN agents
ON properties.agent_id = agents.agent_id;

--1 начин
SELECT properties.property_id, city, property_name, agent_pname, agent_lname
FROM properties INNER JOIN agents
ON properties.agent_id = agents.agent_id;
--2 начин
SELECT p.property_id, city, property_name, agent_pname, agent_lname
FROM properties AS p, agents AS a
WHERE p.agent_id = a.agent_id;

--LEFT JOIN- всички комбинации от записи, всички записи с лявата таблица и там, където няма съвпадение с дясната таблица, се изписва NULL
SELECT a.agent_id, agent_lname, p.property_id, property_name
FROM agents a LEFT JOIN properties p ON a.agent_id = p.agent_id

SELECT a.agent_id, agent_lname, p.property_id, property_name
FROM  properties p LEFT JOIN agents a ON a.agent_id = p.agent_id

--RIGHT JOIN- всички комбинации от записи, всички записи с дясната таблица и там, където няма съвпадение с лявата таблица, се изписва NULL
SELECT a.agent_id, agent_lname, p.property_id, property_name
FROM agents a RIGHT JOIN properties p ON a.agent_id = p.agent_id

-- FULL OUTER JOIN- левите записи, допълнени с NULL, ако нямат информация от десните и обратното
SELECT a.agent_id, agent_lname, p.property_id, property_name
FROM agents a FULL JOIN properties p ON a.agent_id = p.agent_id
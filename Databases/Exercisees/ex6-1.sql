GO
USE REAL_ESTATES;

/*Зад. 1: Да се изведе информация за имената, фамилиите 
и телефонните имена на брокерите.*/
SELECT agent_pname, agent_lname, agent_contact
FROM agents;

/*Зад. 2: Да се изведе информация за огледите, 
	насрочени за дата след 8-ми февруари 2022г.*/
SELECT *
FROM appointments
WHERE appointment_date > '2022-02-08'

/*Зад. 3: Да се изведат номерата на офертите за имоти, построени между 2010 и 2020г. */
SELECT property_id
FROM properties
WHERE property_year_build BETWEEN 2010 AND 2020;

/*Зад. 4: Да се изведе информация за имотите с мeстоположение Варна, Бургас, София, Пловдив. */
SELECT * 
FROM properties
WHERE city IN ('Варна', 'Бургас', 'София', 'Пловдив');

/*Зад. 5: Да се изведе информация за имотите, които имат снимки. */
SELECT *
FROM properties
WHERE property_id IN (SELECT property_id FROM images);

/*Зад. 6: Да се изведе информаци за брокерите, които нямат нито един имот за продажба. */
SELECT *
FROM agents
WHERE agent_id NOT IN (SELECT agent_id FROM properties);

/*Зад. 7: Да се изведе информация за клиентите, чиято фамилия съдържа низа 'иван'*/
SELECT *
FROM clients
WHERE client_lname LIKE '%иван%'

/*Зад. 8: Да се изведат имената, фамилиите и телефонните номера 
	на клиентите, за които телефонния номер започчва с 0888 */
SELECT client_pname, client_lname, client_contact
FROM clients
WHERE client_contact LIKE '0888%'

/*Зад. 9: Да се изведе информация за местоположенията, за които не е въведена информация за населението. */
SELECT * 
FROM properties
WHERE city IS NULL;

/*Зад. 10: Да се изведе информация за огледите, за които не е известно дали са проведени.*/
SELECT * 
FROM appointments
WHERE appointment_status IS NULL;

/*Зад. 11: Да се изведат имената и описанията на градовете, които са в близост до море
и са с население между 10 000 и 40 000. */
SELECT city, description
FROM locations
WHERE sea_nearby = 1 AND (population BETWEEN 10000 AND 40000);

/*Зад. 12: Да се изведе информация за имотите с жилищна 
	площ по-голяма от 70 кв.м. и построени между 2010 и 2020г., които имат гараж. */
SELECT * 
FROM properties
WHERE property_living_areas > 70 
	AND (property_year_build BETWEEN 2010 AND 2020) 
	AND property_garage = 1;

/*Зад. 13: Да се изведе списък с имената на всички клиенти, без повторения. 
	В случай на голяма опасност да се дублират имена в резултата, 
	повторенията може да се премахнат с DISTINCT. */
SELECT DISTINCT client_pname
FROM clients 
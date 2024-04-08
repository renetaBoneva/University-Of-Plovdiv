GO
USE REAL_ESTATES;

--зад.1 Да се изведе информация за имоти: номер на имот, дата на коментар, съдържание на коментар. 
-- В резултата да се съдържа само информация за имотите, за които ИМА въведени коментари.
SELECT p.property_id,c.comment_date , c.comment_content
FROM properties p INNER JOIN comments c ON p.property_id = c.property_id

--зад.2 Да се изведе информация за имоти: номер на имот, дата на коментар, съдържание на коментар. 
-- В резултата да се съдържа информация и за имотите, за които НЯМА въведени коментари.
SELECT p.property_id,c.comment_date , c.comment_content
FROM properties p  LEFT JOIN comments c ON p.property_id = c.property_id

-- зад.3 Да се изведе информация за клиентите и за планираните или извършени огледи:
-- номер, име и фамилия на клиент, дата и описание за огледа. В резулктата да се 
-- съдържа само информация за клиентите, които са планирали или извършили огледи,
SELECT c.client_id,c.client_pname, c.client_lname, a.appointment_date, a.appointment_description, a.appointment_status
FROM appointments AS a, clients AS c
WHERE a.client_id = c.client_id AND (a.appointment_status = 1 OR a.appointment_status = 0)

-- зад.4 Да се изведат имената на брокерите, които са извършили огледи в периода 1 ноември 2022г. - 31 януари 2023г, дата и информация за огледа.
-- Резултатът да е подреден в низходящ ред, по дата на огледа
SELECT agent_pname, agent_lname, appointment_date, appointment_description
FROM agents, appointments 
WHERE agents.agent_id =appointments.agent_id 
		AND (appointment_date BETWEEN '11-01-2022' AND '01-31-2023') 
		AND appointment_status = 1
-- когато колоната има име, може да използваме него, а не индекса й
ORDER BY appointment_date DESC;


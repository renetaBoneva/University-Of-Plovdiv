GO
USE REAL_ESTATES;

-- зад.1 Да се изведе име, фамилия и адрес на всички брокери и клиенти на агенцията за недвижими имоти.
SELECT agent_pname, agent_lname, agent_address FROM agents
UNION ALL
SELECT client_pname, client_lname, client_address FROM clients

-- зад.2 Да се изведе име, фамилия и адрес на всички брокери и клиенти на агенцията за недвижими имоти, които са от София.
SELECT agent_pname, agent_lname, agent_address FROM agents
WHERE agent_address='София'
UNION ALL 
SELECT client_pname, client_lname, client_address FROM clients
WHERE client_address='София'

--зад.3  Да се изведе име, фамилия и адрес на всички брокери и клиенти на агенцията за недвижими имоти, които са от София или Бургас.
-- Резултатът да е сортиран в низходящ ред.
SELECT agent_pname, agent_lname, agent_address FROM agents
WHERE agent_address='София' OR  agent_address='Бургас'
UNION ALL 
SELECT client_pname, client_lname, client_address FROM clients
WHERE client_address='София' OR client_address='Бургас'
ORDER BY 1 DESC;
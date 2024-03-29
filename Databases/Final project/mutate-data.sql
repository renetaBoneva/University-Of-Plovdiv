GO
USE Fitness;

-- Сменете часа за тренировка на клиент с номер 4004 с треньор номер 3004 от '2024-03-25 15:30:00'
-- за '2024-03-25 17:30:00'.
UPDATE appointments
SET appointent_time='2024-03-25 17:30:00'
WHERE client_id='4004' AND trainer_id='3004' AND appointent_time='2024-03-25 15:30:00'

-- Да се изведе информация за всички клиенти със записани часове
SELECT *
FROM clients
WHERE client_id IN (SELECT client_id FROM appointments);

-- Добавете упражнение 'Кошнички' с номер 1000 към тренировъчна 
-- програма 'Тренировка 6' с номер 2006;
INSERT INTO workouts_exercises(workout_id, exercise_id)
VALUES
	(2006, 1000);

-- Изрийте клиент номер 4006 от релация 'Клиенти'
DELETE FROM clients
WHERE client_id='4006'

-- Изведете таблица на всички тренировки с включените в тях упражнения
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

--Да се изведе информация за всички треньори, чиито фамилии 
--завършват на "ов"/"ова" 
SELECT *
FROM trainers
WHERE last_name LIKE '%ова' OR last_name LIKE '%ов'

-- Изведете таблица с информация за всички тренировки с включените в тях упражнения
--1 начин
SELECT w.title, w.leading_muscle_group, w.price, 
		e.title, e.description, w.workout_id, e.exercise_id
FROM workouts AS w, exercises AS e, workouts_exercises AS w_e
WHERE w.workout_id = w_e.workout_id AND e.exercise_id = w_e.exercise_id

--2 начин
SELECT w.title AS workout_title, w.leading_muscle_group, w.price,
	e.title AS exercise_title, e.description, w.workout_id, e.exercise_id
FROM workouts AS w
INNER JOIN workouts_exercises AS w_e ON w.workout_id = w_e.workout_id
INNER JOIN exercises AS e ON e.exercise_id = w_e.exercise_id;

-- Изрийте клиент номер 4006 от релация 'Клиенти'
DELETE FROM clients
WHERE client_id='4006'

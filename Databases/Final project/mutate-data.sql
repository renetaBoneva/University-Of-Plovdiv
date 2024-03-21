-- Сменете часа за тренировка на клиент с номер 4004 с треньор номер 3004 от '2024-03-25 15:30:00'
-- за '2024-03-25 17:30:00'.
UPDATE appointments
SET appointent_time='2024-03-25 17:30:00'
WHERE client_id='4004' AND trainer_id='3004' AND appointent_time='2024-03-25 15:30:00'

SELECT * FROM appointments
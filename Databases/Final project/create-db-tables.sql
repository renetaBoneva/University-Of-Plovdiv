CREATE DATABASE Fitness
	COLLATE Cyrillic_General_CI_AS;

GO 
USE Fitness;

CREATE TABLE exercises
(
	exercise_id INT IDENTITY(1000,1),
	title VARCHAR(30) NOT NULL,
	description VARCHAR(300),

	CONSTRAINT pk_exercises PRIMARY KEY (exercise_id)
)

CREATE TABLE workouts
(
	workout_id INT IDENTITY(2000,1),
	title VARCHAR(30) NOT NULL,
	leading_muscle_group VARCHAR(30) NOT NULL,
	price DECIMAL(6,2)

	CONSTRAINT pk_workouts PRIMARY KEY (workout_id),
	CONSTRAINT CHK_MuscleGroups CHECK (leading_muscle_group IN ('корем', 'крака', 'ръце', 'гръб', 'горна част', 'глутеус'))
)

CREATE TABLE trainers
(
	trainer_id INT IDENTITY(3000,1),
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,

	CONSTRAINT pk_trainers PRIMARY KEY (trainer_id),
)

CREATE TABLE clients
(
	client_id INT IDENTITY(4000,1),
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,

	CONSTRAINT pk_clients PRIMARY KEY (client_id),
)

CREATE TABLE workouts_exercises
(
	workout_id INT NOT NULL ,
	exercise_id INT NOT NULL,
	
	CONSTRAINT pk_workout_id_exercise_id PRIMARY KEY (workout_id, exercise_id),
	CONSTRAINT fk_workouts_exercises_workouts FOREIGN KEY (workout_id) REFERENCES workouts(workout_id) ON DELETE CASCADE,
	CONSTRAINT fk_workouts_exercises_exercises FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id) ON DELETE CASCADE,
)

CREATE TABLE trainers_workouts
(
	workout_id INT NOT NULL,
	trainer_id INT NOT NULL,
	
	CONSTRAINT pk_workout_id_trainer_id PRIMARY KEY (workout_id, trainer_id),
	CONSTRAINT fk_trainers_workouts_workouts FOREIGN KEY (workout_id) REFERENCES workouts(workout_id) ON DELETE CASCADE,
	CONSTRAINT fk_trainers_workouts_trainers FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id) ON DELETE CASCADE,
)

CREATE TABLE appointments
(
	appointment_id INT IDENTITY(5000, 1),
	workout_id INT,
	client_id INT NOT NULL,
	trainer_id INT NOT NULL,
	appointent_time DATETIME NOT NULL,
	isValidAppointment BIT DEFAULT 1,
	-- NULL-> didn't happened, 0-> happened, 1-> upcomming
	
	CONSTRAINT pk_appointments PRIMARY KEY (client_id, appointent_time),
	CONSTRAINT fk_appointments_workouts FOREIGN KEY (workout_id) REFERENCES workouts(workout_id),
	CONSTRAINT fk_appointments_trainers FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id) ON DELETE CASCADE,
	CONSTRAINT fk_appointments_clients FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE,
)
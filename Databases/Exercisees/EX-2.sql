CREATE DATABASE REAL_ESTATES
	COLLATE Cyrillic_General_CI_AS;

GO
USE REAL_ESTATES;

CREATE TABLE agents
(
	agent_id INT NOT NULL IDENTITY(10,1),
	agent_pname VARCHAR(50) NOT NULL,
	agent_lname VARCHAR(50) NOT NULL,
	agent_address VARCHAR(100) NOT NULL,
	agent_contact VARCHAR(20) NOT NULL,
	agent_email VARCHAR(30) NOT NULL,
	agent_type BIT DEFAULT 0 NOT NULL,
	username VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	CONSTRAINT pk_agent PRIMARY KEY (agent_id)
)

CREATE TABLE clients
(
	client_id INT NOT NULL IDENTITY(500,1),
	client_pname VARCHAR(50) NOT NULL,
	client_lname VARCHAR(50) NOT NULL,
	client_address VARCHAR(100) NOT NULL,
	client_contact VARCHAR(20) NOT NULL,
	client_email VARCHAR(30) NOT NULL,
	username VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	CONSTRAINT pk_client PRIMARY KEY (client_id)
)

CREATE TABLE locations
(
	city VARCHAR(80) NOT NULL,
	description VARCHAR(240),
	population INT,
	url VARCHAR(45),
	sea_nearby BIT DEFAULT 0,
	mountin_nearby BIT DEFAULT 0,
	CONSTRAINT pk_city PRIMARY KEY (city) 
)

CREATE TABLE comment_statuses
(
	comment_status_id TINYINT NOT NULL,
	comment_status VARCHAR(30) NOT NULL,
	CONSTRAINT pk_comment_status PRIMARY KEY (comment_status_id)
)

CREATE TABLE property_types 
(
	property_type_id INT NOT NULL,
	property_type_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_proprty_type PRIMARY KEY (property_type_id)
)

CREATE TABLE appointments
(
	appointment_id INT NOT NULL IDENTITY(1100,1),
	client_id INT NOT NULL,
	agent_id INT NOT NULL,
	appointment_date DATETIME NOT NULL,
	appointment_description VARCHAR(150) NOT NULL,
	appointment_status BIT,
	CONSTRAINT fk_appointments_clients FOREIGN KEY (client_id) REFERENCES clients(client_id),
	CONSTRAINT fk_appointments_agents FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
)

CREATE TABLE properties
(
	property_id INT NOT NULL IDENTITY(700,1),
	property_type_id INT NOT NULL,
	city VARCHAR(80) NOT NULL,
	agent_id INT NOT NULL,
	property_name VARCHAR(80) NOT NULL,
	desription VARCHAR(250),
	property_living_areas SMALLINT NOT NULL,
	property_floor TINYINT NOT NULL,
	property_year_build SMALLINT NOT NULL,
	property_garage BIT,
	property_price DECIMAL(10,2),
	property_status TINYINT DEFAULT 1,

	CONSTRAINT pk_property_id PRIMARY KEY (property_id),
	CONSTRAINT fk_properties_property_types FOREIGN KEY (property_type_id) REFERENCES property_types(property_type_id),
	CONSTRAINT fk_properties_locations FOREIGN KEY (city) REFERENCES locations(city),
	CONSTRAINT fk_properties_agents FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
)

CREATE TABLE comments 
(
	comment_id INT NOT NULL IDENTITY(150,1),
	property_id INT NOT NULL,
	client_id INT NOT NULL,
	comment_status_id TINYINT NOT NULL,
	comment_date DATETIME DEFAULT GETDATE() NOT NULL,
	comment_content VARCHAR(150) NOT NULL,

	CONSTRAINT pk_comment_id PRIMARY KEY (comment_id),
	CONSTRAINT fk_comments_properties FOREIGN KEY (property_id) REFERENCES properties(property_id),
	CONSTRAINT fk_comments_clients FOREIGN KEY (client_id) REFERENCES clients(client_id),
	CONSTRAINT fk_comments_comment_statuses FOREIGN KEY (comment_status_id) REFERENCES comment_statuses(comment_status_id),
)

CREATE TABLE images
(
	image_id INT NOT NULL IDENTITY(1000,1),
	property_id INT NOT NULL,
	image_name VARCHAR(80) NOT NULL,
	image_path VARCHAR(150) NOT NULL

	CONSTRAINT pk_image_id PRIMARY KEY (image_id),
	CONSTRAINT fk_images_properties FOREIGN KEY (property_id) REFERENCES properties(property_id),
)
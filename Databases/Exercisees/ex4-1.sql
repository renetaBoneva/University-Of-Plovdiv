GO
USE REAL_ESTATES;
 
INSERT INTO appointments (client_id, agent_id, appointment_date, appointment_description, appointment_status)
VALUES 
	(509, 16, '2023-02-05 15:50:00', 'Оглед на IMOT 703.', NULL);
 
UPDATE clients
SET client_address='гр. Варна, ул. В. Левски №33', client_lname='Георгиева'
WHERE client_id=508
 
UPDATE appointments
SET appointment_status='1'
-- I DONT HAVE appointment_id='1102'
WHERE appointment_id='1132'
 
 
-- КОНФЛИКТ С КЛЮЧ fk_comments_properties
ALTER TABLE comments
DROP CONSTRAINT fk_comments_properties
 
ALTER TABLE comments
ADD CONSTRAINT fk_comments_properties FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE
-- КОНФЛИКТ С КЛЮЧ fk_images_properties
ALTER TABLE images
DROP CONSTRAINT fk_images_properties
 
ALTER TABLE images
ADD CONSTRAINT fk_images_properties FOREIGN KEY  (property_id) REFERENCES properties(property_id) ON DELETE CASCADE
 
DELETE FROM properties
WHERE city='София'
 
DELETE FROM images
WHERE property_id='702'
 
SELECT * FROM properties
 
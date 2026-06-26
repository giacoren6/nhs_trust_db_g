USE NHS_Trust_DB;

-- SECURITY SECTION
-- Database roles and privileges


-- Delete users first if they already exist
DROP USER IF EXISTS 'admin_user'@'localhost';
DROP USER IF EXISTS 'doctor_user'@'localhost';
DROP USER IF EXISTS 'reception_user'@'localhost';
DROP USER IF EXISTS 'patient_user'@'localhost';


-- Create database users


CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin1!';
CREATE USER 'doctor_user'@'localhost' IDENTIFIED BY 'Doctor1!';
CREATE USER 'reception_user'@'localhost' IDENTIFIED BY 'Reception1!';
CREATE USER 'patient_user'@'localhost' IDENTIFIED BY 'Patient1!';


-- Admin role
-- Full access to the whole database


GRANT ALL PRIVILEGES
ON NHS_Trust_DB.*
TO 'admin_user'@'localhost';


-- Doctor role
-- Doctors can view patients and medications
-- Doctors can insert and update prescriptions


GRANT SELECT
ON NHS_Trust_DB.Patients
TO 'doctor_user'@'localhost';

GRANT SELECT
ON NHS_Trust_DB.Medications
TO 'doctor_user'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON NHS_Trust_DB.Prescriptions
TO 'doctor_user'@'localhost';

GRANT SELECT
ON NHS_Trust_DB.Appointments
TO 'doctor_user'@'localhost';


-- Receptionist role
-- Receptionists can manage patient details and appointments
-- They cannot access prescriptions


GRANT SELECT, INSERT, UPDATE
ON NHS_Trust_DB.Patients
TO 'reception_user'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON NHS_Trust_DB.Appointments
TO 'reception_user'@'localhost';

GRANT SELECT
ON NHS_Trust_DB.Clinics
TO 'reception_user'@'localhost';

GRANT SELECT
ON NHS_Trust_DB.Doctors
TO 'reception_user'@'localhost';



-- Patient role
-- Patients only have read access


GRANT SELECT
ON NHS_Trust_DB.Patients
TO 'patient_user'@'localhost';

GRANT SELECT
ON NHS_Trust_DB.Prescriptions
TO 'patient_user'@'localhost';


-- Apply privileges


FLUSH PRIVILEGES;



-- Check user permissions

SHOW GRANTS FOR 'doctor_user'@'localhost';
SHOW GRANTS FOR 'reception_user'@'localhost';
SHOW GRANTS FOR 'patient_user'@'localhost';
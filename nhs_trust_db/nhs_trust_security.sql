USE NHS_Trust_DB;

-- ==========================================
-- SECURITY SECTION
-- Database roles and privileges
-- ==========================================

-- Delete users first if they already exist
DROP USER IF EXISTS 'admin_user'@'localhost';
DROP USER IF EXISTS 'doctor_user'@'localhost';
DROP USER IF EXISTS 'reception_user'@'localhost';
DROP USER IF EXISTS 'patient_user'@'localhost';

-- ==========================================
-- Create database users
-- ==========================================

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin1!';
CREATE USER 'doctor_user'@'localhost' IDENTIFIED BY 'Doctor1!';
CREATE USER 'reception_user'@'localhost' IDENTIFIED BY 'Reception1!';
CREATE USER 'patient_user'@'localhost' IDENTIFIED BY 'Patient1!';

-- ==========================================
-- Admin role
-- Full access to the whole database
-- ==========================================

GRANT ALL PRIVILEGES
ON NHS_Trust_DB.*
TO 'admin_user'@'localhost';

-- ==========================================
-- Doctor role
-- Doctors can view patients and medications
-- Doctors can insert and update prescriptions
-- ==========================================

GRANT SELECT
ON NHS_Trust_DB.Patients
TO 'doctor_user'@'localhost';


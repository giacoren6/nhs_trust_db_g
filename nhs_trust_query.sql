USE NHS_Trust_DB;


-- Query 1: Count prescriptions per patient
-- Uses COUNT, LEFT JOIN and GROUP BY


SELECT 
    p.PatientID,
    p.PatientName,
    p.PatientSurname,
    COUNT(pr.PrescriptionID) AS TotalPrescriptions
FROM Patients p
LEFT JOIN Prescriptions pr 
ON p.PatientID = pr.PatientID
GROUP BY p.PatientID, p.PatientName, p.PatientSurname;



-- Query 2: Show patient medication details
-- Uses JOIN between Patients, Prescriptions and Medications


SELECT 
    p.PatientName,
    p.PatientSurname,
    m.MedicationName,
    pr.Dosage,
    pr.DateIssued
FROM Prescriptions pr
JOIN Patients p 
ON pr.PatientID = p.PatientID
JOIN Medications m 
ON pr.MedicationID = m.MedicationID;


-- Query 3: Show patient, doctor, medication and appointment
-- Uses multiple JOINs


SELECT
    p.PatientName,
    d.DoctorName,
    m.MedicationName,
    a.AppointmentDate
FROM Prescriptions pr
JOIN Patients p 
ON pr.PatientID = p.PatientID
JOIN Doctors d 
ON pr.DoctorID = d.DoctorID
JOIN Medications m 
ON pr.MedicationID = m.MedicationID
LEFT JOIN Appointments a 
ON pr.AppointmentID = a.AppointmentID;


-- Query 4: Stored Procedure
-- Gets all prescriptions for one patient by PatientID
-- DROP PROCEDURE avoids the "already exists" error


DROP PROCEDURE IF EXISTS GetPatientPrescriptions;

DELIMITER //

CREATE PROCEDURE GetPatientPrescriptions(IN patient_id BIGINT)
BEGIN
    SELECT 
        p.PatientName,
        p.PatientSurname,
        m.MedicationName,
        pr.Dosage,
        pr.DateIssued,
        pr.RepeatedPrescription
    FROM Prescriptions pr
    JOIN Patients p 
    ON pr.PatientID = p.PatientID
    JOIN Medications m 
    ON pr.MedicationID = m.MedicationID
    WHERE p.PatientID = patient_id;
END //

DELIMITER ;

-- Run the stored procedure
CALL GetPatientPrescriptions(1);




-- Query 5: Count prescriptions issued by each doctor
-- Uses COUNT, LEFT JOIN, GROUP BY and ORDER BY


SELECT
    d.DoctorID,
    d.DoctorName,
    d.DoctorSurname,
    COUNT(pr.PrescriptionID) AS TotalPrescriptions
FROM Doctors d
LEFT JOIN Prescriptions pr
ON d.DoctorID = pr.DoctorID
GROUP BY
    d.DoctorID,
    d.DoctorName,
    d.DoctorSurname
ORDER BY TotalPrescriptions DESC;


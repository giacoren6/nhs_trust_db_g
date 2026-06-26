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

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

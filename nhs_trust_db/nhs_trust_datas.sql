-- 1. CLINICS
INSERT INTO Clinics (ClinicName, ClinicAddress, PhoneNumber, Email) VALUES 
('Harley Street Clinic', '12 Harley St, London', 2071110001, 'info@harleyst.co.uk'),
('Westminster Medical', '50 Victoria St, London', 2072220002, 'info@westminster.co.uk'),
('City Health Hub', '100 Bishopsgate, London', 2073330003, 'info@cityhealth.co.uk');
 
 -- 2. MEDICATIONS 
INSERT INTO Medications (MedicationName, Descritption) VALUES 
('Paracetamol', 'Analgesic'), ('Amoxicillin', 'Antibiotic'), ('Ibuprofen', 'NSAID'),
('Amlodipine', 'Blood Pressure'), ('Metformin', 'Diabetes'), ('Salbutamol', 'Inhaler'),
('Lisinopril', 'Blood Pressure'), ('Atorvastatin', 'Cholesterol'), ('Omeprazole', 'Acid Reflux'),
('Cetirizine', 'Antihistamine');

-- 3. PATIENTS 
INSERT INTO Patients (PatientName, PatientSurname, PhoneNumber, Email, NHSnumber, DateBirth) VALUES
('John', 'Doe', 7400100001, 'john@email.com', 1001, '1990-01-10'),
('Jane', 'Smith', 7400100002, 'jane@email.com', 1002, '1990-02-20'),
('Mark', 'Brown', 7400100003, 'mark@email.com', 1003, '1995-03-15'),
('Anna', 'White', 7400100004, 'anna@email.com', 1004, '1995-04-25'),
('Luca', 'Rossi', 7400100005, 'luca@email.com', 1005, '1980-05-30'),
('Sara', 'Verdi', 7400100006, 'sara@email.com', 1006, '1980-06-05'),
('Robert', 'Moore', 7400100007, 'robert@email.com', 1007, '1983-07-12'),
('Laura', 'Taylor', 7400100008, 'laura@email.com', 1008, '1983-08-18'),
('James', 'Anderson', 7400100009, 'james@email.com', 1009, '1975-09-22'),
('Olivia', 'Thomas', 7400100010, 'olivia@email.com', 1010, '1975-10-01'),
('Daniel', 'Jackson', 7400100011, 'daniel@email.com', 1011, '1991-11-14'),
('Sophia', 'White', 7400100012, 'sophia@email.com', 1012, '1991-12-25'),
('Joseph', 'Harris', 7400100013, 'joseph@email.com', 1013, '1993-01-08'),
('Ava', 'Martin', 7400100014, 'ava@email.com', 1014, '1993-02-19'),
('Thomas', 'Thompson', 7400100015, 'thomas@email.com', 1015, '1996-03-27'),
('Mia', 'Garcia', 7400100016, 'mia@email.com', 1016, '1996-04-03'),
('Charles', 'Martinez', 7400100017, 'charles@email.com', 1017, '1994-05-12'),
('Charlotte', 'Robinson', 7400100018, 'charlotte@email.com', 1018, '1994-06-21'),
('Christopher', 'Clark', 7400100019, 'chris@email.com', 1019, '1972-07-07'),
('Amelia', 'Rodriguez', 7400100020, 'amelia@email.com', 1020, '1997-08-30');
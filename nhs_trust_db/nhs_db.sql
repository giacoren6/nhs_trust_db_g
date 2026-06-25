CREATE DATABASE NHS_Trust_DB;

USE NHS_Trust_DB;
 
-- 1. Create Medications Table (No dependencies)

CREATE TABLE Medications (

    MedicationID BIGINT NOT NULL AUTO_INCREMENT,

    MedicationName VARCHAR(150) NOT NULL,

    Descritption TEXT,

    PRIMARY KEY (MedicationID)

);

-- 2. Create Patients Table (No dependencies)

CREATE TABLE Patients (

    PatientID BIGINT NOT NULL AUTO_INCREMENT,

    PatientName VARCHAR(50) NOT NULL,

    PatientSurname VARCHAR(50) NOT NULL,

    PhoneNumber BIGINT NOT NULL,

    Email VARCHAR(100) NOT NULL,

    NHSnumber BIGINT NOT NULL,

    Address VARCHAR(255),

    DateBirth DATE NOT NULL,

    ActiveOrNot BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (PatientID),

    UNIQUE KEY `unique_patient` (`PatientName`,`PatientSurname`,`DateBirth`),

    CONSTRAINT `chk_patient_email` CHECK ((`Email` like '%@%.%'))

);

-- 3. Create Clinics Table (Moved UP so Doctors can reference it)

CREATE TABLE Clinics (

    ClinicID BIGINT NOT NULL AUTO_INCREMENT,

    ClinicName VARCHAR(150) NOT NULL,

    ClinicAddress VARCHAR(255),

    PhoneNumber BIGINT NOT NULL,

    Email VARCHAR(100),

    PRIMARY KEY (ClinicID),

    CONSTRAINT `chk_clinic_email` CHECK (`Email` like '%@%.%')

);

-- 4. Create Doctors Table (Can now safely reference Clinics)

CREATE TABLE Doctors (

    DoctorID BIGINT NOT NULL AUTO_INCREMENT,

    ClinicID BIGINT NOT NULL,

    DoctorName VARCHAR(50) NOT NULL,

    DoctorSurname VARCHAR(50) NOT NULL,

    Speciality VARCHAR(50) NOT NULL,

    Email VARCHAR(100),

    PhoneNumber BIGINT NOT NULL,

    DateBirth DATE NOT NULL,

    ActiveOrNot BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (DoctorID),

    UNIQUE KEY `unique_doctor` (`DoctorName`, `DoctorSurname`, `DateBirth`),

    KEY `fk_doctor_clinic` (`ClinicID`),

    CONSTRAINT `fk_doctor_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `Clinics` (`ClinicID`),

    CONSTRAINT `chk_doctor_email` CHECK (`Email` LIKE '%@%.%')

);

-- 5. Create Appointments Table (Moved UP so Prescriptions can reference it)

CREATE TABLE Appointments (

    AppointmentID BIGINT NOT NULL AUTO_INCREMENT,

    AppointmentDate DATE NOT NULL,

    AppointmentTime TIME NOT NULL,

    Notes TEXT,

    ClinicID BIGINT NOT NULL,

    PatientID BIGINT NOT NULL,

    DoctorID BIGINT NOT NULL,

    Diagnosis VARCHAR(255),

    PhoneOrFace tinyint(1) NOT NULL DEFAULT '0',

    Status VARCHAR(50) DEFAULT 'Scheduled',

    PRIMARY KEY (AppointmentID),

    CONSTRAINT FK_Appointment_Clinic FOREIGN KEY (ClinicID) REFERENCES Clinics(ClinicID),

    CONSTRAINT FK_Appointment_Patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),

    CONSTRAINT FK_Appointment_Doctor FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),

    CONSTRAINT chk_appointment_day CHECK (DAYOFWEEK(AppointmentDate) BETWEEN 2 AND 6),

    CONSTRAINT chk_appointment_time CHECK (HOUR(AppointmentTime) >= 8 AND HOUR(AppointmentTime) < 20)

);

-- 6. Create Prescriptions Table (Created LAST because it depends on Appointments)

CREATE TABLE Prescriptions (

    PrescriptionID BIGINT NOT NULL AUTO_INCREMENT,

    AppointmentID BIGINT DEFAULT NULL,

    MedicationID BIGINT NOT NULL,

    RepeatedPrescription BOOLEAN NOT NULL DEFAULT FALSE,

    Dosage varchar(100) NOT NULL,

    DateIssued DATE NOT NULL,

    PatientID BIGINT NOT NULL,

    DoctorID BIGINT,

    PRIMARY KEY (PrescriptionID),

    CONSTRAINT FK_Prescription_Medication FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID),

    CONSTRAINT FK_Prescription_Patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),

    CONSTRAINT FK_Prescription_Doctor FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),

    CONSTRAINT FK_Prescription_Appointment FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),

    CONSTRAINT chk_prescription_date CHECK (DateIssued = CURRENT_DATE())

);

ALTER TABLE Patients
ADD CONSTRAINT chk_patient_datebirth
CHECK (
    YEAR(DateBirth) > 1920
    AND MONTH(DateBirth) BETWEEN 1 AND 12
    AND (
        (MONTH(DateBirth) IN (1,3,5,7,8,10,12) AND DAY(DateBirth) BETWEEN 1 AND 31)
        OR
        (MONTH(DateBirth) IN (4,6,9,11) AND DAY(DateBirth) BETWEEN 1 AND 30)
        OR
        (MONTH(DateBirth) = 2 AND DAY(DateBirth) BETWEEN 1 AND 29)
    )
);
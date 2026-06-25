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
USE MedicalDayCare;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DOB DATE,
    PhoneNumber NVARCHAR(15)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Role NVARCHAR(50),
    HireDate DATE
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    StaffID INT NOT NULL,
    AppointmentTime DATETIME,
    Notes NVARCHAR(500),
    Status NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Description NVARCHAR(255)
);
CREATE TABLE PatientMedications (
    PatientMedicationID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    MedicationID INT NOT NULL,
    Dosage NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);
CREATE TABLE Billing (
    BillID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    DateIssued DATE,
    AmountDue DECIMAL(10, 2),
    AmountPaid DECIMAL(10, 2),
    Status NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    Provider NVARCHAR(100),
    PolicyNumber NVARCHAR(100),
    CoverageDetails NVARCHAR(MAX),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    Name NVARCHAR(100),
    Relation NVARCHAR(50),
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    FeedbackDate DATETIME,
    Rating INT,
    Comments NVARCHAR(MAX),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Interactions (
    InteractionID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    StaffID INT,
    InteractionType NVARCHAR(50),
    InteractionDate DATETIME,
    Notes NVARCHAR(MAX),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


CREATE VIEW PatientInteractionReport AS
SELECT 
    p.PatientID, 
    p.FirstName, 
    p.LastName, 
    COUNT(i.InteractionID) AS NumberOfInteractions,
    AVG(f.Rating) AS AverageFeedbackRating
FROM 
    Patients p
    LEFT JOIN Interactions i ON p.PatientID = i.PatientID
    LEFT JOIN Feedback f ON p.PatientID = f.PatientID
GROUP BY 
    p.PatientID, 
    p.FirstName, 
    p.LastName;


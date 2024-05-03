USE MedicalDayCare;

INSERT INTO Patients (FirstName, LastName, DOB, PhoneNumber) VALUES ('Andy', 'Sun', '1998-09-23', '301-1346-0912');
SELECT * FROM Patients;

INSERT INTO Staff (FirstName, LastName, Role, HireDate)
VALUES ('Charles', 'Mkabop', 'Social Worker', '2022-08-23');
SELECT * FROM Staff;

INSERT INTO Appointments (PatientID, StaffID, AppointmentTime, Notes, Status)
VALUES (1, 1, '2024-05-03 10:00:00', 'Initial Consultation', 'Scheduled');
SELECT * FROM Appointments;

INSERT INTO Medications (Name, Description)
VALUES ('Atorvastatin', 'Used to lower cholesterol');
SELECT * FROM Medications;

INSERT INTO PatientMedications (PatientID, MedicationID, Dosage, StartDate, EndDate)
VALUES (1, 1, '10mg Once Daily', '2024-05-03', '2024-11-03');
SELECT * FROM PatientMedications;

INSERT INTO Billing (PatientID, DateIssued, AmountDue, AmountPaid, Status)
VALUES (1, '2024-05-03', 150.00, 150.00, 'Paid');
SELECT * FROM Billing;

INSERT INTO Insurance (PatientID, Provider, PolicyNumber, CoverageDetails)
VALUES (1, 'HealthCare Plus', 'HP123456789', 'Full coverage after deductible');
SELECT * FROM Insurance;

INSERT INTO Contacts (PatientID, Name, Relation, Phone, Email)
VALUES (1, 'Ahraya Phouthavongsa', 'Spouse', '202-413-2333', 'apho0602@gmail.com');
UPDATE Contacts
SET Name = 'Jane Guo', Relation = 'Daughter'
WHERE ContactID = 1; 

SELECT * FROM Contacts;







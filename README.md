Medical Day Care Database (Customer Appointment Satisfaction and Reports)

Project Overview:

Purpose

The purpose of this database is to:
- Efficiently manage patient and staff data.
- Schedule and track appointments and treatments.
- Implement CRM functionalities to improve patient engagement and satisfaction.
- Provide dynamic reporting capabilities for operational insights.

How I set up this database:

Prerequisites
- SQL Microsoft Server 
- SQL Server Management Studio (SSMS)

Creating the Database
- Open SSMS, connect to your SQL Server instance, and run the following SQL command to create the database:
  CREATE DATABASE MedicalDayCare;

Database Schema

Tables
- Patients: Stores patient information.
- Staff: Holds data about medical and administrative staff.
- Appointments: Manages scheduling of appointments.
- Medications: Catalogs medications.
- PatientMedications: Records medications prescribed to patients.
- Billing: Tracks billing information.
- Insurance: Details insurance coverage for patients.
- Contacts: Stores emergency contact information for patients.
- Feedback: Collects feedback from patients.
- SurveyQueue: Manages surveys to be automatically sent to patients post-appointment.*

*Would need an external source to actually send and track these surveys. This database only marks the process and records the information.

Triggers
- SendSurveyAfterAppointment: Automatically queues surveys when an appointment is marked as completed.

Views
- MonthlyPatientSatisfaction: Provides monthly patient satisfaction ratings.
- AverageTicketResolutionTime: Shows average time to resolve support tickets.

Functionality

CRM
- Automated communication following key patient activities, such as post-appointment surveys.
- Detailed feedback and support ticket systems to enhance patient support and track service quality.

Reporting
- Dynamic views for real-time operational reporting, such as tracking patient satisfaction and ticket resolution efficiency.

Usage

Accessing Reports
- Reports can be accessed through predefined views. For example, to access monthly patient satisfaction:
  SELECT * FROM MonthlyPatientSatisfaction;

Modifying Data
- Data can be modified via SSMS or through SQL scripts. For example, to update a patient's contact information:
  UPDATE Patients SET Phone = '202-401-6789' WHERE PatientID = 1;

Adding Data
- New records can be added using SQL insert statements. For example:
  INSERT INTO Patients (FirstName, LastName, DOB, PhoneNumber) VALUES ('Andy', 'Sun', '1998-09-23', '202-401-6789');

So what are some the outcomes I have tried to achieve? Through improved operations and better data management, the system will enhance the quality of care provided to patients like improved communication, in which capabilities will help with stronger relationships between the care team and patients' families.

I also had operational efficiency in mind, with improved resource management and scheduling capabilities, the center will operate more efficiently, reducing wait times and optimizing the use of available resources through automated processes which is continuing to grow within business processes.

This database and customer feeback system can support the day-to-day operations of a medical day care center, and covers both patient care and administrative functions. 

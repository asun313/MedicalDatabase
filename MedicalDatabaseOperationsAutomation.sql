CREATE TABLE SurveyQueue (
    SurveyQueueID INT PRIMARY KEY IDENTITY(1,1),
    AppointmentID INT NOT NULL,
    PatientID INT NOT NULL,
    SurveyStatus NVARCHAR(50) DEFAULT 'Pending',
    SurveySentDate DATETIME,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TRIGGER SendSurveyAfterAppointment
ON Appointments
AFTER UPDATE
AS
BEGIN
    -- Check if the Appointment Status was updated to 'Completed'
    IF UPDATE(Status)
    BEGIN
        INSERT INTO SurveyQueue (AppointmentID, PatientID)
        SELECT i.AppointmentID, i.PatientID
        FROM inserted i
        INNER JOIN deleted d ON i.AppointmentID = d.AppointmentID
        WHERE i.Status = 'Completed' AND (d.Status IS NULL OR d.Status <> 'Completed');
    END
END;

CREATE VIEW MonthlyPatientSatisfaction AS
SELECT 
    YEAR(FeedbackDate) AS Year,
    MONTH(FeedbackDate) AS Month,
    AVG(Rating) AS AverageRating,
    COUNT(*) AS NumberOfFeedbacks
FROM 
    Feedback
GROUP BY 
    YEAR(FeedbackDate), 
    MONTH(FeedbackDate);

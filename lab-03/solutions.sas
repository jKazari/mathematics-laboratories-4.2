/* Task 1 */
PROC SQL;
	CREATE TABLE Patients (
		PatientID NUM(5) PRIMARY KEY,
		Name CHAR(25) NOT NULL,
		Surname CHAR(35) UNIQUE,
		Age NUM CHECK (Age > 0),
		AdmissionDate DATE FORMAT = DATE9.
	);
QUIT;

/* Task 2 */
PROC SQL;
    ALTER TABLE Patients
    MODIFY Name CHAR(20);
QUIT;

/* Task 3 */
PROC SQL;
    ALTER TABLE Patients
    ADD BloodType CHAR(3);
QUIT;

/* Task 4 */
PROC SQL;
    ALTER TABLE Patients DROP CONSTRAINT _CK0001_;
    ALTER TABLE Patients DROP Age;
QUIT;

/* Task 5 */
PROC SQL;
    ALTER TABLE Patients
    ADD CONSTRAINT AdmissionDateNotNull NOT NULL (AdmissionDate);
QUIT;

/* Task 6 */
PROC SQL;
    INSERT INTO Patients (PatientID, Name, Surname, AdmissionDate, BloodType)
    VALUES (10001, 'Jan', 'Kowalski', '10MAR2025'D, 'A+')
    VALUES (10002, 'Anna', 'Nowak', '10MAR2025'D, 'B-')
    VALUES (10003, 'Piotr', 'Wiśniewski', '10MAR2025'D, 'AB+')
    VALUES (10004, 'Maria', 'Dąbrowska', '10MAR2025'D, 'O-');
QUIT;

PROC SQL;
    UPDATE Patients
    SET Surname = CASE 
        WHEN PatientID = 10001 THEN 'Kowal'
        WHEN PatientID = 10002 THEN 'Nowacka'
        WHEN PatientID = 10003 THEN 'Wiśnia'
        WHEN PatientID = 10004 THEN 'Wysocka'
    END;
QUIT;

PROC SQL;
    ALTER TABLE Patients
    ADD DischargeDate DATE FORMAT = DATE9.;
QUIT;

/* Task 7 */
PROC SQL;
    DELETE FROM Patients
    WHERE BloodType = 'AB+';
QUIT;

/* Task 8 */
PROC SQL;
    CREATE TABLE PatientsHistory AS
    SELECT * FROM Patients;
QUIT;

/* Task 9 */
PROC SQL;
    ALTER TABLE PatientsHistory
    ADD CONSTRAINT BloodTypeValidityCheck CHECK
    (BloodType IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'));
QUIT;

/* Task 10 */
PROC SQL;
    INSERT INTO PatientsHistory (PatientID, Name, Surname, AdmissionDate, BloodType)
    VALUES (10005, 'Krzysztof', 'Jankowski', '10MAR2025'D, 'X+');
QUIT;

/* ERROR: Add/Update failed for data set WORK.PATIENTSHISTORY  */
/* because data value(s) do not comply with integrity constraint  */
/* BloodTypeValidityCheck. */

/* Task 11 */
PROC SQL;
    ALTER TABLE PatientsHistory
    ADD PRIMARY KEY (Name, Surname);
QUIT;

/* Task 12 */
PROC SQL;
    ALTER TABLE PatientsHistory
    ADD Diagnosis CHAR(200);
QUIT;

/* Task 13 */
PROC SQL;
    INSERT INTO PatientsHistory (PatientID, Name, Surname, AdmissionDate, BloodType, Diagnosis)
    VALUES (10006, 'Grzegorz', 'Dom', '10MAR2025'D, 'B+', 'Lupus')
    VALUES (10007, 'Jakub', 'Wilson', '10MAR2025'D, 'O-', 'Cancer');
QUIT;

/* Task 14 */
PROC SQL;
    ALTER TABLE PatientsHistory
    DROP COLUMN Surname;
QUIT;

/* ERROR: The column named Surname cannot be dropped  */
/* because it participates in an integrity constraint  */
/* named _PK0001_. */

/* Task 15 */
PROC SQL;
    UPDATE PatientsHistory
    SET Diagnosis = CATX(' ', Diagnosis, '- Requires Further Observation');
QUIT;

/* Task 16 */
PROC SQL;
    DROP TABLE Patients;
QUIT;
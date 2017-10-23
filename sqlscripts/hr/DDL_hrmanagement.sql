/*
	Denne sql-fil indeholder scripts til oprettelse af databasens tabeller, 
	views og triggers. Det forudsættes at databasen 'hrmanagement' er oprettet inden
	nedenstående script afvikles. TRIGGERS bør altid afvejes i forhold hvor man ønsker
	at placere forretningslogikken i sin applikation. I dette tilfælde er de tilføjet
	for at beregne antal fraværs dage ved INSERT og UPDATES, hvis man på et senere
	tidspunkt skal have et overblik over dette.

	Jeg har ikke lavet nogen direkte registrering af afdelingsleder. Jeg var i overvejelser,
	om det var en del af opgaven, men fravalgte den del. Hvis man ønsker at fremfinde hvilken
	afdeling en leder er afdelingsleder for, kan det enten gøres med et sql script. Eller
	via en relations tabel (junction).
*/

USE hrmanagement;

-- TABELLER
CREATE TABLE departments (
	id INT PRIMARY KEY IDENTITY(1,1),	
	name NVARCHAR(30) NOT NULL,	
);


CREATE TABLE employees (
	id INT IDENTITY(1,1),
	manager_id INT NOT NULL,
	name NVARCHAR(50) NOT NULL,	
	department_id INT NOT NULL
	CONSTRAINT PK_employees PRIMARY KEY(id),
	CONSTRAINT FK_manager FOREIGN KEY (manager_id) REFERENCES employees(id)	,
	CONSTRAINT FK_department FOREIGN KEY (department_id) REFERENCES departments(id),
);


CREATE TABLE absences (
	id INT PRIMARY KEY IDENTITY(1,1),
	employee_id INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	days TINYINT,
	reason CHAR(1) NOT NULL DEFAULT 'A',	
	CONSTRAINT CHK_reason CHECK (reason = 'A' OR reason = 'S')	
);

-- TRIGGERS

GO
CREATE TRIGGER TRG_absence_calc_days_after_update ON absences AFTER UPDATE
AS BEGIN
	UPDATE absences
	SET days = DATEDIFF(day, start_date, end_date)
	FROM absences a
	WHERE EXISTS (SELECT 1 FROM INSERTED i WHERE i.id = a.id);
END;

-- VIEWS
CREATE VIEW view_employees_by_manager AS
SELECT m.id leder_id, m.name leder, e.id medarbejder_id, e.name medarbejder FROM employees e
INNER JOIN  employees m ON e.manager_id=m.id;

CREATE VIEW view_employees_by_manager_absences AS
SELECT v.leder_id, v.leder, v.medarbejder_id, v.medarbejder, a.start_date, a.end_date, a.days, a.reason FROM view_employees_by_manager v
INNER JOIN absences a ON v.medarbejder_id = a.employee_id;



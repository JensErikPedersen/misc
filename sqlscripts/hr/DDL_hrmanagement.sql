USE hrmanagement;


CREATE TABLE departments (
	id INT PRIMARY KEY IDENTITY(1,1),	
	name NVARCHAR(30) NOT NULL,	
);


CREATE TABLE employees (
	id INT IDENTITY(1,1),
	manager_id INT,
	name NVARCHAR(50) NOT NULL,	
	CONSTRAINT PK_employees PRIMARY KEY(id),
	CONSTRAINT FK_manager FOREIGN KEY (manager_id) REFERENCES employees(id)	
);


CREATE TABLE absences (
	id INT PRIMARY KEY IDENTITY(1,1),
	employee_id INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	days TINYINT,
	reasoncode CHAR(1) NOT NULL DEFAULT 'P',
	reason_descripton NVARCHAR(50),
	CONSTRAINT CHK_reason CHECK (reasoncode = 'P' OR reasoncode = 'I')	
);

CREATE TABLE departments_managers (
	department_id INT NOT NULL,
	employee_id INT NOT NULL,
	CONSTRAINT FK_department FOREIGN KEY (department_id) REFERENCES departments(id),
	CONSTRAINT FK_employee FOREIGN KEY(employee_id) REFERENCES employees(id),
	PRIMARY KEY(department_id,employee_id)
);


GO
CREATE TRIGGER TRG_absence_calc_days_after_insert ON absences AFTER INSERT
AS BEGIN
	UPDATE absences
	SET days = DATEDIFF(day, start_date, end_date)
	FROM absences a
	WHERE EXISTS (SELECT 1 FROM INSERTED i WHERE i.id = a.id);
END;

GO
CREATE TRIGGER TRG_absence_calc_days_after_update ON absences AFTER UPDATE
AS BEGIN
	UPDATE absences
	SET days = DATEDIFF(day, start_date, end_date)
	FROM absences a
	WHERE EXISTS (SELECT 1 FROM INSERTED i WHERE i.id = a.id);
END;
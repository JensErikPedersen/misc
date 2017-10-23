/*
	Denne script fil kan bruges, hvis man ønsker at teste en leders forespørgsler.
	Forespørgslerne findes i filen DML_queries.
*/

USE hrmanagement;

DBCC CHECKIDENT ('[employees]', RESEED, 0);
DBCC CHECKIDENT ('[departments]', RESEED, 0);
DBCC CHECKIDENT ('[absences]', RESEED, 0);
GO

BEGIN TRANSACTION tran_insert_initial;
INSERT INTO departments
	(name)
VALUES
	('Direktionen'),
	('Marketing'),
	('HR'),
	('Regnskab'),
	('Kundeservice'),
	('Lager');
	

INSERT INTO employees
	(name, manager_id, department_id)
VALUES
	('Didrik (CEO)', 1, 1),
	('Mads (Marketing chef)', 1, 2),
	('Heidi (HR chef)', 1, 3),
	('Ronny (Regnskabs chef)', 1, 4),
	('Karina (Kundeservice)', 1, 5),
	('Laura (Lager chef', 1, 6);

INSERT INTO employees
	(name, manager_id, department_id)
VALUES
	('Morten', 2, 2),
	('Marianne', 2, 2),
	('Mette', 2, 2),
	('Henriette', 3, 3),
	('Henrik', 3, 3),
	('Henry', 3, 3),
	('Regina', 4, 4),
	('Rasmus', 4, 4),
	('Ronja', 4, 4),
	('Kristina', 5, 5),
	('Kaj', 5, 5),
	('Kim', 5, 5),
	('Lars', 6, 6),
	('Lone', 6, 6),
	('Leif', 6, 6);

INSERT INTO absences
	(employee_id, start_date, end_date, reason)
VALUES
	(2, '2017-05-09', '2017-05-10', 'A'),
	(5, '2017-06-19', '2017-06-21', 'S'),
	(5, '2017-07-14', '2017-07-15', 'A'),
	(11, '2017-08-04', '2017-08-05', 'S'),
	(11, '2017-08-09', '2017-08-10', 'S'),
	(11, '2017-09-02', '2017-09-04', 'S'),
	(11, '2017-09-09', '2017-09-10', 'S'),
	(16, '2017-04-09', '2017-04-10', 'A'),
	(16, '2017-07-16', '2017-07-18', 'S'),
	(16, '2017-08-02', '2017-08-03', 'S'),
	(17, '2017-07-26', '2017-07-27', 'S'),
	(17, '2017-05-13', '2017-05-20', 'A'),
	(21, '2017-05-18', '2017-05-19', 'S'),
	(22, '2017-06-23', '2017-06-25', 'S'),
	(22, '2017-04-12', '2017-04-15', 'S'),
	(22, '2017-03-10', '2017-03-12', 'A'),
	(20, GETDATE(), DATEADD(day, 1, GETDATE()), 'S'),
	(15, GETDATE(), DATEADD(day, 2, GETDATE()), 'A')
;

COMMIT TRANSACTION tran_insert_initial;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM absences;
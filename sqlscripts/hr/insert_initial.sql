USE hrmanagement;

DBCC CHECKIDENT ('[employees]', RESEED, 0);
DBCC CHECKIDENT ('[departments]', RESEED, 0);
GO

BEGIN TRANSACTION tran_insert_initial;
INSERT INTO departments
	(name)
VALUES
	('Marketing'),
	('HR'),
	('Kundeservice'),
	('Lager'),
	('Økonomi');

INSERT INTO employees
	(name)
VALUES
	('Carl (CEO)'),
	('Mads (Marketing chef)'),
	('Heidi (HR chef)'),
	('Ronny (Regnskabs chef)'),
	('Karina (Kundeservice)'),
	('Laura (Lager chef');

UPDATE employees
	SET manager_id = 1
	WHERE id > 1;

INSERT INTO employees
	(name, manager_id)
VALUES
	('Morten', 2),
	('Marianne', 2),
	('Mette', 2),
	('Henriette', 3),
	('Henrik', 3),
	('Henry', 3),
	('Regina', 4),
	('Rasmus', 4),
	('Ronja', 4),
	('Kristina', 5),
	('Kaj', 5),
	('Kim', 5),
	('Lars', 6),
	('Lone', 6),
	('Leif', 6)
;


COMMIT TRANSACTION tran_insert_initial;

SELECT * FROM departments;
SELECT * FROM employees;


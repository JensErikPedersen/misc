/*
  Eksempler p� queries som en leder kan foretage for at f�:
  - en liste over alle sine medarbejdere
  - en liste over sine medarbejderes frav�r
  - en liste over alle de medarbedejdere som er p� arbejde dags dato

  Queries kunne med fordel skrives som stored procedures med lederens id som parameter.
  Men det har jeg vurderet som v�rende udenfor denne opgaves scope
*/

USE hrmanagement;

-- Query til leder som viser medarbejdere i hans/hendes afdeling, eks. leder id=3:
SELECT * FROM view_employees_by_manager WHERE leder_id=5;


-- Query til leder som viser medarbejdernes frav�r, eks. leder id = 3
SELECT * FROM view_employees_by_manager_absences WHERE leder_id=5;


-- Query til leder som viser hvilke af lederens medarbejdere som er p� arbejde i dag. Eks. leder id = 6
SELECT * FROM view_employees_by_manager v WHERE v.leder_id = 6 AND v.medarbejder_id NOT IN(
SELECT a.employee_id FROM absences a
WHERE a.start_date = CAST(GETDATE() AS DATE));


-- Query til leder som viser alt frav�r for en medarbejder i en afdelingen, eks. leder_id=5 og medarbejder_id=16
SELECT * FROM view_employees_by_manager_absences WHERE leder_id=5 and medarbejder_id=16 ORDER BY reason;


-- Query til leder som viser de medarbejdere i en afdeling, som har mindst 3 ikke aftalte frav�rsdage, eks. leder_id=5
SELECT a.medarbejder, COUNT(start_date) frav�rsdage FROM view_employees_by_manager_absences a
	WHERE a.reason='S' AND (a.start_date BETWEEN DATEADD(day, -365, GETDATE()) AND GETDATE())
	AND leder_id=5
	GROUP BY a.medarbejder
	HAVING COUNT(start_date) >= 3
	ORDER BY frav�rsdage DESC; 

-- Query til indberettelse af frav�r dags dato(eks. sygefrav�r p� medarbejder id=16)
INSERT INTO absences
	(employee_id, start_date, end_date, reason)
VALUES
	(16, GETDATE(), '', 'S');

-- Query til opdatering af afslutning p� frav�r (eks. for medarbejder id = 21)
UPDATE absences
	SET end_date=GETDATE()
	WHERE id=21;
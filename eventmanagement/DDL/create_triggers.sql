/*
	CREATE TRIGGER to validate that an eventtype max_participants do NOT exceed the room capacity on the selected room
*/

USE fitnesscenter;
GO
/*

CREATE TRIGGER TRG_validate_max_participants ON holdtype
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @room_max AS TINYINT;
	DECLARE @room_id INT;

	SET @room_id = (SELECT s.id FROM sal s WHERE s.id);
	PRINT @room_id;


END;
GO
*/
/*
	Trigger til opdatering af created felt og status felt på tilmelding
*/

CREATE TRIGGER TRG_after_insert_tilmelding ON tilmelding
AFTER INSERT
AS
BEGIN
	DECLARE @hold_id INT;
	DECLARE @antal_deltagere INT;
	DECLARE @max_deltagere INT;
	DECLARE @status CHAR(1);
	SET @hold_id = (SELECT t.hold_id FROM INSERTED t);
	SET @antal_deltagere = (SELECT COUNT(*) FROM VIEW_all_registrations v
						WHERE v.HoldNummer = @hold_id AND v.Status='D');
	SET @max_deltagere = (SELECT ht.max_deltagere FROM Holdtype ht
							INNER JOIN hold h ON h.holdtype_id=ht.id
							WHERE h.id=6);

	SET @status = (SELECT t.status FROM INSERTED t);
	IF @max_deltagere < @antal_deltagere
		SET @status='V'

	UPDATE tilmelding
	SET created = GETDATE(), status = @status
	FROM tilmelding t
	WHERE EXISTS (SELECT 1 FROM INSERTED i WHERE i.id = t.id);
END;
GO

/*
	CREATE TRIGGER to add modified date on events_members AFTER UPDATE
*/

/*
GO
CREATE TRIGGER TRG_absence_calc_days_after_insert ON absences AFTER INSERT
AS BEGIN
	UPDATE absences
	SET days = DATEDIFF(day, start_date, end_date)
	FROM absences a
	WHERE EXISTS (SELECT 1 FROM INSERTED i WHERE i.id = a.id);
END;
*/

/*
CREATE TRIGGER TRG_before_insert_tilmelding ON tilmelding
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @hold_id INT;
	DECLARE @antal_deltagere INT;
	SET @hold_id = (SELECT t.hold_id FROM INSERTED t);
	SET @antal_deltagere = (SELECT COUNT(*) FROM VIEW_all_registrations v
						WHERE v.HoldNummer = @hold_id AND v.Status='D');
	PRINT @hold_id;
	PRINT @antal_deltagere;
	INSERT INTO tilmelding SELECT i.hold_id, i.medlem_id, i.status FROM inserted i;
END;
GO
*/
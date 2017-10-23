/*
	CREATE TRIGGER to validate that an eventtype max_participants do NOT exceed the room capacity on the selected room
*/

USE eventmanagement;
GO

CREATE TRIGGER TRG_validate_max_participants ON event_types
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @room_max AS TINYINT;
	DECLARE @room_id INT;

	SET @room_id = (SELECT r.id FROM rooms r WHERE inserted.room_id = r.id);
	PRINT @room_id;


END;


/*
	CREATE TRIGGER to add created date on events_members AFTER INSERTING
*/

CREATE TRIGGER TRG_set_createddate_insert ON event_members
AFTER INSERT
AS
BEGIN
	

END;


/*
	CREATE TRIGGER to add modified date on events_members AFTER UPDATE
*/



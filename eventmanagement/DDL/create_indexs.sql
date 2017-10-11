/*
	INDEX CREATION
*/
USE eventmanagement;
GO

CREATE INDEX IDX_zipcode
ON members(zipcode);

CREATE INDEX IDX_room
ON event_types(room_id);

CREATE INDEX IDX_event
ON registrations(event_id);

CREATE INDEX IDX_member
ON registrations(member_id);

CREATE INDEX IDX_eventtype
ON events(event_type_id);

CREATE INDEX IDX_member
ON events(instructor_id);



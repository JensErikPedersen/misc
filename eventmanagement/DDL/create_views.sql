USE eventmanagement;
GO
-- CREATE VIEWS

CREATE VIEW view_all_events AS
	SELECT CONCAT(e.event_type_prefix, ev.id) eventcode, e.name event_name, r.name room_name,  e.max_participants, (p.first_name + ' ' + p.last_name) instructor, ev.eventdate, ev.starttime, ev.endtime FROM event_types e
		INNER JOIN events ev ON ev.event_type_id = e.id
		INNER JOIN members p ON ev.instructor_id = p.id
		INNER JOIN rooms r ON e.room_id = r.id;	
GO

CREATE VIEW view_registrations AS
	SELECT  e.name event_name, r.name room_name, CONCAT(i.first_name + ' ', i.last_name) instructor, CONCAT(p.first_name + ' ', p.last_name) participant, ev.eventdate, ev.starttime, ev.endtime FROM registrations ep
		INNER JOIN events ev ON ep.event_id = ev.id
		INNER JOIN members p ON ep.member_id=p.id
		INNER JOIN members i ON ev.instructor_id= i.id
		INNER JOIN event_types e ON e.id = ev.event_type_id
		INNER JOIN rooms r ON e.room_id = r.id;

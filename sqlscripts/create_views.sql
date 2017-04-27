# CREATE VIEWS

CREATE VIEW view_all_events AS
SELECT e.name event_name, r.name room_name,  e.max_participants, CONCAT(p.first_name, " ", p.last_name), ev.event_date, ev.start_time, ev.end_time FROM event_types e
INNER JOIN events ev ON ev.event_type_id = e.id
INNER JOIN persons p ON ev.instructor_id = p.id
INNER JOIN rooms r ON e.room_id = r.id
ORDER BY e.name;

CREATE VIEW view_all_registrations AS
SELECT  e.name event_name, r.name room_name, CONCAT(i.first_name, " ", i.last_name) instructor, CONCAT(p.first_name, " ", p.last_name) participant, ev.event_date, ev.start_time, ev.end_time FROM events_persons ep
INNER JOIN events ev ON ep.event_id = ev.id
INNER JOIN persons p ON ep.person_id=p.id
INNER JOIN persons i ON ev.instructor_id= i.id
INNER JOIN event_types e ON e.id = event_type_id
INNER JOIN rooms r ON e.room_id = r.id
ORDER BY ev.event_date, ev.start_time;
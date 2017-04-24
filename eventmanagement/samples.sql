use eventmanagement;

DELETE FROM events;

SELECT * FROM rooms;

ALTER TABLE events AUTO_INCREMENT=1;

DROP DATABASE eventmanagement;

select * from event_types;

SELECT * FROM persons;

SELECT * FROM events;

UPDATE events SET parent_event_id = NULL;

SELECT e.name Aktivitet, r.name Lokale, p.first_name, p.last_name, ev.event_date, ev.start_time, ev.end_time FROM event_types e
INNER JOIN events ev ON ev.event_type_id = e.id
INNER JOIN persons p ON ev.instructor_id = p.id
INNER JOIN rooms r ON e.room_id = r.id





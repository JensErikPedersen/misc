USE Fitnesscenter;

SELECT * FROM zipcodes;

SELECT * FROM members;

SELECT * FROM center;

SELECT * FROM staff;


SELECT * FROM rooms;

SELECT * FROM events;

SELECT * FROM event_types;

SELECT * FROM registrations;


SELECT e.id Hold_ID, et.name Hold_Navn, e.eventdate, e.status, et.max_participants FROM events e
INNER JOIN event_types et ON event_type_id = et.id;



SELECT r.id, r.created Oprettet, et.name Holdnavn, e.eventdate Dato, m.first_name, r.status FROM registrations r
INNER JOIN events e ON r.event_id = e.id
INNER JOIN event_types et ON e.event_type_id=et.id
INNER JOIN members m ON r.member_id=m.id
ORDER BY e.eventdate;
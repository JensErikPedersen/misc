use eventmanagement;

DELETE FROM persons;

SELECT * FROM rooms;

ALTER TABLE persons AUTO_INCREMENT=1;

DROP DATABASE eventmanagement;

select * from event_types;

SELECT * FROM persons;

SELECT * FROM events;

SELECT * FROM events_persons;

UPDATE events SET parent_event_id = NULL;

#Events
SELECT e.name Aktivitet, r.name Lokale,  e.max_participants Max_participants, CONCAT(p.first_name, " ", p.last_name) Instructor, ev.event_date, ev.start_time, ev.end_time FROM event_types e
INNER JOIN events ev ON ev.event_type_id = e.id
INNER JOIN persons p ON ev.instructor_id = p.id
INNER JOIN rooms r ON e.room_id = r.id
ORDER BY e.name;

#Registrations
SELECT  e.name Aktivitet, r.name Lokale, CONCAT(i.first_name, " ", i.last_name) Instruktør, CONCAT(p.first_name, " ", p.last_name) Deltager, ev.event_date, ev.start_time, ev.end_time FROM events_persons ep
INNER JOIN events ev ON ep.event_id = ev.id
INNER JOIN persons p ON ep.person_id=p.id
INNER JOIN persons i ON ev.instructor_id= i.id
INNER JOIN event_types e ON e.id = event_type_id
INNER JOIN rooms r ON e.room_id = r.id
WHERE ep.status='P'
ORDER BY ev.event_date, ev.start_time;



# INSERT THAT SHOULD FAIL DUE TO INVALID status VALUE eg. 'Q'
INSERT INTO `eventmanagement`.`events_persons`
(`event_id`,
`person_id`,
`status`,
`created`,
`modified`)
VALUES
(1,
14,
'W',
current_timestamp(),
current_timestamp());


INSERT INTO `eventmanagement`.`events`
(`event_type_id`,
`event_date`,
`start_time`,
`end_time`,
`instructor_id`,
`parent_event_id`)
VALUES
(1,
'2017-05-01',
'15:10',
'16:10',
1,
NULL);

# Trigger handling invalid values in status field on table event_types. Only necessary since MySQL do not support CHECK option
# SEE create_tables script file for version implementing a FUNCTION

DROP TRIGGER TRG_events_persons_validate_status;

DROP TRIGGER TRG_events_validate_status;

DROP FUNCTION F_events_persons_validate_status;

DROP FUNCTION F_events_validate_status;

SELECT * FROM view_all_events;

SELECT * FROM view_all_registrations;

DROP VIEW view_all_registrations;

DROP VIEW view_all_events;


SELECT * from event_types;

DELETE from event_types;

DROP TABLE events;

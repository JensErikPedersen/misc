ALTER TABLE events AUTO_INCREMENT=1;

INSERT INTO `eventmanagement`.`events`
(`event_type_id`,
`start_datetime`,
`end_datetime`,
`instructor_id`,
`parent_event_id`)
VALUES
(1,
'2017-04-26 15:10:00',
'2017-04-26 16:10:00',
1,
NULL),
(1,
'2017-04-28 07:00:00',
'2017-04-28 08:00:00',
2,
NULL),
(2,
'2017-04-26 16:20:00',
'2017-04-26 17:20:00',
4,
NULL),
(2,
'2017-04-28 15:20:00',
'2017-04-28 16:20:00',
5,
NULL)
;


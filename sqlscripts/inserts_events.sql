ALTER TABLE events AUTO_INCREMENT=1;

INSERT INTO `eventmanagement`.`events`
(`event_type_id`,
`event_date`,
`start_time`,
`end_time`,
`instructor_id`,
`parent_event_id`)
VALUES
(1,
'2017-04-26',
'15:10',
'16:10',
1,
NULL),
(1,
'2017-04-28',
'07:00',
'08:00',
2,
NULL),
(2,
'2017-04-26',
'16:20',
'17:20',
4,
NULL),
(2,
'2017-04-28',
'15:20',
'16:20',
5,
NULL)
;


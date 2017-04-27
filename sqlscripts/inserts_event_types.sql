ALTER TABLE event_types AUTO_INCREMENT=1;

INSERT INTO `eventmanagement`.`event_types`
(`name`,
`event_type_prefix`, 
`max_participants`,
`waiting_list`,
`room_id`)
VALUES
('Boksning',
'BOX',
10,
true,
2),
('Spinning',
'SPN',
25,
true,
1),
('TRX',
'TRX',
10,
true,
2),
('Yoga',
'YGA',
12,
true,
2),
('Bodypump',
'BPU',
12,
true,
2)
;
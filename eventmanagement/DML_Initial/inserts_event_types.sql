<<<<<<< HEAD
USE eventmanagement;
GO


INSERT INTO event_types
(name,
event_type_prefix, 
max_participants,
waiting_list,
room_id)
VALUES
('Boksning',
'BOX',
10,
1,
2),
('Spinning',
'SPN',
25,
0,
1),
('TRX',
'TRX',
10,
1,
2),
('Yoga',
'YGA',
15,
0,
3),
('Bodypump',
'BPU',
20,
1,
4)
=======
USE fitnesscenter;

INSERT INTO event_types (
    name,
    max_participants,
    waiting_list,
    room_id
)
VALUES
(
	'Boksning',
	6,
	1,
	1
),
(
	'Spinning',	
	7,
	1,
	1
),
(
	'Yoga',	
	5,
	1,
	1
)
>>>>>>> 7f7e5583379a35d3f5ccf5ab7946874af0ba13c6
;
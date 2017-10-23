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
;
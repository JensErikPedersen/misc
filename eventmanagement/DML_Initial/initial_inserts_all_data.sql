USE fitnesscenter;

DBCC CHECKIDENT ('[center]', RESEED, 1);
DBCC CHECKIDENT ('[sal]', RESEED, 1);
DBCC CHECKIDENT ('[medarbejder]', RESEED, 1);
DBCC CHECKIDENT ('[medlem]', RESEED, 1);
DBCC CHECKIDENT ('[hold]', RESEED, 1);
DBCC CHECKIDENT ('[holdtype]', RESEED, 1);
DBCC CHECKIDENT ('[tilmelding]', RESEED, 1);
GO

BEGIN TRANSACTION tran_insert_initial;

-- INSERT zipcodes
INSERT INTO postnummer
VALUES (
	3050,
	'Humlebæk'
),(
	3480,
	'Fredensborg'
),(
	3060,
	'Espergærde'
);

-- INSERT center
INSERT INTO center(
	navn,
	adresse,
	postnr,
	telefonnummer
)
VALUES (
	'TopFitness Humlebæk',
	'Hovegaden 1',
	3050,
	'45678912'
);

-- INSERT rooms
INSERT INTO sal(
	navn,
	kapacitet,
	center_id
)
VALUES (
	'Spinning salen',
	7,
	1
),(
	'Bokse salen',
	6,
	1
),(
	'Yoga salen',
	5,
	1
);

-- INSERT staff
INSERT INTO medarbejder(
	fornavn,
	efternavn,
	adresse,
	postnr,
	mobilnummer,
	type,
	center_id,
	leder_id
)
VALUES (
	'Frede',
	'Andersen',
	'Hovedgaden 2',
	3050,
	'44556677',
	'I',
	1,
	NULL
),
(
	'Karina',
	'Jensen',
	'Landevejen 105',
	3060,
	'77553322',
	'A',
	1,
	1
),
(
	'Lise',
	'Petersen',
	'Stationsvej 37',
	3480,
	'44223366',
	'A',
	1,
	1
),
(
	'Lennart',
	'Knudsen',
	'Ritavej 9',
	3050,
	'77113355',
	'I',
	1,
	1
),
(
	'Bo',
	'Hansen',
	'Lavendelvej 3',
	3050,
	'44228899',
	'I',
	1,
	1
),
(
	'Charlotte',
	'Bjerre',
	'Hovedgaden 45',
	3480,
	'77113355',
	'I',
	1,
	1
),
(
	'Maria',
	'Jørgensen',
	'Stationsvej 17',
	3060,
	'44113388',
	'I',
	1,
	1
),
(
	'Johan',
	'Larsen',
	'Musvitvej 12',
	3050,
	'11668877',
	'A',
	1,
	1
)

-- INSERT members
INSERT INTO medlem(
	fornavn,
	efternavn,
	adresse,
	postnr,
	email,
	mobilnummer
)
VALUES (
	'Jørgen',
	'Hansen',
	'Skolevej 5',
	3050,
	'jorgen@hansen.com',
	'12345678'
),
(
	'Gerda',
	'Jensen',
	'Stationsvej 15',
	3060,
	'gerda@jensen.dk',
	'98765432'
),
(
	'Bent',
	'Sørensen',
	'Kirkestræde 2',
	3480,
	'bent@sorensen.dk',
	'16742337'
),
(
	'Jette',
	'Nielsen',
	'Strandvej 8',
	3050,
	'j@nielsen.dk',
	'66442288'
),
(
	'Berit',
	'Vangsgaard',
	'Fasanvej 24',
	3480,
	'beritv@yahoo.dk',
	NULL
),
(
	'Lars',
	'Johansen',
	'Bygaden 54',
	3060,
	'lj@hotmail.com',
	'75315964'
),
(
	'Thomas',
	'Larsen',
	'Hovedgaden 32',
	3050,
	'thl@gmail.com',
	NULL
),
(
	'Betina',
	'Nielsen',
	'Skovvej 13',
	3060,
	'bni@yahoo.dk',
	'12384754'
),
(
	'Kurt',
	'Jensen',
	'Strædet 19',
	3050,
	'kjen@hotamil.com',
	NULL
),
(
	'Søren',
	'Hansen',
	'Gyden 5',
	3480,
	'shans@yahoo.dk',
	'42487799'
);

-- INSERT event_types
INSERT INTO holdtype(
    navn,
	max_deltagere,   
    venteliste,
    sal_id
)
VALUES
(
	'Boksning',
	6,
	1,
	2
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
	3
);

-- INSERT events
INSERT INTO hold(
    holdtype_id,
    dato,
    starttid,
	sluttid,
    instruktor_id,
    status
)
VALUES (
	1,
	'2017-10-17',
	'16:00:00',
	'17:00:00',
	1,
	'P'
),
(
	1,
	'2017-10-23',
	'16:00:00',
	'17:00:00',
	5,
	'A'
),
(
	1,
	'2017-10-26',
	'16:00:00',
	'17:00:00',
	5,
	'P'
),
(
	1,
	'2017-10-29',
	'16:00:00',
	'17:00:00',
	1,
	'P'
),
(
	1,
	'2017-11-02',
	'19:00:00',
	'20:00:00',
	5,
	'P'
),
 (
	2,
	'2017-10-17',
	'17:00:00',
	'18:00:00',
	6,
	'A'
),
(
	2,
	'2017-10-22',
	'17:00:00',
	'18:00:00',
	6,
	'P'
),
(
	2,
	'2017-10-25',
	'16:00:00',
	'17:00:00',
	7,
	'P'
),
(
	2,
	'2017-10-27',
	'17:00:00',
	'18:00:00',
	7,
	'P'
),
(
	2,
	'2017-11-03',
	'19:00:00',
	'20:00:00',
	4,
	'P'
),
 (
	3,
	'2017-10-15',
	'17:00:00',
	'18:00:00',
	7,
	'P'
),
(
	3,
	'2017-10-18',
	'18:00:00',
	'19:00:00',
	6,
	'P'
),
(
	3,
	'2017-10-21',
	'16:00:00',
	'17:00:00',
	7,
	'P'
),
(
	3,
	'2017-10-24',
	'17:00:00',
	'18:00:00',
	6,
	'P'
),
(
	3,
	'2017-10-29',
	'20:00:00',
	'21:00:00',
	7,
	'P'
),
(
	3,
	'2017-11-01',
	'19:00:00',
	'20:00:00',
	6,
	'P'
),
(
	3,
	'2017-11-05',
	'17:00:00',
	'18:00:00',
	7,
	'P'
);

-- INSERT registrations

INSERT INTO tilmelding(
    hold_id,
    medlem_id,
    status,
	created
)
VALUES (
	1,
	1,
	'D',
	'2017-10-16 12:05:42'	
),
(
	1,
	3,
	'D',
	'2017-10-15 17:55:12'	
),
(
	1,
	7,
	'D',
	'2017-10-15 11:22:19'	
),
(
	1,
	6,
	'D',
	'2017-10-13 08:37:31'	
),
(
	1,
	8,
	'A',
	'2017-10-14 09:19:42'	
),
(
	3,
	1,
	'D',
	'2017-10-18 14:12:32'	
),
(
	3,
	3,
	'D',
	'2017-10-19 14:09:45'	
),
(
	3,
	2,
	'D',
	'2017-10-21 16:19:02'	
),
(
	3,
	6,
	'D',
	'2017-10-20 15:37:01'	
),
(
	4,
	6,
	'D',
	'2017-10-20 07:16:41'	
),
(
	4,
	4,
	'D',
	'2017-10-18 13:28:13'	
),
(
	4,
	5,
	'D',
	'2017-10-20 07:16:41'	
),
(
	4,
	2,
	'D',
	'2017-10-19 19:22:14'	
),
(
	6,
	1,
	'D',
	'2017-10-15 09:42:32'	
),
(
	6,
	7,
	'D',
	'2017-10-15 13:41:19'	
),
(
	6,
	4,
	'A',
	'2017-10-16 07:47:41'	
),
(
	6,
	2,
	'D',
	'2017-10-15 21:05:13'	
),
(
	6,
	3,
	'D',
	'2017-10-16 10:09:55'	
),
(
	6,
	5,
	'D',
	'2017-10-15 18:03:47'	
),
(
	6,
	10,
	'D',
	'2017-10-16 15:22:01'	
),
(
	6,
	2,
	'D',
	'2017-10-17 08:32:14'	
),
(
	6,
	8,
	'V',
	'2017-10-17 12:28:38'	
),
(
	11,
	3,
	'D',
	'2017-10-14 08:32:01'	
),
(
	11,
	4,
	'D',
	'2017-10-13 14:27:55'	
),
(
	11,
	5,
	'D',
	'2017-10-12 19:14:39'	
),
(
	11,
	8,
	'D',
	'2017-10-13 13:45:27'	
),
(
	11,
	9,
	'D',
	'2017-10-14 14:01:56'	
);

COMMIT TRANSACTION tran_insert_initial;

-- SELECT ALL FROM ALL TABLES
SELECT * FROM postnummer;
SELECT * FROM center;
SELECT * FROM sal;
SELECT * FROM medarbejder;
SELECT * FROM medlem;
SELECT * FROM holdtype;
SELECT * FROM hold;
SELECT * FROM tilmelding;

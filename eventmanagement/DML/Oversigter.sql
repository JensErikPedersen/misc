-- VIEWS

/*
Følgende oversigter er tiltænkt centerlederen:
-	Oversigt over centerets medarbejdere
-	Oversigt over alle tilmeldinger
-	Samlet antal tilmeldinger på en holdtype i et givent dato interval
-	Oversigt over alle Hold i et givent dato interval
*/

-- Oversigt over centerets medarbejdere
SELECT * FROM staff;

-- Oversigt over alle tilmeldinger
SELECT * FROM VIEW_all_registrations;

-- Samlet antal tilmeldinger på en holdtype i et givent dato interval
-- Her eksemplificeret ved holdtype Boks* og et dato interval
SELECT COUNT(*) [Antal Tilmeldinger] FROM VIEW_all_registrations v
WHERE v.Holdtype LIKE 'Boks%' AND v.HoldDato BETWEEN '2017-10-01' AND '2017-10-26';

-- Oversigt over alle Hold i et givent dato interval
SELECT * FROM VIEW_all_events v
WHERE v.Dato BETWEEN '2017-10-01' AND '2017-10-26';


/*
	Følgende oversigter er tiltænkt Assistenten:
	-	Oversigt over alle hold af i den kommende måned
	-	Oversigt over et medlems tilmeldinger
	-	Oversigt over antal tilmeldinger på et givent hold
	-	Oversigt over centerets medlemmer
	-	Oversigt over et medlem fremfundet ved søgning på fornavn, del af efternavn, del af email og mobiltelefon nummer.	
*/

-- Oversigt over alle hold af i den kommende måned (sorteret på dato)
SELECT * FROM VIEW_all_events v
WHERE v.Dato BETWEEN GETDATE() AND DATEADD (month , 1, GETDATE())
ORDER BY v.Dato;

-- Oversigt over et medlems tilmeldinger
SELECT * FROM VIEW_all_registrations v
WHERE v.Medlemsnummer = 1;

-- Oversigt over antal tilmeldinger på et givent hold
SELECT v.Holdtype Hold, COUNT(*) [Antal tilmeldinger] FROM VIEW_all_registrations v
WHERE v.HoldNummer = 4
GROUP BY v.Holdtype;

-- Oversigt over centerets medlemmer
SELECT * FROM members;

-- Oversigt over et medlem fremfundet ved søgning på del af fornavn, del af efternavn eller del af email
-- Her eksemplificeret ved strengen 'Han'
SELECT * FROM members m
WHERE m.first_name LIKE '%Han%' OR m.last_name LIKE '%Han%' OR m.email LIKE '%Han%';



/*
	Følgende oversigter er tiltænkt Instruktøren:
	-	Oversigt over egne hold i den kommende måned
	-	Oversigt over tilmeldinger til egne hold i den kommende måned
*/

-- Oversigt over egne hold i den kommende måned
-- Her eksemplificeret ved personale nummer 7
SELECT * FROM VIEW_all_events v
WHERE v.Personalenummer = 7 AND v.Dato BETWEEN GETDATE() AND DATEADD (month , 1, GETDATE())
ORDER BY v.Dato;

-- Oversigt over tilmeldinger til egne hold i den kommende måned
-- Her eksemplificeret ved personale nummer 5
SELECT * FROM VIEW_all_registrations v
WHERE v.Personalenummer = 5 AND v.HoldDato BETWEEN GETDATE() AND DATEADD (month , 1, GETDATE())
ORDER BY v.HoldDato;

















-- Antal tilmeldinger på et givent hold
SELECT COUNT(*) Tilmeldinger, et.name FROM registrations r
INNER JOIN events e ON r.event_id = e.id
INNER JOIN event_types et ON et.id = e.event_type_id
WHERE r.event_id = 1
GROUP BY et.name;


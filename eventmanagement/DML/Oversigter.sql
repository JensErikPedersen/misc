-- Oversigter
USE fitnesscenter;

/*
F�lgende oversigter er tilt�nkt centerlederen:
-	Oversigt over centerets medarbejdere
-	Oversigt over alle tilmeldinger
-	Samlet antal tilmeldinger p� en holdtype i et givent dato interval
-	Oversigt over alle Hold i et givent dato interval
*/

-- Oversigt over centerets medarbejdere
SELECT * FROM medarbejder;

-- Oversigt over alle tilmeldinger
SELECT * FROM VIEW_all_registrations;

-- Samlet antal tilmeldinger p� en holdtype i et givent dato interval
-- Her eksemplificeret ved holdtype Boks* og et dato interval
SELECT COUNT(*) [Antal Tilmeldinger] FROM VIEW_all_registrations v
WHERE v.Holdtype LIKE 'Boks%' AND v.HoldDato BETWEEN '2017-10-01' AND '2017-10-26';

-- Oversigt over alle Hold i et givent dato interval
SELECT * FROM VIEW_all_events v
WHERE v.Dato BETWEEN '2017-10-01' AND '2017-10-26';


/*
	F�lgende oversigter er tilt�nkt Assistenten:
	-	Oversigt over alle hold af i den kommende m�ned
	-	Oversigt over et medlems tilmeldinger
	-	Oversigt over antal tilmeldinger p� et givent hold
	-	Oversigt over centerets medlemmer
	-	Oversigt over et medlem fremfundet ved s�gning p� fornavn, del af efternavn, del af email og mobiltelefon nummer.	
*/

-- Oversigt over alle hold af i den kommende m�ned (sorteret p� dato)
SELECT * FROM VIEW_all_events v
WHERE v.Dato BETWEEN GETDATE() AND DATEADD (month , 1, GETDATE())
ORDER BY v.Dato;

-- Oversigt over et medlems tilmeldinger
-- Eksemplificeret ved medlemsnr 1
SELECT * FROM VIEW_all_registrations v
WHERE v.Medlemsnummer = 1;

-- Oversigt over antal tilmeldinger p� et givent hold
-- Eksemplificeret ved holdnummer 4
SELECT v.Holdtype Hold, COUNT(*) [Antal tilmeldinger] FROM VIEW_all_registrations v
WHERE v.HoldNummer = 4
GROUP BY v.Holdtype;

-- Oversigt over centerets medlemmer
SELECT * FROM medlem;

-- Oversigt over et medlem fremfundet ved s�gning p� del af fornavn, del af efternavn eller del af email
-- Her eksemplificeret ved strengen 'Han'
SELECT * FROM medlem m
WHERE m.fornavn LIKE '%Han%' OR m.efternavn LIKE '%Han%' OR m.email LIKE '%Han%';



/*
	F�lgende oversigter er tilt�nkt Instrukt�ren:
	-	Oversigt over egne hold i den kommende m�ned
	-	Oversigt over tilmeldinger til egne hold i den kommende m�ned
*/

-- Oversigt over egne hold i den kommende m�ned
-- Her eksemplificeret ved personale nummer 7
SELECT * FROM VIEW_all_events v
WHERE v.Personalenummer = 7 AND v.Dato BETWEEN GETDATE() AND DATEADD (month , 1, GETDATE())
ORDER BY v.Dato;

-- Oversigt over tilmeldinger til egne hold i den kommende m�ned
-- Her eksemplificeret ved personale nummer 5
SELECT * FROM VIEW_all_registrations v
WHERE v.Personalenummer = 5 AND v.HoldDato BETWEEN GETDATE() AND DATEADD (month , 1, GETDATE())
ORDER BY v.HoldDato;


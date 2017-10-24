USE fitnesscenter;
GO
-- CREATE VIEWS

CREATE VIEW VIEW_all_events AS
	SELECT ev.id HoldNummer, e.navn Holdtype, r.navn Fitnessrum, p.id Personalenummer, (p.fornavn + ' ' + p.efternavn) Instruktør, ev.dato Dato, ev.starttid Start, ev.sluttid Slut FROM holdtype e
		INNER JOIN hold ev ON ev.holdtype_id = e.id
		INNER JOIN medlem p ON ev.instruktor_id = p.id
		INNER JOIN sal r ON e.sal_id = r.id;	
GO

CREATE VIEW VIEW_all_registrations AS
	SELECT ev.id HoldNummer,e.navn Holdtype, s.id Personalenummer, p.id Medlemsnummer, CONCAT(p.fornavn + ' ', p.efternavn) Deltager, ep.created TilmeldingsDato, ev.dato HoldDato, ev.starttid Start, ev.sluttid Slut, ep.status Status FROM tilmelding ep
		INNER JOIN hold ev ON ep.hold_id = ev.id
		INNER JOIN medarbejder s ON s.id = ev.instruktor_id
		INNER JOIN medlem p ON ep.medlem_id=p.id
		INNER JOIN holdtype e ON e.id = ev.holdtype_id
		INNER JOIN sal r ON e.sal_id = r.id;
GO

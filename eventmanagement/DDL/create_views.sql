USE fitnesscenter;
GO
-- CREATE VIEWS

CREATE VIEW VIEW_all_events AS
	SELECT ev.id HoldNummer, e.name Holdtype, r.name Fitnessrum, p.id Personalenummer, (p.first_name + ' ' + p.last_name) Instruktør, ev.eventdate Dato, ev.starttime Start, ev.endtime Slut FROM event_types e
		INNER JOIN events ev ON ev.event_type_id = e.id
		INNER JOIN members p ON ev.instructor_id = p.id
		INNER JOIN rooms r ON e.room_id = r.id;	
GO

CREATE VIEW VIEW_all_registrations AS
	SELECT ev.id HoldNummer,e.name Holdtype, s.id Personalenummer, p.id Medlemsnummer, CONCAT(p.first_name + ' ', p.last_name) Deltager, ep.created TilmeldingsDato, ev.eventdate HoldDato, ev.starttime Start, ev.endtime Slut, ep.status Status FROM registrations ep
		INNER JOIN events ev ON ep.event_id = ev.id
		INNER JOIN staff s ON s.id = ev.instructor_id
		INNER JOIN members p ON ep.member_id=p.id
		INNER JOIN event_types e ON e.id = ev.event_type_id
		INNER JOIN rooms r ON e.room_id = r.id;
GO

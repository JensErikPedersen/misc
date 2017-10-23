USE fitnesscenter;

SELECT COUNT(*) [Antal Tilmeldinger] FROM VIEW_all_registrations v
WHERE v.Holdtype LIKE 'Boks%' AND v.HoldDato BETWEEN '2017-10-01' AND '2017-10-26';



SELECT ev.id HoldNummer, e.name Holdtype, r.name Fitnessrum, p.id Personalenummer, (p.first_name + ' ' + p.last_name) Instruktør, ev.eventdate Dato, ev.starttime Start, ev.endtime Slut FROM event_types e
		INNER JOIN events ev ON ev.event_type_id = e.id
		INNER JOIN members p ON ev.instructor_id = p.id
		INNER JOIN rooms r ON e.room_id = r.id

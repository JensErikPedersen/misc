/*
	INDEX CREATION
*/
USE fitnesscenter;
GO

-- medlem
CREATE INDEX IDX_tilmeldinger
ON medlem(fornavn, efternavn, email);

-- alle tabeller på fremmednøgler

CREATE INDEX IDX_medlem_postnr_FK
ON medlem(postnr);

CREATE INDEX IDX_center_postnr_FK
ON center(postnr);

CREATE INDEX IDX_sal_center_FK
ON sal(center_id);

CREATE INDEX IDX_medarbejder_postnr_FK
ON medarbejder(postnr);

CREATE INDEX IDX_medarbejder_center_FK
ON medarbejder(center_id);

CREATE INDEX IDX_holdtype_sal_FK
ON holdtype(sal_id);

CREATE INDEX IDX_tilmelding_hold_FK
ON tilmelding(hold_id);

CREATE INDEX IDX_tilmelding_medlem_FK
ON tilmelding(medlem_id);

CREATE INDEX IDX_hold_holdtype_FK
ON hold(holdtype_id);

CREATE INDEX IDX_hold_instruktor_FK
ON hold(instruktor_id);


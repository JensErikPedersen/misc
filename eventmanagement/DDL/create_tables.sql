CREATE DATABASE fitnesscenter;
GO

USE fitnesscenter;
GO
-- CREATE TABLES


CREATE TABLE postnummer (
	postnr SMALLINT NOT NULL PRIMARY KEY,
	bynavn VARCHAR(30) NOT NULL
);

CREATE TABLE center (
	id TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	navn VARCHAR(30) NOT NULL,
	adresse VARCHAR(40) NOT NULL,
	postnr SMALLINT NOT NULL,
	telefonnummer VARCHAR(15) NOT NULL,
	CONSTRAINT FK_center_zipcode FOREIGN KEY(postnr) REFERENCES postnummer(postnr)
);

CREATE TABLE medarbejder (
	id SMALLINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    fornavn VARCHAR(20) NOT NULL,
    efternavn VARCHAR(30) NOT NULL,
	adresse VARCHAR(40) NOT NULL,
	postnr SMALLINT NOT NULL,
	mobilnummer VARCHAR(15),    
	type CHAR(1) NOT NULL,
	center_id TINYINT NOT NULL,
	leder_id SMALLINT,
	CONSTRAINT CHK_staff_status CHECK (type IN ('A', 'I')),
	CONSTRAINT FK_staff_zipcode FOREIGN KEY(postnr) REFERENCES postnummer(postnr),
	CONSTRAINT FK_staff_center FOREIGN KEY(center_id) REFERENCES center(id),
	CONSTRAINT FK_staff_staff FOREIGN KEY(leder_id) REFERENCES medarbejder(id)
);

CREATE TABLE medlem (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    fornavn VARCHAR(20) NOT NULL,
    efternavn VARCHAR(30) NOT NULL,
	adresse VARCHAR(40) NOT NULL,
	postnr SMALLINT NOT NULL,    
	email VARCHAR(50) NOT NULL,
    mobilnummer VARCHAR(15),	
	CONSTRAINT FK_member_zipcode FOREIGN KEY(postnr) REFERENCES postnummer(postnr)	
);

CREATE TABLE sal (
	id TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    navn VARCHAR(20) NOT NULL ,
    kapacitet TINYINT NOT NULL,
	center_id TINYINT NOT NULL,
	CONSTRAINT FK_rooms_center FOREIGN KEY(center_id) REFERENCES center(id)
);

CREATE TABLE holdtype (
	id TINYINT NOT NULL IDENTITY(1,1),
    navn VARCHAR(20) NOT NULL,
	max_deltagere TINYINT NOT NULL,
    venteliste BIT NOT NULL DEFAULT 1, 
    sal_id TINYINT NOT NULL,
	CONSTRAINT PK_event_types PRIMARY KEY(id),
    CONSTRAINT FK_eventtype_rooms FOREIGN KEY(sal_id) REFERENCES sal(id)
);

CREATE TABLE hold (
	id SMALLINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    holdtype_id TINYINT NOT NULL,
    dato DATE NOT NULL,
    starttid TIME(0) NOT NULL,
	sluttid TIME(0) NOT NULL,
    instruktor_id SMALLINT NOT NULL,
    status CHAR(1) NOT NULL CHECK (status IN ('P', 'A')) DEFAULT 'P',    
	CONSTRAINT FK_event_staff FOREIGN KEY(instruktor_id) REFERENCES medarbejder(id),
    CONSTRAINT FK_event_eventtypes FOREIGN KEY(holdtype_id) REFERENCES holdtype(id) ON DELETE CASCADE   
);

CREATE TABLE tilmelding (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    hold_id SMALLINT NOT NULL,
    medlem_id INT NOT NULL,
    status char(1) NOT NULL,
	created DATETIME,
    CONSTRAINT CHK_registrations_status CHECK(status IN ('D', 'V', 'A')),
    CONSTRAINT FK_registrations_events FOREIGN KEY(hold_id) REFERENCES hold(id) ON DELETE CASCADE,
    CONSTRAINT FK_registrations_members FOREIGN KEY(medlem_id) REFERENCES medlem(id) ON DELETE CASCADE
);


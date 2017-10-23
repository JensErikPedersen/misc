CREATE DATABASE fitnesscenter;
GO

USE fitnesscenter;
GO
-- CREATE TABLES


CREATE TABLE zipcodes (
	zipcode SMALLINT NOT NULL PRIMARY KEY,
	city VARCHAR(30) NOT NULL
);

CREATE TABLE center (
	id TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	address VARCHAR(40) NOT NULL,
	zipcode SMALLINT NOT NULL,
	phonenumber VARCHAR(15) NOT NULL,
	CONSTRAINT FK_center_zipcode FOREIGN KEY(zipcode) REFERENCES zipcodes(zipcode)
);

CREATE TABLE staff (
	id SMALLINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
	address VARCHAR(40) NOT NULL,
	zipcode SMALLINT NOT NULL,
	mobile_phone VARCHAR(15),    
	type CHAR(1) NOT NULL,
	center_id TINYINT NOT NULL,
	manager_id SMALLINT,
	CONSTRAINT CHK_staff_status CHECK (type IN ('A', 'I')),
	CONSTRAINT FK_staff_zipcode FOREIGN KEY(zipcode) REFERENCES zipcodes(zipcode),
	CONSTRAINT FK_staff_center FOREIGN KEY(center_id) REFERENCES center(id),
	CONSTRAINT FK_staff_staff FOREIGN KEY(manager_id) REFERENCES staff(id)
);

CREATE TABLE members (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
	address VARCHAR(40) NOT NULL,
	zipcode SMALLINT NOT NULL,    
	email VARCHAR(50) NOT NULL,
    mobile_phone VARCHAR(15),	
	CONSTRAINT FK_member_zipcode FOREIGN KEY(zipcode) REFERENCES zipcodes(zipcode)	
);

CREATE TABLE rooms (
	id TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20) NOT NULL ,
    max_participants TINYINT NOT NULL,
	center_id TINYINT NOT NULL,
	CONSTRAINT FK_rooms_center FOREIGN KEY(center_id) REFERENCES center(id)
);

CREATE TABLE event_types (
	id TINYINT NOT NULL IDENTITY(1,1),
    name VARCHAR(20) NOT NULL,   
    waiting_list BIT NOT NULL DEFAULT 1,  
    room_id TINYINT NOT NULL,
	CONSTRAINT PK_event_types PRIMARY KEY(id),
    CONSTRAINT FK_eventtype_rooms FOREIGN KEY(room_id) REFERENCES rooms(id)
);

CREATE TABLE events (
	id SMALLINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    event_type_id TINYINT NOT NULL,
    eventdate DATE NOT NULL,
    starttime TIME(0) NOT NULL,
	endtime TIME(0) NOT NULL,
    instructor_id SMALLINT NOT NULL,
    status CHAR(1) NOT NULL CHECK (status IN ('P', 'A')) DEFAULT 'P',    
	CONSTRAINT FK_event_staff FOREIGN KEY(instructor_id) REFERENCES staff(id),
    CONSTRAINT FK_event_eventtypes FOREIGN KEY(event_type_id) REFERENCES event_types(id) ON DELETE CASCADE   
);

CREATE TABLE registrations (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    event_id SMALLINT NOT NULL,
    member_id INT NOT NULL,
    status char(1) NOT NULL,
	created DATETIME NOT NULL,
    CONSTRAINT CHK_registrations_status CHECK(status IN ('D', 'V', 'A')),
    CONSTRAINT FK_registrations_events FOREIGN KEY(event_id) REFERENCES events(id) ON DELETE CASCADE,
    CONSTRAINT FK_registrations_members FOREIGN KEY(member_id) REFERENCES members(id) ON DELETE CASCADE
);


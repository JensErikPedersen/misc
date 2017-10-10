--CREATE DATABASE eventmanagement;

USE eventmanagement;

-- CREATE TABLES
CREATE TABLE members (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(20) NOT NULL,
    last_name NVARCHAR(30) NOT NULL,    
	email NVARCHAR(25) NOT NULL,
    mobile_phone NVARCHAR(30),
	created TIMESTAMP NOT NULL,
    modified DATETIME NOT NULL	
);


CREATE TABLE rooms (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(20) NOT NULL ,
    location NVARCHAR(20) NOT NULL,
    max_participants INT NOT NULL 
);

CREATE TABLE event_types (
	id INT NOT NULL IDENTITY(1,1),
    name NVARCHAR(20) NOT NULL,
    event_type_prefix CHAR(3) NOT NULL,
    max_participants INT NOT NULL,
    waiting_list BIT NOT NULL DEFAULT 1,
    room_id INT NOT NULL,
	CONSTRAINT PK_id PRIMARY KEY(id),
    CONSTRAINT FK_eventtype_rooms FOREIGN KEY(room_id) REFERENCES rooms(id)
);

CREATE TABLE events (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    event_type_id INT NOT NULL,
    eventdate DATETIME NOT NULL,
    starttime TIME(0) NOT NULL,
	endtime TIME(0) NOT NULL,
    instructor_id INT NOT NULL,
    parent_event_id INT DEFAULT NULL,
    status CHAR(1) NOT NULL CHECK (status IN ('S', 'C')) DEFAULT 'S',
    CONSTRAINT FK_event_persons FOREIGN KEY(instructor_id) REFERENCES members(id),
    CONSTRAINT FK_event_eventtypes FOREIGN KEY(event_type_id) REFERENCES event_types(id) ON DELETE CASCADE,
    CONSTRAINT FK_event_event FOREIGN KEY(parent_event_id) REFERENCES events(id)
);

CREATE TABLE events_persons (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    event_id INT NOT NULL,
    person_id INT NOT NULL,
    status char(1) NOT NULL,
	created datetime NOT NULL,
    modified timestamp NOT NULL,
    CONSTRAINT CHK_status CHECK(status IN ('P', 'W', 'C')),
    CONSTRAINT FK_eventpersons_event FOREIGN KEY(event_id) REFERENCES events(id),
    CONSTRAINT FK_eventpersons_persons FOREIGN KEY(person_id) REFERENCES members(id)
);

CREATE TABLE logs (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    message NVARCHAR(150) NOT NULL,
    type NVARCHAR(15),
    source NVARCHAR(20),
    created TIMESTAMP NOT NULL    
);
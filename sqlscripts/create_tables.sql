CREATE DATABASE eventmanagement;

USE eventmanagement;

# CREATE TABLES
CREATE TABLE persons (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name nvarchar(20) NOT NULL,
    last_name nvarchar(30) NOT NULL,
    userid char(3) NOT NULL,
    email nvarchar(25),
    mobile_phone nvarchar(30),
    created datetime NOT NULL,
    modified timestamp NOT NULL,
    UNIQUE(userid)
);

CREATE TABLE rooms (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name nvarchar(20) NOT NULL ,
    location nvarchar(20) NOT NULL,
    max_participants INT NOT NULL 
);

CREATE TABLE event_types (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name nvarchar(20) NOT NULL,
    event_type_prefix char(3) NOT NULL,
    max_participants INT NOT NULL,
    waiting_list boolean NOT NULL DEFAULT true,
    room_id INT NOT NULL,
    CONSTRAINT FK_eventtype_rooms FOREIGN KEY(room_id) REFERENCES rooms(id)
);

CREATE TABLE events (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    event_type_id INT NOT NULL,
    start_datetime datetime NOT NULL,
    end_datetime datetime NOT NULL,
    instructor_id INT NOT NULL,
    parent_event_id INT DEFAULT NULL,
    status char(1) NOT NULL DEFAULT 'S',
    CONSTRAINT FK_event_persons FOREIGN KEY(instructor_id) REFERENCES persons(id),
    CONSTRAINT FK_event_eventtypes FOREIGN KEY(event_type_id) REFERENCES event_types(id) ON DELETE CASCADE,
    CONSTRAINT FK_event_event FOREIGN KEY(parent_event_id) REFERENCES events(id)
);

CREATE TABLE events_persons (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    person_id INT NOT NULL,
    status char(1) NOT NULL,
	created datetime NOT NULL,
    modified timestamp NOT NULL,
    CONSTRAINT CHK_status CHECK(status='P' OR status='W' OR status='C'),
    CONSTRAINT FK_eventpersons_event FOREIGN KEY(event_id) REFERENCES events(id) ON DELETE CASCADE,
    CONSTRAINT FK_eventpersons_persons FOREIGN KEY(person_id) REFERENCES persons(id) ON DELETE CASCADE
);

CREATE TABLE logs (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    message nvarchar(150) NOT NULL,
    type nvarchar(15),
    source nvarchar(20),
    created datetime NOT NULL    
);
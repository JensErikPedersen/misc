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
    modified timestamp NOT NULL
);

CREATE TABLE rooms (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name nvarchar(20),
    location nvarchar(20)
);

CREATE TABLE event_types (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name nvarchar(20) NOT NULL,
    max_participants INT NOT NULL,
    waiting_list boolean NOT NULL DEFAULT true,
    room_id INT NOT NULL,
    CONSTRAINT FK_eventtype_rooms FOREIGN KEY(room_id) REFERENCES rooms(id)
);

CREATE TABLE events (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    event_type_id INT NOT NULL,
    event_date date NOT NULL,
    start_time time NOT NULL,
    end_time time NOT NULL,
    instructor_id INT NOT NULL,
    parent_event_id INT DEFAULT NULL,
    CONSTRAINT FK_event_persons FOREIGN KEY(instructor_id) REFERENCES persons(id),
    CONSTRAINT FK_event_eventtypes FOREIGN KEY(event_type_id) REFERENCES event_types(id) ON DELETE CASCADE,
    CONSTRAINT FK_event_event FOREIGN KEY(parent_event_id) REFERENCES events(id)
);

CREATE TABLE events_persons (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    person_id INT NOT NULL,
    status char(1),
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


# VALIDATOR FUNCTION FOR events_persons status FIELD
DELIMITER $$
CREATE FUNCTION F_events_persons_validate_status(status char)
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
	IF(status = 'P' OR status = 'W' OR status = 'C') THEN
		RETURN 1;
    END IF;
    RETURN 0;
       
END$$

DELIMITER;


# Trigger handling invalid values in status field on table event_types. Only necessary since MySQL do not support CHECK option
DELIMITER $$

CREATE TRIGGER TRG_events_persons_validate_status BEFORE INSERT ON events_persons 
FOR EACH ROW
BEGIN
	DECLARE msg nvarchar(255);
    SET msg = CONCAT('ERROR: Invalid value for status "', new.status, '". Allowed values are P, W and C');
  
	IF(F_events_persons_validate_status(new.status)=0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END$$

DELIMITER;



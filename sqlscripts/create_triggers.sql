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

DELIMITER ;

DELIMITER $$

CREATE TRIGGER TRG_events_validate_status BEFORE INSERT ON events
FOR EACH ROW
BEGIN
	DECLARE msg nvarchar(255);
    SET msg = CONCAT('ERROR: Invalid value for status "', new.status, '". Allowed values are S and C');
    
    IF(F_events_validate_status(new.status)=0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	END IF;
END$$

DELIMITER ;



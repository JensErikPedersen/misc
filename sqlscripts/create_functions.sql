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

DELIMITER ;

# VALIDATOR FUNCTION FOR events status FIELD
DELIMITER $$
CREATE FUNCTION F_events_validate_status(statuc char)
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
	if(status = 'S' OR status = 'C') THEN
		RETURN 1;
	END IF;
    RETURN 0;
END$$

DELIMITER ;
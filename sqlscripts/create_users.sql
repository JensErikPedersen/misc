CREATE USER 'events_user' IDENTIFIED BY 'events123';

CREATE USER 'events_admin' IDENTIFIED BY 'events123';

GRANT SELECT ON eventmanagement.* TO 'events_user', 'events_admin';

GRANT INSERT, DELETE, UPDATE ON eventmanagement.persons TO 'events_admin';
GRANT INSERT, DELETE, UPDATE ON eventmanagement.rooms TO 'events_admin';
GRANT INSERT, DELETE, UPDATE ON eventmanagement.logs TO 'events_admin';
GRANT INSERT, DELETE, UPDATE ON eventmanagement.event_types TO 'events_admin';
GRANT INSERT, DELETE, UPDATE ON eventmanagement.events TO 'events_admin', 'events_user';

SHOW GRANTS FOR 'events_user';

USE mysql;

SELECT * FROM user;

DROP USER 'events_read', 'events_write', 'events_admin';

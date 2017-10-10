USE [master]
CREATE LOGIN evtmng_admin WITH PASSWORD=N'admin123', DEFAULT_DATABASE=eventmanagement, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN evtmng_membr WITH PASSWORD=N'membr123', DEFAULT_DATABASE=eventmanagement, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE eventmanagement;

CREATE USER admin FOR LOGIN evtmng_admin;
CREATE USER member FOR LOGIN evtmng_membr;
GO

CREATE ROLE members AUTHORIZATION dbo;
CREATE ROLE admins AUTHORIZATION dbo;
GO

ALTER ROLE admins ADD MEMBER admin;
ALTER ROLE members ADD MEMBER member;
GO

USE eventmanagement;

GRANT SELECT ON SCHEMA::dbo TO members;

GRANT SELECT, INSERT, DELETE, UPDATE, EXECUTE ON SCHEMA::dbo TO admins;
GRANT SELECT, INSERT, DELETE, UPDATE ON dbo.events_persons TO members;

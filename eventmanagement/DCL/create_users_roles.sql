USE [master]
CREATE LOGIN fitnesscenter_manager WITH PASSWORD=N'admin123', DEFAULT_DATABASE=fitnesscenter, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN fitnesscenter_assistent WITH PASSWORD=N'membr123', DEFAULT_DATABASE=fitnesscenter, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE fitnesscenter;

CREATE USER manager FOR LOGIN fitnesscenter_manager;
CREATE USER assistent FOR LOGIN fitnesscenter_assistent;
CREATE USER instructor FOR LOGIN fitnesscenter_assistent;
GO

CREATE ROLE managers AUTHORIZATION dbo;
CREATE ROLE assistents AUTHORIZATION dbo;
GO

ALTER ROLE managers ADD MEMBER admin;
ALTER ROLE assistents ADD MEMBER assistent;
ALTER ROLE assistents ADD MEMBER instructor;
GO

USE fitnesscenter;

GRANT SELECT ON SCHEMA::dbo TO members;

GRANT SELECT, INSERT, DELETE, UPDATE, EXECUTE ON SCHEMA::dbo TO managers;
GRANT SELECT, INSERT, DELETE, UPDATE ON dbo.registrations TO assistents;

USE [master]
CREATE LOGIN fitnesscenter_manager WITH PASSWORD=N'manager123', DEFAULT_DATABASE=fitnesscenter, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN fitnesscenter_assistent WITH PASSWORD=N'assistent123', DEFAULT_DATABASE=fitnesscenter, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN fitnesscenter_instructor WITH PASSWORD=N'instructor123', DEFAULT_DATABASE=fitnesscenter, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE fitnesscenter;

CREATE USER manager FOR LOGIN fitnesscenter_manager;
CREATE USER assistent FOR LOGIN fitnesscenter_assistent;
CREATE USER instructor FOR LOGIN fitnesscenter_instructor;
GO

CREATE ROLE managers AUTHORIZATION dbo;
CREATE ROLE assistents AUTHORIZATION dbo;
GO

ALTER ROLE managers ADD MEMBER manager;
ALTER ROLE assistents ADD MEMBER assistent;
ALTER ROLE assistents ADD MEMBER instructor;
GO

USE fitnesscenter;


-- Manager rollen
GRANT SELECT, INSERT, DELETE, UPDATE, EXECUTE ON SCHEMA::dbo TO managers WITH GRANT OPTION;

-- Assistent rollen
GRANT SELECT ON SCHEMA::dbo TO assistents;
GRANT EXECUTE ON SCHEMA::dbo TO assistents;
GRANT INSERT, DELETE, UPDATE ON dbo.tilmelding TO assistents;
GRANT INSERT, DELETE, UPDATE ON dbo.medlem TO assistents;
GRANT INSERT, DELETE, UPDATE ON dbo.hold TO assistents;

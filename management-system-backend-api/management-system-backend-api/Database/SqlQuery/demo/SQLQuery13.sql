create database yuva;

use yuva;

CREATE TABLE Form (
    id UNIQUEIDENTIFIER PRIMARY KEY,
    customeName NVARCHAR(255) NULL,
    email NVARCHAR(255) NULL,
    phoneNumber NVARCHAR(50) NULL,
    password NVARCHAR(255) NULL,
    role NVARCHAR(50) NULL,
    CreatedBy NVARCHAR(255) NULL
);


CREATE PROCEDURE RegisterCustomer
    @id UNIQUEIDENTIFIER,
    @customeName NVARCHAR(255),
    @email NVARCHAR(255),
    @phoneNumber NVARCHAR(50),
    @password NVARCHAR(255),
    @role NVARCHAR(50),
    @createdBy NVARCHAR(255)
AS
BEGIN
    -- Insert new record into Form table
    INSERT INTO Form (id, customeName, email, phoneNumber, password, role, CreatedBy)
    VALUES (@id, @customeName, @email,@phoneNumber, @password, @role, @createdBy);
END

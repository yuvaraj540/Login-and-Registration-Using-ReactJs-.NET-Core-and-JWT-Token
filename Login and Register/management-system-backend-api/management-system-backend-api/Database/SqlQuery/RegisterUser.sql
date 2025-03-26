--Creating a database--
create database ManagementSystem;

===================================================================================================================================

--use a database for sql workflow
use ManagementSystem;

===================================================================================================================================

--Creating a Table For Register
CREATE TABLE ManagementUser (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    Username NVARCHAR(255) NULL,
    Password NVARCHAR(255) NULL,
    Email NVARCHAR(255) NULL,
    PhoneNumber NVARCHAR(255) NULL,
    OTP INT NULL,
    Gender NVARCHAR(255) NULL,
    DateofBirth DATE NULL,
    Verify INT DEFAULT 0,
    CreatedBy UNIQUEIDENTIFIER NULL,
    CreatedDate DATETIME NULL
);


===================================================================================================================================

--Delete a Table--
drop table ManagementUser;

---Delete a Data from table name---
DELETE FROM ManagementUser;

===================================================================================================================================

--Creating a Stored Procedure For Register--
CREATE PROCEDURE RegisterUser
    @userName NVARCHAR(255),
    @password NVARCHAR(255),
    @email NVARCHAR(255),
    @phoneNumber NVARCHAR(255),
    @dob NVARCHAR(255),
    @gender NVARCHAR(255)
AS
BEGIN
    DECLARE @otp INT;
    DECLARE @newId UNIQUEIDENTIFIER;

    -- Call the GenerateSimpleOTP procedure to get the OTP
    EXEC dbo.GenerateSimpleOTP @otp OUTPUT;

    -- Generate a new ID
    SET @newId = NEWID();

    -- Insert the new user into ManagementUser table
    INSERT INTO ManagementUser (Id, Username, Password, Email, PhoneNumber, DateOfBirth, Gender, OTP, CreatedBy, CreatedDate) 
    VALUES (@newId, @userName, @password, @email, @phoneNumber, @dob, @gender, @otp, NEWID(), GETDATE());

    -- Return the registered user data based on the newly generated ID
    SELECT * 
    FROM ManagementUser 
    WHERE Id = @newId;
END;




===================================================================================================================================

--Delete a Procedure

DROP PROCEDURE IF EXISTS RegisterUser;

===================================================================================================================================

--Get a All Register User--
SELECT * FROM  ManagementUser;

===================================================================================================================================

--Create a Function Generate Random OTP in Sql

CREATE FUNCTION dbo.generateotp()
RETURNS INT
AS
BEGIN
	DECLARE @otp INT;
	SET @otp = CAST(FLOOR(RAND() * 900000 + 100000) AS INT);
	RETURN @otp;
END

-- add a simple function

CREATE FUNCTION dbo.GenerateSimpleOTP()
RETURNS INT
AS
BEGIN
    RETURN CAST(FLOOR(RAND() * 900000 + 100000) AS INT);
END;

======================================================================================================================================
CREATE FUNCTION dbo.GenerateSimpleOTP()
RETURNS INT
AS
BEGIN
    DECLARE @OTP INT;

    -- Generate a random 6-digit OTP
    SET @OTP = ABS(CHECKSUM(NEWID())) % 900000 + 100000;

    RETURN @OTP;
END;

===================================================================================================================================

---Generate Otp in sql procedure ---
CREATE PROCEDURE GenerateSimpleOTP
    @otp INT OUTPUT
AS
BEGIN
    -- Generate a simple OTP (for example, a random number)
    SET @otp = CAST(FLOOR(RAND() * 900000 + 100000) AS INT);  -- Generates a 6-digit OTP
END;



---run a procedure---
EXEC dbo.GenerateSimpleOTP;

DROP PROCEDURE IF EXISTS GenerateSimpleOTP;
===================================================================================================================================
===================================================================================================================================
===================================================================================================================================
===================================================================================================================================
===================================================================================================================================
===================================================================================================================================
===================================================================================================================================
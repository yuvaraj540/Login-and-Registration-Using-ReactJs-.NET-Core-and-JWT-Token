use DevLedAi;

drop table Employees;

CREATE TABLE Grows (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    Name NVARCHAR(100),
    JobTitle NVARCHAR(100),
    InvitationUrn NVARCHAR(200),
    ProfileUrl NVARCHAR(200),
    SharedSecret NVARCHAR(200),
    ImageUrl NVARCHAR(200),
    CreatedBy NVARCHAR(100),
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    ModifiedAt DATETIME2 DEFAULT GETDATE()
)

--create
CREATE PROCEDURE InsertGrow
    @id Uniqueidentifier,
	@name nvarchar(100),
	@jobTitle nvarchar(250),
	@invitationUrn nvarchar(100),
	@profileUrl nvarchar(150),
	@sharedSecret nvarchar(50),
	@imageUrl nvarchar(450),
	@createdBy uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert Into Grow (Id,Name,JobTitle,InvitationUrn,ProfileUrl,SharedSecret,ImageUrl,Status,CreatedBy,AddedDate) values (@id,@name,@jobTitle,@invitationUrn,@profileUrl,@sharedSecret,@imageUrl,0,@createdby,Cast(GETDATE()as date));
END

--Read--
CREATE PROCEDURE GetGrow
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
    -- Retrieve all records from the Deals table where UserId matches the provided parameter
    SELECT *
    FROM Grows
    WHERE CreatedBy = @UserId;
END


--Read--
CREATE PROCEDURE UpdateGrowStatus
    @sharedSecret NVARCHAR(100),
	@Action NVARCHAR(100)
AS
BEGIN
    IF (@Action = 'accept')
		BEGIN
			UPDATE Grow
			SET Status = 1
			WHERE SharedSecret = @sharedSecret;
		END
	ELSE
		BEGIN
			UPDATE Grow
			SET Status = 2
			WHERE SharedSecret = @sharedSecret;
		END
END


ALTER TABLE Grow
ADD ImageUrl varchar(255);
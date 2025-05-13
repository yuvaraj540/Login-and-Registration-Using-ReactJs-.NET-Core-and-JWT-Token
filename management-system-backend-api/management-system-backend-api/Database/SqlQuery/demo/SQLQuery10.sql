use my;

DROP PROCEDURE IF EXISTS UpdateDeal;
DROP PROCEDURE IF EXISTS UpdateExistingDeal;
DROP PROCEDURE IF EXISTS GetDeals;
DROP PROCEDURE IF EXISTS DeleteDeal;

--create
CREATE PROCEDURE UpdateNewDeal
    @Id UNIQUEIDENTIFIER,
    @Project NVARCHAR(255),
    @ProjectManager NVARCHAR(255),
    @DueDate DATETIME,
    @Price DECIMAL(18, 2),
    @Status NVARCHAR(50),
    @CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
   
    INSERT INTO Deals (Id, Project, ProjectManager, DueDate, Price, Status, CreatedBy)
    VALUES (@Id, @Project, @ProjectManager, @DueDate, @Price, @Status, @CreatedBy);
END

--ececute

DECLARE @Id UNIQUEIDENTIFIER = NEWID(); 
DECLARE @Project NVARCHAR(255) = 'demo';
DECLARE @ProjectManager NVARCHAR(255) = 'aassaa';
DECLARE @DueDate DATETIME = '2024-12-31';
DECLARE @Price DECIMAL(18, 2) = 1200000.00;
DECLARE @Status NVARCHAR(50) = '30';
DECLARE @CreatedBy UNIQUEIDENTIFIER = NEWID(); 


EXEC UpdateNewDeal
    @Id = @Id,
    @Project = @Project,
    @ProjectManager = @ProjectManager,
    @DueDate = @DueDate,
    @Price = @Price,
    @Status = @Status,
    @CreatedBy = @CreatedBy;

--Read
CREATE PROCEDURE GetDeals
    @UserId UNIQUEIDENTIFIER
AS
BEGIN
    -- Retrieve all records from the Deals table where UserId matches the provided parameter
    SELECT *
    FROM Deals
    WHERE CreatedBy = @UserId;
END


--ececute

-- Replace 'your-user-id-here' with an actual GUID value
EXEC GetDeals @UserId = '9B51EFD2-8DB5-09C7-8E6E-DD0B5A2A5334';


--Update

CREATE PROCEDURE UpdateExistingDeal
    @Id UNIQUEIDENTIFIER,
    @Project NVARCHAR(255),
    @ProjectManager NVARCHAR(255),
    @DueDate DATETIME,
    @Price DECIMAL(18, 2),
    @Status NVARCHAR(50),
    @ModifiedBy UNIQUEIDENTIFIER
AS
BEGIN
    
    UPDATE Deals
    SET 
        Project = @Project,
        ProjectManager = @ProjectManager,
        DueDate = @DueDate,
        Price = @Price,
        Status = @Status,
        ModifiedBy = @ModifiedBy, 
        ModifiedDate = GETDATE()  
    WHERE Id = @Id;

    
    SELECT *
    FROM Deals
    WHERE Id = @Id;
END

--ececute

EXEC UpdateExistingDeal 
    @Id = '8FF1CD1F-4264-46C1-9848-513164852EE1',  
    @Project = 'New Project Name',
    @ProjectManager = 'New Manager',
    @DueDate = '2024-12-31',
    @Price = 1000.00,
    @Status = 'In Progress',
    @ModifiedBy = 'E4906CF3-6DFB-4E15-A97E-BB91546A50D9';  


--Delete
CREATE PROCEDURE DeleteDeal
    @Id UNIQUEIDENTIFIER
AS
BEGIN
    
    DELETE FROM Deals
    WHERE Id = @Id;
END

--ececute
EXEC DeleteDeal @Id = '8FF1CD1F-4264-46C1-9848-513164852EE1';

--------------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE Deals;

CREATE TABLE Deals (
    Id uniqueidentifier PRIMARY KEY,
    Project nvarchar(255) NULL,
    ProjectManager nvarchar(255) NULL,
    DueDate nvarchar(255) NULL,
    Price decimal(18, 2) NULL,
    Status nvarchar(50) NULL,
    CreatedBy uniqueidentifier NULL,
    CreatedDate datetime NULL,
    ModifiedBy uniqueidentifier NULL,
    ModifiedDate datetime NULL,
    CreatedAt datetime2(7) NULL
)

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateDeal
    @Id UNIQUEIDENTIFIER,
    @Project NVARCHAR(255),
    @ProjectManager NVARCHAR(255),
    @DueDate DATETIME,
    @Price DECIMAL(18, 2),
    @Status NVARCHAR(50),
    @ModifiedBy UNIQUEIDENTIFIER,
    @CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Deals WHERE Id = @Id)
    BEGIN
        -- Update the existing record
        UPDATE Deals
        SET Project = @Project,
            ProjectManager = @ProjectManager,
            DueDate = @DueDate,
            Price = @Price,
            Status = @Status,
            ModifiedBy = @ModifiedBy,
            ModifiedDate = GETDATE()
        WHERE Id = @Id;
    END
    ELSE
    BEGIN
        -- Insert a new record
        INSERT INTO Deals (Id, Project, ProjectManager, DueDate, Price, Status, CreatedBy, CreatedDate)
        VALUES (@Id, @Project, @ProjectManager, @DueDate, @Price, @Status, @CreatedBy, GETDATE());
    END
END

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateDeal
    @Id UNIQUEIDENTIFIER,
    @Project NVARCHAR(255),
    @ProjectManager NVARCHAR(255),
    @DueDate DATETIME,
    @Price DECIMAL(18, 2),
    @Status NVARCHAR(50),
    @ModifiedBy UNIQUEIDENTIFIER,
    @CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Deals WHERE Id = @Id)
    BEGIN
        -- Update the existing record
        UPDATE Deals
        SET Project = @Project,
            ProjectManager = @ProjectManager,
            DueDate = @DueDate,
            Price = @Price,
            Status = @Status,
            ModifiedBy = @ModifiedBy,
            ModifiedDate = GETDATE()
        WHERE Id = @Id;

        SELECT 1 AS Success; -- Return success indicator
    END
    ELSE
    BEGIN
        -- Insert a new record
        INSERT INTO Deals (Id, Project, ProjectManager, DueDate, Price, Status, CreatedBy, CreatedDate)
        VALUES (@Id, @Project, @ProjectManager, @DueDate, @Price, @Status, @CreatedBy, GETDATE());

        SELECT 1 AS Success; -- Return success indicator
    END
END

--------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateDeal
    @Id UNIQUEIDENTIFIER,
    @Project NVARCHAR(255),
    @ProjectManager NVARCHAR(255),
    @DueDate DATETIME,
    @Price DECIMAL(18, 2),
    @Status NVARCHAR(50),
    @ModifiedBy UNIQUEIDENTIFIER,
    @CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Deals WHERE Id = @Id)
    BEGIN
        -- Update the existing record
        UPDATE Deals
        SET Project = @Project,
            ProjectManager = @ProjectManager,
            DueDate = @DueDate,
            Price = @Price,
            Status = @Status,
            ModifiedBy = @ModifiedBy,
            ModifiedDate = GETDATE()
        WHERE Id = @Id;

        SELECT *
		FROM Deals
		WHERE Id = @Id; -- Return success indicator
    END
    ELSE
    BEGIN
        -- Insert a new record
        INSERT INTO Deals (Id, Project, ProjectManager, DueDate, Price, Status, CreatedBy, CreatedDate)
        VALUES (@Id, @Project, @ProjectManager, @DueDate, @Price, @Status, @CreatedBy, GETDATE());

        SELECT *
		FROM Deals
		WHERE Id = @Id; -- Return success indicator
    END
END


--------------------------------------------------------------------------------------------------------------------------------------------
use DevLedAi;

DELETE FROM Grow
    WHERE CreatedBy = '9B51EFD2-8DB5-09C7-8E6E-DD0B5A2A5334';
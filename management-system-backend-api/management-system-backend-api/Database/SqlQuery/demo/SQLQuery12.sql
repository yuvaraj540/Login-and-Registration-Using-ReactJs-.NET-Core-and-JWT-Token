USE [DevLedAi]
GO
/****** Object:  StoredProcedure [dbo].[UpdateGrowStatus]    Script Date: 20-08-2024 18:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateGrowStatus]
    @sharedSecret NVARCHAR(100),
	@Action NVARCHAR(100)
AS
BEGIN
    -- Ensure proper error handling
    SET NOCOUNT ON;

    -- Update the Status column in the Grow table where the SharedSecret matches the input parameter
    IF (@Action = 'action')
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


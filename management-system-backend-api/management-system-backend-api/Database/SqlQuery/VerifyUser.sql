--use a database for sql workflow
use ManagementSystem;

--- Sql Procedure for Verify a User---  

CREATE PROCEDURE VerifyUser
    @email VARCHAR(255),
    @otp VARCHAR(255)
AS
BEGIN
    DECLARE @StoredOtp VARCHAR(255);

    -- Retrieve the OTP for the given email
    SELECT @StoredOtp = OTP FROM ManagementUser WHERE Email = @Email;

    -- Check if the provided OTP matches the stored OTP
    IF (@otp = @StoredOtp)
		BEGIN
			-- Update the user to mark them as verified
			UPDATE ManagementUser
			SET Verify = 1
			WHERE Email = @email;
		END
    ELSE
		BEGIN
			-- Handle the case where the OTP does not match
			RAISERROR('Invalid OTP', 16, 1);
		END
END;



--Delete a Procedure

DROP PROCEDURE IF EXISTS VerifyUser;
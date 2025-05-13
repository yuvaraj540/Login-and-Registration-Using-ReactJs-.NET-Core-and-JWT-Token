use ManagementSystem

CREATE PROCEDURE LoginUser 
    @userName VARCHAR(255),
    @password VARCHAR(255)
AS
BEGIN
    -- Check if the user exists with the specified username and password
    IF EXISTS (SELECT 1 FROM ManagementUser WHERE userName = @userName AND password = @password)
    BEGIN
        -- Return the entire row of the user (you can modify the SELECT list to return specific columns if needed)
        SELECT Id,Username,Password,Email,PhoneNumber
        FROM ManagementUser
        WHERE userName = @userName AND password = @password;
    END
    ELSE
    BEGIN
        -- Return NULL if the user doesn't exist or credentials don't match
        SELECT NULL AS UserExists;
    END
END;

-- Create roles table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[roles]') AND type in (N'U'))
BEGIN
    CREATE TABLE roles (
        RoleID INT PRIMARY KEY,
        RoleName NVARCHAR(50) NOT NULL
    );

    -- Insert default roles
    INSERT INTO roles (RoleID, RoleName) VALUES (1, 'Admin'), (2, 'User');
END

-- Create Users table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
    CREATE TABLE Users (
        UserID INT IDENTITY(1,1) PRIMARY KEY,
        Username NVARCHAR(50) NOT NULL UNIQUE,
        PasswordHash NVARCHAR(255) NOT NULL,
        Email NVARCHAR(100) NOT NULL UNIQUE,
        RoleID INT NOT NULL DEFAULT 2,
        CreatedAt DATETIME DEFAULT GETDATE(),
        reset_token NVARCHAR(255),
        reset_token_expiry DATETIME,
        CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleID) REFERENCES roles(RoleID)
    );
END

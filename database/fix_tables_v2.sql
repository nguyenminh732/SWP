USE XShop;
GO

-- Drop foreign key constraints first
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Users_Roles')
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles];
GO

-- Drop existing tables if they exist
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
    DROP TABLE [dbo].[Users];
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[roles]') AND type in (N'U'))
    DROP TABLE [dbo].[roles];
GO

-- Create roles table
CREATE TABLE [dbo].[roles] (
    [RoleID] INT PRIMARY KEY,
    [RoleName] NVARCHAR(50) NOT NULL
);
GO

-- Insert default roles
INSERT INTO [dbo].[roles] ([RoleID], [RoleName]) 
VALUES (1, 'Admin'), (2, 'User');
GO

-- Create Users table
CREATE TABLE [dbo].[Users] (
    [UserID] INT IDENTITY(1,1) PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [PasswordHash] NVARCHAR(255) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL UNIQUE,
    [RoleID] INT NOT NULL DEFAULT 2,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [reset_token] NVARCHAR(255),
    [reset_token_expiry] DATETIME,
    CONSTRAINT [FK_Users_Roles] FOREIGN KEY ([RoleID]) REFERENCES [roles]([RoleID])
);
GO

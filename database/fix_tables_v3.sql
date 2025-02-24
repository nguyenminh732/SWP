USE XShop;
GO

-- Drop all foreign key constraints referencing Users table
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__Admins__UserID__4E88ABD4')
    ALTER TABLE [dbo].[Admins] DROP CONSTRAINT [FK__Admins__UserID__4E88ABD4];
GO

IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__Bills__UserID__787EE5A0')
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK__Bills__UserID__787EE5A0];
GO

-- Drop foreign key from Users to roles if it exists
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Users_Roles')
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles];
GO

-- Now drop and recreate the Users table
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
    DROP TABLE [dbo].[Users];
GO

-- Drop and recreate roles table
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

-- Recreate foreign keys for other tables
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [FK__Admins__UserID__4E88ABD4] 
FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID]);
GO

ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK__Bills__UserID__787EE5A0]
FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID]);
GO

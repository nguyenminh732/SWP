USE XShop;
GO

-- Create Products table
CREATE TABLE [dbo].[Products] (
    [ProductID] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(MAX),
    [Price] DECIMAL(10, 2) NOT NULL,
    [ImageURL] NVARCHAR(255),
    [Category] NVARCHAR(50),
    [Stock] INT NOT NULL DEFAULT 0,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
GO

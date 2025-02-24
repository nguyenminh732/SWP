-- Add RoleID column and set default to User role (2)
ALTER TABLE Users ADD RoleID INT DEFAULT 2;

-- Set up foreign key relationship
ALTER TABLE Users ADD CONSTRAINT FK_Users_Roles 
FOREIGN KEY (RoleID) REFERENCES roles(RoleID);

-- If there's an existing Role column, migrate data and then drop it
IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'Role')
BEGIN
    -- Update RoleID based on existing Role values
    UPDATE Users SET RoleID = 1 WHERE Role = 'ADMIN';
    UPDATE Users SET RoleID = 2 WHERE Role = 'USER';
    
    -- Drop the old Role column
    ALTER TABLE Users DROP COLUMN Role;
END

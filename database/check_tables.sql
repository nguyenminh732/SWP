-- Check if Tables table exists and show its structure
IF OBJECT_ID('Tables', 'U') IS NOT NULL
BEGIN
    PRINT 'Tables table exists';
    EXEC sp_help 'Tables';
END
ELSE
BEGIN
    PRINT 'Tables table does not exist';
END

-- Check if Bookings table exists and show its structure
IF OBJECT_ID('Bookings', 'U') IS NOT NULL
BEGIN
    PRINT 'Bookings table exists';
    EXEC sp_help 'Bookings';
END
ELSE
BEGIN
    PRINT 'Bookings table does not exist';
END

-- Show sample data from Tables
IF OBJECT_ID('Tables', 'U') IS NOT NULL
BEGIN
    PRINT 'Sample data from Tables:';
    SELECT TOP 5 * FROM Tables;
END

-- Show sample data from Bookings
IF OBJECT_ID('Bookings', 'U') IS NOT NULL
BEGIN
    PRINT 'Sample data from Bookings:';
    SELECT TOP 5 * FROM Bookings;
END

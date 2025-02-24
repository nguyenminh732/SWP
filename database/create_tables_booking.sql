-- Drop existing tables if they exist
IF OBJECT_ID('Bookings', 'U') IS NOT NULL DROP TABLE Bookings;
IF OBJECT_ID('Tables', 'U') IS NOT NULL DROP TABLE Tables;

-- Create Tables table
CREATE TABLE Tables (
    table_id INT PRIMARY KEY IDENTITY(1,1),
    table_number INT NOT NULL,
    capacity INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Available' -- Available, Reserved, Occupied
);

-- Create Bookings table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES Users(UserID),
    table_id INT FOREIGN KEY REFERENCES Tables(table_id),
    booking_date DATE NOT NULL,
    booking_time TIME NOT NULL,
    number_of_guests INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Confirmed', -- Confirmed, Cancelled, Completed
    notes TEXT,
    created_at DATETIME DEFAULT GETDATE()
);

-- Insert some sample tables
INSERT INTO Tables (table_number, capacity) VALUES 
(1, 2),
(2, 2),
(3, 4),
(4, 4),
(5, 6),
(6, 6),
(7, 8),
(8, 8),
(9, 10),
(10, 10);

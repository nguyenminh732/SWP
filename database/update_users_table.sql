-- Add reset token columns to Users table
ALTER TABLE Users
ADD COLUMN reset_token VARCHAR(255),
ADD COLUMN reset_token_expiry TIMESTAMP;

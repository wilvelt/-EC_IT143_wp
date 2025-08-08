
-- Question:
-- How do I keep track of when a record was last modified?


-- Possible solution:
-- Use an AFTER UPDATE trigger to automatically update the last_modified_date column.


-- Research Sources:
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574910/how-to-create-trigger-to-keep-track-of-last-changed-data

-- Summary:
-- Use an AFTER UPDATE trigger.
-- Use the inserted pseudo-table to access new values.
-- Use GETDATE() to set last_modified_date.
-- Use SUSER_NAME() to set last_modified_by.

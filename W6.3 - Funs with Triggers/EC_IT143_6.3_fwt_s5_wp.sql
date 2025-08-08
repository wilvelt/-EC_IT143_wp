

-- Step 1: Test the trigger
UPDATE dbo.t_w3_schools_customers
SET City = 'Test City'
WHERE CustomerID = 1;

-- Step 2: Check the result
SELECT CustomerID, ContactName, City, last_modified_date
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;

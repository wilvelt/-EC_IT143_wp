
/******************************************************************************************
NAME:        dbo.trg_customers_last_mod
PURPOSE:     W3 Schools Customers - Last Modified Date Trigger

MODIFICATION LOG:
Ver         Date                Author              Description
1.0         08/08/2025          WPALANQUET          Created for EC IT143 - Fun with Triggers

RUNTIME:
1s

NOTES:
This trigger updates the last_modified_date field whenever a record in the
t_w3_schools_customers table is updated.
******************************************************************************************/

-- Step 1: Add the column
ALTER TABLE dbo.t_w3_schools_customers
ADD last_modified_date DATETIME;

-- Step 2: Create the trigger
CREATE TRIGGER trg_customers_last_mod ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    UPDATE dbo.t_w3_schools_customers
    SET last_modified_date = GETDATE()
    WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM inserted);
END;
GO

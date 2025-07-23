

DROP PROCEDURE IF EXISTS dbo.usp_load_avg_gpa_placed
GO

CREATE PROCEDURE dbo.usp_load_avg_gpa_placed
AS
/************************************************************
OBJECT:     usp_load_avg_gpa_placed
PURPOSE:    Reloads the t_avg_gpa_placed table from the v_avg_gpa_placed view

AUTHOR:     Wilvelt Palanquet
DATE:       2025-07-22
VERSION:    1.0

NOTES:
This stored procedure is part of the Answer-Focused Approach to T-SQL Data Manipulation.
************************************************************/
BEGIN
    -- Step 1: Clear existing data
    TRUNCATE TABLE dbo.t_avg_gpa_placed;

    -- Step 2: Insert fresh data from the view
    INSERT INTO dbo.t_avg_gpa_placed
    SELECT * FROM dbo.v_avg_gpa_placed;

    -- Step 3: Review results
    SELECT * FROM dbo.t_avg_gpa_placed;
END;
GO

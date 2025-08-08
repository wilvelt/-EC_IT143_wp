

CREATE FUNCTION [dbo].[udf_parse_first_name]
(@v_combined_name AS VARCHAR(500))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @v_first_name AS VARCHAR(100);

    SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') - 1);

    RETURN @v_first_name;
END;
GO

/*
MODIFICATION LOG:
Ver     Date        Author      Description
1.0     08/08/2025  WPALANQUET  Created for EC IT143 - Fun with Functions

NOTES:
Adapted from:
https://stackoverflow.com/questions/5145739/extracting-first-name-and-last-name
*/

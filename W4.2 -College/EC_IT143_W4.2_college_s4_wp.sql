

DROP VIEW IF EXISTS dbo.v_avg_gpa_placed;
GO

CREATE VIEW dbo.v_avg_gpa_placed
AS
/************************************************************
NAME:       dbo.v_avg_gpa_placed
PURPOSE:    View to calculate the average CGPA of placed students

MODIFICATION LOG:
Ver         Date        Author      Description
1.0         07/22/2025  WP          Created for EC IT143 Step 4

NOTES:
This view filters students who were placed and calculates their average CGPA.
************************************************************/

SELECT AVG(CGPA) AS avg_gpa_placed
FROM college_student_placement_dataset
WHERE Placement = 'True';

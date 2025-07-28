/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_College_Students_wp.sql
PURPOSE: Community: College Students and Career Placement

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/28/2025   WPalanquet       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This script answers four questions using the college student placement dataset.
 
******************************************************************************************************************/


SELECT GETDATE() AS my_date;



-- Question 1: Which combination of CGPA, internship experience, and communication skills is most common among placed students?
--Question from Tracy Ntumba KANDA
SELECT TOP 1
    cgpa, internship_experience, communication_skills, COUNT(*) AS frequency
FROM college_student_placement_dataset
WHERE placement = 'True'
GROUP BY cgpa, internship_experience, communication_skills
ORDER BY frequency DESC
;

-- Question 2: Do students with higher CGPA and more completed projects have a higher placement rate?
SELECT
    CASE
        WHEN cgpa >= 8 AND projects_completed >= 3 THEN 'High CGPA & Projects'
        ELSE 'Others'
    END AS category,
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement = 'True' THEN 1 ELSE 0 END) AS placed_students
FROM college_student_placement_dataset
GROUP BY
    CASE
        WHEN cgpa >= 8 AND projects_completed >= 3 THEN 'High CGPA & Projects'
        ELSE 'Others'
    END;


-- Question 3: Is there a correlation between IQ and placement success?
SELECT 
  placement,
  AVG(iq) AS avg_iq
FROM college_student_placement_dataset
GROUP BY placement;

-- Question 4: Do students with internship experience and strong communication skills get placed more often?
SELECT 
  internship_experience,
  CASE 
    WHEN communication_skills >= 8 THEN 'Strong'
    ELSE 'Weak'
  END AS comms_category,
  COUNT(*) AS total_students,
  SUM(CASE WHEN placement = 'True' THEN 1 ELSE 0 END) AS placed_students
FROM college_student_placement_dataset
GROUP BY internship_experience,
    CASE 
    WHEN communication_skills >= 8 THEN 'Strong'
    ELSE 'Weak'
    END;




-- Q: What is the average GPA of students who were placed in a job?

SELECT AVG(CGPA) AS avg_gpa_placed
FROM college_student_placement_dataset
WHERE Placement = 'True';


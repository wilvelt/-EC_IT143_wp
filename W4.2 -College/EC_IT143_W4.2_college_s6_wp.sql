-- Q: What is the average GPA of students who were placed in a job?

-- A: To answer this, we need to:
--    1. Filter the dataset to include only students with status = 'Placed'
--    2. Calculate the average GPA from that filtered group


-- 1) Clear existing data
TRUNCATE TABLE dbo.t_avg_gpa_placed;

-- 2) Insert fresh data from the view
INSERT INTO dbo.t_avg_gpa_placed
SELECT *
FROM dbo.v_avg_gpa_placed;

-- 3) Review results
SELECT * FROM dbo.t_avg_gpa_placed;

/*****************************************************************************************************************
NAME:    -- EC_IT143_W5.2_Laptop_Brands_wp.sql
PURPOSE: -- Community: Laptop Brands and Consumer Tech

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/28/2025   WPalanquet       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This script answers four questions using the laptop specifications dataset. 
******************************************************************************************************************/


SELECT GETDATE() AS my_date;


-- Question 1: Do laptops with higher RAM and faster processors also tend to weigh more or have larger screens?
SELECT 
  AVG(CAST(Ram_Gb AS FLOAT)) AS avg_ram,
  AVG(CAST(Processor_speed_GHz AS FLOAT)) AS avg_processor_speed,
  AVG(CAST(weight AS FLOAT)) AS avg_weight,
  AVG(CAST(DisplAy_size_Inch AS FLOAT)) AS avg_screen_size
FROM BrandEDA;

-- Question 2: Is there a strong correlation between RAM and price?
SELECT 
  Ram_Gb,
  AVG(Price_Rs) AS avg_price
FROM BrandEDA
GROUP BY Ram_Gb
ORDER BY CAST(Ram_Gb AS FLOAT);

-- Question 3: Do touchscreen laptops tend to be more expensive?
SELECT 
  touch,
  AVG(Price_Rs) AS avg_price
FROM BrandEDA
GROUP BY touch;

-- Question 4: Which brand offers the best performance-to-weight ratio?
SELECT 
  brand,
  AVG(CAST(Processor_speed_GHz AS FLOAT) / NULLIF(CAST(weight AS FLOAT), 0)) AS avg_perf_weight_ratio
FROM BrandEDA
GROUP BY brand
ORDER BY avg_perf_weight_ratio DESC;

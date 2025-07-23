
--Q : What is the average price of laptops by brand?

-- A: To answer this, I need to:
--   1. Clean the data to ensure all price values are numeric.
--   2. Group the data by brand.

SELECT 
    Brand,
    AVG(CAST([Price_Rs] AS FLOAT)) AS Average_Price
FROM 
    [BrandEDA]
WHERE 
    ISNUMERIC([Price_Rs]) = 1
GROUP BY 
    Brand;


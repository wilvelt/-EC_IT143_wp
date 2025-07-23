
-- Q: What is the average price of laptops by brand?
-- A: Let's reload the table from the view...

-- Clear existing data
TRUNCATE TABLE dbo.t_AveragePriceByBrand;

-- Insert fresh data from the view
INSERT INTO dbo.t_AveragePriceByBrand (Brand, Average_Price)
SELECT 
    Brand,
    Average_Price
FROM 
    dbo.vw_AveragePriceByBrand;

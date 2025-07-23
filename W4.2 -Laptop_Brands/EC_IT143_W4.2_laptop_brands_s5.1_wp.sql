
-- Q: What is the average price of laptops by brand?
-- A: Let's create a table from the view and find out...

SELECT 
    v.Brand,
    v.Average_Price
INTO dbo.t_AveragePriceByBrand
FROM dbo.vw_AveragePriceByBrand AS v;

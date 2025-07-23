/**********************************************************************************************
NAME: EC_IT143_W4.2_laptop_brands_s4_wp.sql
PURPOSE: Create a view to calculate the average laptop price by brand
MODIFICATION LOG:
Ver     Date        Author              Description
1.0     07/23/2025  Wilvelt Palanquet   Created view for Laptop Brands and Consumer Tech community

RUNTIME:
1s

NOTES:
This script creates a view named vw_AveragePriceByBrand that calculates the average price
of laptops grouped by brand from the BrandEDA dataset. It filters out non-numeric price values.
**********************************************************************************************/

-- Q1: What is the average price of laptops by brand?
-- A1: This view calculates the average price per brand using cleaned numeric price data.

-- Drop the view if it already exists
IF OBJECT_ID('vw_AveragePriceByBrand', 'V') IS NOT NULL
    DROP VIEW vw_AveragePriceByBrand;
GO

-- Create the view
CREATE VIEW vw_AveragePriceByBrand AS
SELECT 
    Brand,
    AVG(CAST([Price_Rs] AS FLOAT)) AS Average_Price
FROM 
    [BrandEDA]
WHERE 
    ISNUMERIC([Price_Rs]) = 1
GROUP BY 
    Brand;

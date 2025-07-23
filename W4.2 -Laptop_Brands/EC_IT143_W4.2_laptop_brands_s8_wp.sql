
--Q : What is the average price of laptops by brand?

-- A: To answer this, I need to:
--   1. Clean the data to ensure all price values are numeric.
--   2. Group the data by brand.


EXEC dbo.usp_LoadAveragePriceByBrand;
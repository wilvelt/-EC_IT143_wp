
-- Drop the table if it already exists
IF OBJECT_ID('dbo.t_AveragePriceByBrand', 'U') IS NOT NULL
    DROP TABLE dbo.t_AveragePriceByBrand;
GO

-- Recreate the table with refined structure
CREATE TABLE dbo.t_AveragePriceByBrand (
    Brand NVARCHAR(50) NOT NULL PRIMARY KEY,
    Average_Price FLOAT NOT NULL CHECK (Average_Price > 0)
);

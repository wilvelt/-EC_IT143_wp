
IF OBJECT_ID('usp_LoadAveragePriceByBrand', 'P') IS NOT NULL
    DROP PROCEDURE usp_LoadAveragePriceByBrand;
GO

-- Create the stored procedure
CREATE PROCEDURE usp_LoadAveragePriceByBrand
AS
BEGIN
    SET NOCOUNT ON;

    -- Clear existing data
    TRUNCATE TABLE dbo.t_AveragePriceByBrand;

    -- Insert fresh data from the view
    INSERT INTO dbo.t_AveragePriceByBrand (Brand, Average_Price)
    SELECT 
        Brand,
        Average_Price
    FROM 
        dbo.vw_AveragePriceByBrand;
END;
GO


-- How do I extract the first name from the ContactName column?

-- Thought Process:
-- Most ContactName values are in the format "FirstName LastName".
-- I can use CHARINDEX to find the position of the space.
-- Then use LEFT to extract the first name.

-- Example:
-- ContactName = 'Alejandra Camino' → FirstName = 'Alejandra'

SELECT t.ContactName
FROM dbo.t_w3_schools_customers AS t
ORDER BY 1;

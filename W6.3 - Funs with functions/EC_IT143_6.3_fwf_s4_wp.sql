
-- How do I extract the first name from the ContactName column?

-- Thought Process:
-- Most ContactName values are in the format "FirstName LastName".
-- I can use CHARINDEX to find the position of the space.
-- Then use LEFT to extract the first name.

-- Example:
-- ContactName = 'Alejandra Camino' → FirstName = 'Alejandra'


-- Reference:
-- Stack Overflow: https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT t.ContactName,
       LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name
FROM dbo.t_w3_schools_customers AS t
ORDER BY 1;

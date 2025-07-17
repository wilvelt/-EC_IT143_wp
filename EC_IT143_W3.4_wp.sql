/*****************************************************************************************************************
NAME:    3.4 Adventure Works—Create Answers
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/17/2025   WPalanquet       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: What should go here?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...

SELECT GETDATE() AS my_date;

--Q1.  What are the five most expensive products based on list price?
--Question source:Alex Ohuru

SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


--Q2.  List all distinct job titles available in the HumanResources.Employee table.
--Question source:Alex Ohuru

SELECT DISTINCT JobTitle
FROM HumanResources.Employee;


--Q3: Which salesperson had the highest total sales revenue in Q2 2012, and what was their revenue? 
--Question source:Kalemba Faith Esther

SELECT TOP 1 
    sp.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS SalespersonName,
    SUM(soh.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
WHERE soh.OrderDate BETWEEN '2012-04-01' AND '2012-06-30'
GROUP BY sp.BusinessEntityID, p.FirstName, p.LastName
ORDER BY TotalRevenue DESC;


--Q4: What is the average time (in days) between an order being placed and shipped for online customers?
--Question source:Kalemba Faith Esther

SELECT 
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS AvgDaysToShip
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 1;


---Q5: I’m preparing a report on road bikes sold between July and September 2011. 
--Can you provide the list of models, quantity sold, and total revenue generated during that period?
----Question source:Nwamaka Itohan Cindy Chimezie



   SELECT 
    p.Name AS ProductModel,
    SUM(sod.OrderQty) AS QuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
  AND psc.Name = 'Road Bikes'
  AND soh.OrderDate BETWEEN '2011-07-01' AND '2011-09-30'
GROUP BY p.Name
ORDER BY TotalRevenue DESC;


--Q6 Business User question—Increased complexity:
--We’re planning a marketing campaign targeting high-value customers.
--Can you identify customers who have placed more than five orders and spent over $5,000 in total? 
--Include their contact details and total spending.
----Question source:My questions

SELECT 
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    e.EmailAddress,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalSpent
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
GROUP BY c.CustomerID, p.FirstName, p.LastName, e.EmailAddress
HAVING COUNT(soh.SalesOrderID) > 5 AND SUM(soh.TotalDue) > 5000
ORDER BY TotalSpent DESC;


--Q7:List all columns in the Sales.SalesOrderHeader table?
--including their data types
----Question source:My questions

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderHeader' AND TABLE_SCHEMA = 'Sales';


--Q8: Which tables in the database include a column named ‘ProductSubcategoryID’?
----Question source:Nwamaka Itohan Cindy Chimezie

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductSubcategoryID';

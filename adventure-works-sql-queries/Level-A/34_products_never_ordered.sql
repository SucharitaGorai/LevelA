SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.Color,
    p.ListPrice
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL
AND p.SellEndDate IS NULL  -- Optional: only include currently sellable products
ORDER BY p.Name;
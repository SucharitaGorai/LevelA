SELECT DISTINCT p.ProductID, p.Name
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE p.DiscontinuedDate IS NOT NULL
AND soh.OrderDate BETWEEN '1998-01-01' AND '1998-01-01';
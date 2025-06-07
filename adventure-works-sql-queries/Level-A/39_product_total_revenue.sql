SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(sod.UnitPrice * sod.OrderQty) AS TotalRevenue
FROM 
    Production.Product p
JOIN 
    Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
JOIN 
    Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE 
    soh.Status = 5  -- Shipped orders only (status 5 typically means completed)
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    TotalRevenue DESC;
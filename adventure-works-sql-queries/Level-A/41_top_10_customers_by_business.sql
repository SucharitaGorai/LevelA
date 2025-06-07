SELECT TOP 10
    c.CustomerID,
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS CustomerName,
    SUM(sod.LineTotal) AS TotalSpend,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(sod.OrderQty) AS TotalItemsPurchased,
    MAX(soh.OrderDate) AS MostRecentOrderDate
FROM 
    Sales.Customer c
JOIN 
    Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE 
    soh.Status = 5  -- Completed orders only
GROUP BY 
    c.CustomerID, p.FirstName, p.MiddleName, p.LastName
ORDER BY 
    TotalSpend DESC;
SELECT TOP 1
    soh.SalesOrderID,
    soh.OrderDate,
    SUM(sod.UnitPrice * sod.OrderQty) AS TotalOrderValue,
    soh.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN 
    Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY 
    soh.SalesOrderID, soh.OrderDate, soh.CustomerID, p.FirstName, p.LastName
ORDER BY 
    TotalOrderValue DESC;
SELECT p.FirstName + ' ' + p.LastName AS ContactName, COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName
HAVING COUNT(soh.SalesOrderID) > 3
UNION
SELECT s.Name AS ContactName, COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID
GROUP BY s.Name
HAVING COUNT(soh.SalesOrderID) > 3;
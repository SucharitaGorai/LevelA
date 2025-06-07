SELECT DISTINCT p.BusinessEntityID, p.FirstName, p.LastName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
UNION
SELECT DISTINCT s.BusinessEntityID, s.Name AS FirstName, '' AS LastName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID;
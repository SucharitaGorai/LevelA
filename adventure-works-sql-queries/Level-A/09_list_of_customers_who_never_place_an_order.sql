SELECT p.BusinessEntityID, p.FirstName
FROM Person.Person p
LEFT JOIN Sales.Customer c ON p.BusinessEntityID = c.PersonID
LEFT JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
WHERE soh.SalesOrderID IS NULL AND p.PersonType = 'IN'
UNION
SELECT s.BusinessEntityID, s.Name AS FirstName
FROM Sales.Store s
LEFT JOIN Sales.Customer c ON s.BusinessEntityID = c.StoreID
LEFT JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
WHERE soh.SalesOrderID IS NULL;
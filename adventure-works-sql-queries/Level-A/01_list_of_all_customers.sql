-- Individual customers
SELECT 
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    p.PersonType AS CustomerType
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE p.PersonType = 'IN'

UNION ALL

-- Business customers (stores)
SELECT 
    c.CustomerID,
    s.Name AS CustomerName,
    'Store' AS CustomerType
FROM Sales.Customer c
JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID;
SELECT p.BusinessEntityID, p.FirstName, p.LastName, a.City
FROM Person.Person p
JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
WHERE a.City IN ('Berlin', 'London')
AND p.PersonType = 'IN'
UNION
SELECT s.BusinessEntityID, s.Name AS FirstName, '' AS LastName, a.City
FROM Sales.Store s
JOIN Person.BusinessEntityAddress bea ON s.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
WHERE a.City IN ('Berlin', 'London');
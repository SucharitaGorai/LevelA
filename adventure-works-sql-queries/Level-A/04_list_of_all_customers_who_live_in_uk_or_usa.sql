SELECT p.BusinessEntityID, p.FirstName, p.LastName, sp.Name AS Country
FROM Person.Person p
JOIN Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
WHERE cr.Name IN ('United Kingdom', 'United States')
AND p.PersonType = 'IN'
UNION
SELECT s.BusinessEntityID, s.Name AS FirstName, '' AS LastName, cr.Name AS Country
FROM Sales.Store s
JOIN Person.BusinessEntityAddress bea ON s.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
WHERE cr.Name IN ('United Kingdom', 'United States');
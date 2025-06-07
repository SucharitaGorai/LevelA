SELECT 
    s.BusinessEntityID AS CustomerID,
    s.Name AS CompanyName,
    a.AddressLine1,
    a.City,
    sp.Name AS StateProvince,
    cr.Name AS CountryRegion
FROM Sales.Store s
JOIN Person.BusinessEntityAddress bea ON s.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
WHERE s.Name LIKE '%n'
ORDER BY s.Name;
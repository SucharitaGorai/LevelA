WITH CountrySales AS (
    SELECT
        cr.Name AS Country,
        SUM(soh.TotalDue) AS TotalSales,
        SUM(SUM(soh.TotalDue)) OVER() AS GrandTotal
    FROM Sales.SalesOrderHeader soh
    JOIN Person.Address a ON soh.ShipToAddressID = a.AddressID
    JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
    JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
    GROUP BY cr.Name
)
SELECT TOP 10
    Country,
    FORMAT(TotalSales, 'C') AS TotalSales,
    FORMAT(TotalSales/GrandTotal, 'P') AS PercentageOfTotalSales
FROM CountrySales
ORDER BY TotalSales DESC;
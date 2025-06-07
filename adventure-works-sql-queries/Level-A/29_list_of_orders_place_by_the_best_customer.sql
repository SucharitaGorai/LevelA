WITH CustomerTotals AS (
    SELECT CustomerID, SUM(TotalDue) AS TotalSpent
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID
)
SELECT soh.SalesOrderID, soh.OrderDate, soh.TotalDue
FROM Sales.SalesOrderHeader soh
WHERE soh.CustomerID = (
    SELECT TOP 1 CustomerID 
    FROM CustomerTotals 
    ORDER BY TotalSpent DESC
);
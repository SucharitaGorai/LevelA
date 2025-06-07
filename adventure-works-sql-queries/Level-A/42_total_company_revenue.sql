SELECT 
    SUM(sod.LineTotal) AS TotalCompanyRevenue,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalNumberOfOrders,
    SUM(sod.OrderQty) AS TotalProductsSold
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE 
    soh.Status = 5;  -- Completed orders only
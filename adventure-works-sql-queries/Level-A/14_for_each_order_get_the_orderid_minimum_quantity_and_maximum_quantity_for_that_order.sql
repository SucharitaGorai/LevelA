SELECT SalesOrderID, MIN(OrderQty) AS MinQuantity, MAX(OrderQty) AS MaxQuantity
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;
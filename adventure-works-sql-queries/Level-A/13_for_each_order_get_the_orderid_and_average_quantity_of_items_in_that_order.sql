SELECT SalesOrderID, AVG(OrderQty) AS AvgQuantity
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;
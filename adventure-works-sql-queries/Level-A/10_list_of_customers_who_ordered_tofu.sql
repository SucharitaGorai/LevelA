SELECT DISTINCT C.*
FROM Sales.Customer C
JOIN Sales.SalesOrderHeader O ON C.CustomerID = O.CustomerID
JOIN Sales.SalesOrderDetail D ON O.SalesOrderID = D.SalesOrderID
JOIN Production.Product P ON D.ProductID = P.ProductID
WHERE P.Name = 'Tofu';
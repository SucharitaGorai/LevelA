SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    pi.Quantity AS UnitsInStock,
    p.ReorderPoint,
    pv.OnOrderQty AS UnitsOnOrder
FROM Production.Product p
JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
LEFT JOIN Purchasing.ProductVendor pv ON p.ProductID = pv.ProductID
WHERE pi.Quantity < 10
AND (pv.OnOrderQty = 0 OR pv.OnOrderQty IS NULL)
ORDER BY pi.Quantity ASC, p.Name;
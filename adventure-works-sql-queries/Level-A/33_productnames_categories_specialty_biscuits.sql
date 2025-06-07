SELECT 
    p.Name AS ProductName,
    pc.Name AS ProductCategory,
    psc.Name AS ProductSubcategory
FROM Production.Product p
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN Purchasing.ProductVendor pv ON p.ProductID = pv.ProductID
JOIN Purchasing.Vendor v ON pv.BusinessEntityID = v.BusinessEntityID
WHERE v.Name = 'Speciality Biscuits, Ltd.'
ORDER BY pc.Name, psc.Name, p.Name;
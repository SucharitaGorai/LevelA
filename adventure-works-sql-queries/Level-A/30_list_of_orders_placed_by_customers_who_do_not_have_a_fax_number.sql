SELECT soh.SalesOrderID, soh.OrderDate
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
LEFT JOIN Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID 
    AND pp.PhoneNumberTypeID = 3 -- Assuming 3 is Fax type
WHERE pp.BusinessEntityID IS NULL;
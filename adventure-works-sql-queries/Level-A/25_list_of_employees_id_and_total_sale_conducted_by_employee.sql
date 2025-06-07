SELECT e.BusinessEntityID, p.FirstName + ' ' + p.LastName AS EmployeeName, 
       SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN HumanResources.Employee e ON soh.SalesPersonID = e.BusinessEntityID
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
GROUP BY e.BusinessEntityID, p.FirstName, p.LastName;
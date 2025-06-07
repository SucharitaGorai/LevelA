SELECT m.BusinessEntityID, p.FirstName + ' ' + p.LastName AS ManagerName, 
       COUNT(e.BusinessEntityID) AS EmployeeCount
FROM HumanResources.Employee e
JOIN HumanResources.Employee m ON e.OrganizationNode.GetAncestor(1) = m.OrganizationNode
JOIN Person.Person p ON m.BusinessEntityID = p.BusinessEntityID
GROUP BY m.BusinessEntityID, p.FirstName, p.LastName
HAVING COUNT(e.BusinessEntityID) > 4;
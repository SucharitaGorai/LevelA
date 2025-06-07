SELECT e.BusinessEntityID, 
       e.FirstName AS EmployeeFirstName, 
       e.LastName AS EmployeeLastName,
       s.FirstName AS SupervisorFirstName, 
       s.LastName AS SupervisorLastName
FROM HumanResources.Employee emp
JOIN Person.Person e ON emp.BusinessEntityID = e.BusinessEntityID
LEFT JOIN HumanResources.Employee sup ON emp.OrganizationNode.GetAncestor(1) = sup.OrganizationNode
LEFT JOIN Person.Person s ON sup.BusinessEntityID = s.BusinessEntityID;
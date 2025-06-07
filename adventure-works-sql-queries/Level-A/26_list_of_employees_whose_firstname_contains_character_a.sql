SELECT p.BusinessEntityID, p.FirstName, p.LastName
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName LIKE '%a%';
SELECT c.CompanyName,
SUM((od.Quantity * od.UnitPrice)) AS Total,
CASE
WHEN SUM((od.Quantity * od.UnitPrice)) >= 30000 THEN 'A'
WHEN SUM((od.Quantity * od.UnitPrice)) < 30000 and sum((od.Quantity * od.UnitPrice)) >=
20000 THEN 'B'
ELSE 'C'
END AS Customer_Grade
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
inner join
[Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN
Products p
ON od.ProductID = p.ProductID
GROUP BY  c.CompanyName
ORDER BY Total DESC

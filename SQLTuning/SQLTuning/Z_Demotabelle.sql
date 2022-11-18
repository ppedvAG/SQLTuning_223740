SELECT      Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCountry, Orders.ShipCity, Employees.LastName, Employees.FirstName, [Order Details].OrderID, 
                   [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock
INTO KU1
FROM         Customers INNER JOIN
                   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                   Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                   [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                   Products ON [Order Details].ProductID = Products.ProductID


insert into ku1
select * from ku1
GO 9

--1,1 MIo Zeilen
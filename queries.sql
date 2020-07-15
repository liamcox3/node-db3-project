-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, c.CategoryName 
from Product as p
join Category as c
on c.id = p.CategoryId
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id, s.CompanyName
from [Order] as o
join Shipper as s 
on o.ShipVia = s.Id
where o.OrderDate <= 2012-08-09
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, p.QuantityPerUnit, p.id, o.ProductId, o.OrderId
from OrderDetail as o
join Product as p
on o.ProductId = p.id

where o.OrderId =10251
order by ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id, c.CompanyName, e.LastName
from [Order] as o
join Customer as c 
on c.id = o.CustomerId
join Employee as e 
on e.id = o.EmployeeId
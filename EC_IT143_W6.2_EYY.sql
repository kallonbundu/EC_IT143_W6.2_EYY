/*****************************************************************************************************************
NAME:    Ella Yeama Yanker
PURPOSE: Answer SQL Database Questions Submitted by Myself 

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/23/2023   MMCEVOY      1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This script answers the questions provided by student and myself. Some of the questions have been modified from the orignal question due
to the information the way in which the database tables list information.

 
******************************************************************************************************************/

-- Q1: What are the top 3 items that weigh the most on the Product List? Marginal Complexity: Author Jorge Santos
-- A1: The following are the top 3 heavy items that I had to put over 800 weight in my script to narrow the selection down
SELECT TOP 3 ProductID, Name, Weight
FROM Production.Product
WHERE Weight >800
ORDER BY Weight DESC;

--Q2:How many of our order totals are over 1000? Marginal Complexity: Author Mark Ewoldt
--A2 The following will script will print out over 32,100 Rows of Data. I ordered by Descending Totals
SELECT Sales.SalesOrderDetail.SalesOrderDetailID,
       Sales.SalesOrderDetail.ProductID,
	   Sales.SalesOrderDetail.LineTotal
FROM   Sales.SalesOrderDetail
WHERE  Sales.SalesOrderDetail.LineTotal > 1000
ORDER BY Sales.SalesOrderDetail.LineTotal DESC;

--Q3: I am comparing the Sales Performance between Sales Representative Rachel B. Valdez against the sales of Jae B. Pak. Moderate Complexity
--Author: Mark Ewoldt
--A3: I had to Join the Person.Person table to Sales.SalesPerson Table On the BusinessEntityID and filter by name which gave me the sales of both 
--so I was able to compare

SELECT Sales.SalesPerson.BusinessEntityID,
       Sales.SalesPerson.SalesYTD,
	   Person.Person.FirstName,
       Person.Person.MiddleName,
	   Person.Person.LastName
FROM   Person.Person
JOIN   Sales.SalesPerson
ON     Sales.SalesPerson.BusinessEntityID = Person.Person.BusinessEntityID
WHERE  Person.Person.FirstName = 'Rachel' AND Person.Person.MiddleName ='B'
       AND Person.Person.LastName = 'Valdez';
 SELECT Sales.SalesPerson.BusinessEntityID,
       Sales.SalesPerson.SalesYTD,
	   Person.Person.FirstName,
       Person.Person.MiddleName,
	   Person.Person.LastName
FROM   Person.Person
JOIN   Sales.SalesPerson
ON     Sales.SalesPerson.BusinessEntityID = Person.Person.BusinessEntityID
WHERE  Person.Person.FirstName = 'Jae' AND Person.Person.MiddleName ='B'
       AND Person.Person.LastName = 'Pak';  
--Q4: We would like to send some of the bikes to a new store. Can you calculate the total stock quantity for the Road-250 Black, 48' Series?
-- Moderate Complexity Author: Jorge Santos
--A4:I had to Join the Production. ProductInventory Table with the Production.Product Table by Product ID and filter out the Road-250 Black 48'
--which gave me the quantities
SELECT Production.ProductInventory.Quantity,
Production.ProductInventory.ProductID,
Production.Product.Name
FROM Production.ProductInventory
JOIN Production.Product
ON Production.ProductInventory.ProductID =Production.Product.ProductID
WHERE Production.Product.Name = 'Road-250 Black, 48';

--Q5: I need to understand more about our Production Cost for Mountain Bike Orders after. Specifically, I need to know by frame types and color during
--- Can you create a list that will tell me this information by product id? I need to know the name, product number, order qty, standard cost and modified date
--Increased Complexity Author: Michael McEvoy
--A5: I had to Join Production.Product Table and Production.ProductInventory Tables on Product ID and list all the different moutain bike, frames and 
--colors so they would all list out. I also selected a modified date to get mountain bike that we made after during or after 2011-05-01.
SELECT Production.Product.ProductID,
       Production.Product.ProductNumber,
       Production.Product.Name,
	   Production.Product.DaysToManufacture,
	   Production.Product.ModifiedDate,
	   Production.Product.StandardCost,
	   Production.ProductInventory.Quantity,
	   Production.ProductInventory.ModifiedDate
FROM   Production.Product
JOIN   Production.ProductInventory
ON     Production.Product.ProductID =Production.ProductInventory.ProductID
WHERE 
       Name =  'Mountain-100 Black, 38'
       OR     
	   Name =  'Mountain-100 Black, 42'
       OR     
	   Name =  	'Mountain-100 Black, 44'
       OR 	
	   Name =	'Mountain-100 Black, 48'
       OR    
	   Name =   'Mountain-200 Silver, 38'
       OR
	   Name =   'Mountain-200 Silver, 42'
       OR
	   Name =    'Mountain-200 Silver, 46'
	   OR
	   Name =   'Mountain-200 Black, 38'
       OR
	   Name =   'Mountain-200 Black, 42'
       OR
	   Name =   'Mountain-200 Black, 46'
	   OR
	   Name =  'Mountain-300 Black, 38'
	   OR
	   Name =  'Mountain-300 Black, 40'
	   OR
	   Name =  'Mountain-300 Black, 44'
	   OR
	   Name =  'Mountain-300 Black, 48'
	   AND
	   Production.ProductInventory.ModifiedDate <= 2011-05-01;

--Q6: I need to understand more about Purchase Orders for our Paint purchases during or after 2011-12-2011 specifically by color during that period. Can you create a
--list that will tell me this information by product id? I need to know the name, product number, order qty and unit proce.
--Increase Complexity Author: Michael McEvoy
--A6: I had to Join the Production.Product Table with the Purchasing.PurchaseORderDetail Table on Product ID and select the different paint colors
--by name in order to get a complete listing and price in my results.
SELECT Production.Product.ProductID,
       Production.Product.Name,
	   Production.Product.ProductNumber,
	   Purchasing.PurchaseOrderDetail.OrderQty,
	   Purchasing.PurchaseOrderDetail.UnitPrice,
	   Purchasing.PurchaseOrderDetail.ModifiedDate
FROM   Production.Product
JOIN   Purchasing.PurchaseOrderDetail
ON     Production.Product.ProductID = Purchasing.PurchaseOrderDetail.ProductID
WHERE  Name = 'Paint - Red'
OR
Name = ' Paint - Silver'
OR
Name = 'Paint - Blue'
OR
Name = 'Paint - Yellow'
AND
Purchasing.PurchaseOrderDetail.ModifiedDate ='2011-12-21';

--Q7: What is the structure of the "Purchasing.ProductVendor table in the AdventureWorks Database? Specifically what are the names and data types of the columns 
--in the Purchasing.ProductVendor Table? MetaData Question Author: Hunter DeLeon
--A7: I had to change to Purchasing.ProductVendor Table instead of Purchasing.PRoduct Table because I didn't see on that existed. My answer is as follows:
--Product ID(int), BusinessEntityID(int),AverageLeadTime(Int)StandardPrice(Int),LastReceiptData(datetime),MinOrderQty(int),MaxOrderQty(int),
--OnOrderQty(int)Unitmeasurecode(nchar(3)) and Modified Date(datetime).

--Q8: Consider the relationship between the "Purchasing Vendor" and Purchasing.ProductVendor Tables. What key(s) column in each table join them together 
--what type of relationships exist between them? Metadata Question Author: Hunter DeLeon
--A8: The primary key ProductVendor_BusinessEntity_BusinessEntityID of the Purchasing.ProductVendor tables has a one to two relationship with the 
--foreign key of the Vendor_BusinessEntityID of the Purchasing Vendor Table.
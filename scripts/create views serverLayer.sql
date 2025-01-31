-- Create view calender in serverLayer Schema. 

CREATE VIEW serverLayer.calender
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedCalender/',
    FORMAT = 'PARQUET'
) as query1


-- Create view Customer
CREATE VIEW serverLayer.customer
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedCustomer/',
    FORMAT = 'PARQUET'
) as query2

--Create view Product Category
CREATE VIEW serverLayer.productCategory
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedProductCategory/',
    FORMAT = 'PARQUET'
) as query3


-- Create view Products
CREATE VIEW serverLayer.products
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedProducts/',
    FORMAT = 'PARQUET'
) as query4


--Create view Product Sub Category
CREATE VIEW serverLayer.productSubCategory
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedProductSubCategory/',
    FORMAT = 'PARQUET'
) as query5


-- Create view Returns
CREATE VIEW serverLayer.returnsView
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedReturns/',
    FORMAT = 'PARQUET'
) as query6


-- Create view Sales
CREATE VIEW serverLayer.sales
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedSales/',
    FORMAT = 'PARQUET'
) as query7


-- Create view Territory
CREATE VIEW serverLayer.territory
AS 
SELECT * FROM OPENROWSET(
    BULK 'https://projectstorage323.blob.core.windows.net/transformcontainer/FormattedTerritory/',
    FORMAT = 'PARQUET'
) as query8


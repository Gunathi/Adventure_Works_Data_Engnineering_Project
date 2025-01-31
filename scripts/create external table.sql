-- Create database credentials
-- This credential is required for accessing external storage (Azure Blob Storage)  
-- 'Managed Identity' means it will use an Azure Managed Identity for authentication 
CREATE DATABASE SCOPED CREDENTIAL cred_hansi
WITH IDENTITY = 'Managed Identity'
    
-- Create external data source for transform layer
-- This external data source connects to the 'transformcontainer' in Azure Blob Storage
CREATE EXTERNAL DATA SOURCE source_transform
WITH
  (  LOCATION = 'https://projectstorage323.blob.core.windows.net/transformcontainer' , 
    CREDENTIAL = cred_hansi
  )


-- Create external data source for service container
-- This external data source connects to the 'servicecontainer' in Azure Blob Storage  
CREATE EXTERNAL DATA SOURCE source_service
WITH
  (  LOCATION = 'https://projectstorage323.blob.core.windows.net/servicecontainer' , 
    CREDENTIAL = cred_hansi
  )


-- Create external file format
-- Create an external file format for DELIMITED (CSV/TSV) files.
-- This defines how data is structured when reading from the external source
CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
        FORMAT_TYPE = PARQUET, 
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec' -- Uses Snappy compression for efficiency
     );

-- Create external table externalSales
CREATE EXTERNAL TABLE serverLayer.extsales
WITH (
    LOCATION = 'extsales', -- Directory or folder name in Blob Storage  
    DATA_SOURCE = source_service, -- Links to the external data source for servicecontainer  
    FILE_FORMAT = format_parquet
)AS 
SELECT * FROM serverLayer.sales


SELECT * FROM serverLayer.extsales



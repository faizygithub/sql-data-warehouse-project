-- Create Database 'DataWarehouse'

/*

===========================================================================
CREATE DATABASE and SCHEMAS
===========================================================================

Script Purpose:
	This script creates a new database named 'DataWarehause' after checking if it already exists. If the database exists,
	it will be dropped and recreated. The script also creates three schemas within the 'DataWarehouse' database: 'bronze', 'silver', and 'gold'.

Warning:
	Executing this script will result in the loss of all data in the 'DataWarehouse' database if it already exists. 
	Ensure that you have backups of any important data before running this script.

*/

USE master;


-- Drop and recreate the 'DataWarehouse' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Createing the 'DataWarehouse'Database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas for layes: bronze,silver gold

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;

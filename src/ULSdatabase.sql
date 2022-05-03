use tempdb
GO

--Drop and recreate the FCC_ULS_DB DB
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'FCC_ULS_ImportDB')
	DROP DATABASE [FCC_ULS_ImportDB]
GO

CREATE DATABASE [FCC_ULS_ImportDB]
ON (
	NAME = N'FCC_ULS_ImportDB_Primary' ,
	FILENAME = N'D:\GN_SQL\MSSQL\Data\FCC_ULS_ImportDB.MDF' , -- Development Location
	SIZE = 2000,
	FILEGROWTH = 10%
) LOG ON (
	NAME = N'FCC_ULS_ImportDB_TransactionLog',
	FILENAME = N'D:\GN_SQL\MSSQL\Data\FCC_ULS_ImportDB.LDF' , -- Development Location
	SIZE = 100,
	FILEGROWTH = 10%
)
GO

-- This is not really ment for the import database and is only here for 
-- ease of use if desired to add indexes on the import db
ALTER DATABASE [FCC_ULS_ImportDB] ADD FILEGROUP [FCC_ULS_DatabaseIDX] 
GO

ALTER DATABASE [FCC_ULS_ImportDB] ADD FILE (
	NAME = N'FCC_ULS_Database_Index', 
	FILENAME = N'D:\gn_sql\MSSQL\Data\FCC_ULS_ImportDB_IDX.NDF' , 
	SIZE = 200,
	FILEGROWTH = 10%
) TO FILEGROUP [FCC_ULS_DatabaseIDX]
GO

use tempdb
GO


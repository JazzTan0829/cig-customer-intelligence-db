/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4451)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CustomerIntelligence]
GO
/****** Object:  User [EXACT-SOFTWARE\SG-CI-PRD-DB-RW]    Script Date: 14-juin-18 10:40:35 ******/
DROP USER IF EXISTS [EXACT-SOFTWARE\SG-CI-PRD-DB-RW]
GO
/****** Object:  User [EXACT-SOFTWARE\SG-CI-PRD-DB-RW]    Script Date: 14-juin-18 10:40:35 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'EXACT-SOFTWARE\SG-CI-PRD-DB-RW')
CREATE USER [EXACT-SOFTWARE\SG-CI-PRD-DB-RW] FOR LOGIN [EXACT-SOFTWARE\SG-CI-PRD-DB-RW]
GO

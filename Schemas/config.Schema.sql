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
/****** Object:  Schema [config]    Script Date: 30/01/2018 12:06:19 ******/
DROP SCHEMA IF EXISTS [config]
GO
/****** Object:  Schema [config]    Script Date: 30/01/2018 12:06:19 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'config')
EXEC sys.sp_executesql N'CREATE SCHEMA [config]'
GO

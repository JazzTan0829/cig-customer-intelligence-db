USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Complaints]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Complaints]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Complaints]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 05-02-2016
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Complaints] AS
IF OBJECT_ID (N'Complaints', N'U') IS NOT NULL 
DROP TABLE Complaints

CREATE TABLE [dbo].[Complaints](
	[ID] [nvarchar](100) NOT NULL,
	[Environment] [nchar](3) NOT NULL,
	[TypeHID][int] NOT NULL,
	[HID][int] NOT NULL,
	[TypeDescription][nvarchar](120) NULL,
	[Created][Date] NULL,
	[AccountCode] [nvarchar](30) NULL,
	[Approved][Date] NULL,
	[Realised][Date] NULL,
	[Status][smallint] NULL,
	[ItemCode_1][nvarchar](160) NULL,
	[FreeTextField_01] [nvarchar](160) NULL,
	[Description] [nvarchar](max) NULL,
	)

CREATE CLUSTERED INDEX Created ON Complaints (Created)

GO

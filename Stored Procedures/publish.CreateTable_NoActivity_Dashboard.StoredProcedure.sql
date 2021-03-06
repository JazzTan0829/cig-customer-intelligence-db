USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[CreateTable_NoActivity_Dashboard]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[CreateTable_NoActivity_Dashboard]
GO
/****** Object:  StoredProcedure [publish].[CreateTable_NoActivity_Dashboard]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 20/10/2016
-- Description:	This procedure drops the previous version of the NoActivity_Dashboard table and rebuilds it. 			
-- =====================================================================================================================================================================


CREATE PROCEDURE [publish].[CreateTable_NoActivity_Dashboard]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.[publish].[NoActivity_Dashboard]', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.[publish].[NoActivity_Dashboard]

CREATE TABLE [publish].[NoActivity_Dashboard]
(
	[AccountID] [uniqueidentifier] NULL,
	[Environment] [nchar](3) NOT NULL,
	[AccountCode] [nvarchar](18) NOT NULL,
	[EnviroAccount] [nvarchar](21) NOT NULL,
	[CalendarDate] [datetime] NULL,
	[ActiveOrNot] [int] NOT NULL,
	[PageviewQuantity] [int] NULL

)


CREATE CLUSTERED INDEX EnviroAccount_Date ON publish.NoActivity_Dashboard (EnviroAccount, CalendarDate)

END


GO

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
/****** Object:  Table [dbo].[TEMP_ListDivisionsWebhooks]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [dbo].[TEMP_ListDivisionsWebhooks]
GO
/****** Object:  Table [dbo].[TEMP_ListDivisionsWebhooks]    Script Date: 30/01/2018 11:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMP_ListDivisionsWebhooks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMP_ListDivisionsWebhooks](
	[AdministrationCode] [float] NULL
) ON [PRIMARY]
END
GO

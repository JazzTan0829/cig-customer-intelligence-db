USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Verint_EOL_TRX_Buy_Process_Survey]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Verint_EOL_TRX_Buy_Process_Survey]
GO
/****** Object:  View [domain].[Verint_EOL_TRX_Buy_Process_Survey]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[Verint_EOL_TRX_Buy_Process_Survey]
AS
SELECT *
From raw.Verint_EOL_TRX_Buy_Process_Survey
GO

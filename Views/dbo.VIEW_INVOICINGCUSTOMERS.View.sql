USE [CustomerIntelligence]
GO
/****** Object:  View [dbo].[VIEW_INVOICINGCUSTOMERS]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [dbo].[VIEW_INVOICINGCUSTOMERS]
GO
/****** Object:  View [dbo].[VIEW_INVOICINGCUSTOMERS]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
								Create view [dbo].[VIEW_INVOICINGCUSTOMERS] as
								Select DISTINCT AccountCode
								From domain.ActivityDaily
								WHere ActivityID IN (5153,5270,5271,512328,512430,512621,513826,513821,513928,513930)
GO

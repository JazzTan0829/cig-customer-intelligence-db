USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Verint_Participants_EolTraining2017]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Verint_Participants_EolTraining2017]
GO
/****** Object:  View [domain].[Verint_Participants_EolTraining2017]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[Verint_Participants_EolTraining2017]
AS
SELECT *
From raw.Verint_Participants_EolTraining2017
GO

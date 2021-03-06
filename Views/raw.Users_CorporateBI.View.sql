USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[Users_CorporateBI]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[Users_CorporateBI]
GO
/****** Object:  View [raw].[Users_CorporateBI]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================================================================================
-- Author:		Alex Green 
-- Create date: 13/03/2018
-- Description:	Creates a view of the domain.Users table for the Corporate BI guys to consume
-- ===============================================================================================================================================

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [raw].[Users_CorporateBI]
AS

SELECT *
FROM domain.Users
GO

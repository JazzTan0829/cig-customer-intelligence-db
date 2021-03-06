USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Load_DivisionHash]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Load_DivisionHash]
GO
/****** Object:  StoredProcedure [config].[Load_DivisionHash]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-07-2016
-- Description:	Load look up table
-- =============================================
CREATE PROCEDURE [config].[Load_DivisionHash] 

AS
BEGIN
DECLARE @saltNL varchar(30) = 'Netherlands'
DECLARE @saltBE varchar(30) = 'Belgium'
DECLARE @saltDE varchar(30) = 'Germany'
DECLARE @saltFR varchar(30) = 'France'
DECLARE @saltUK varchar(30) = 'UnitedKingdom'
DECLARE @saltUS varchar(30) = 'UnitedStates'
DECLARE @saltES varchar(30) = 'Spain'

TRUNCATE TABLE CustomerIntelligence.config.GA_DivisionHash

--Netherlands
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltNL + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='NL'

--Belgium
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltBE + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='BE'

--Germany
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltDE + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='DE'

--France
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltFR + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='FR'

--UnitedKingdom
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltUK + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='UK'

--UnitedStates
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltUS + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='US'

--Spain
INSERT INTO CustomerIntelligence.config.GA_DivisionHash
SELECT DivisionCode
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltES + LOWER(CAST(AccountID AS varchar(36))) + CAST(DivisionCode AS varchar(10))), 1), 3, 64) AS HashedDivision
	 , Environment
FROM domain.Divisions
WHERE Environment='ES'

END
GO

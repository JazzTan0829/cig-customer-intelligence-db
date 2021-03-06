USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_AccountsContract_PerMonth]
GO
/****** Object:  StoredProcedure [domain].[Loop_AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =================================================================================================================================================================================
-- Author:		Alex Green (based on original script by Ronald Dahne)
-- Create date: 30/11/2015
-- Description:	This script loops the Load_AccountsContract_PerMonth procedure for each month to populate the AccountsContract_PerMonth table.
-- =================================================================================================================================================================================


CREATE PROC  [domain].[Loop_AccountsContract_PerMonth] AS

-- Removes the data previously stored in the AccountsContract_PerMonth table
TRUNCATE TABLE domain.AccountsContract_PerMonth

DECLARE @i INT = 1
DECLARE @iTotal INT = (SELECT Max(Sequence) FROM config.YearMonth WHERE EndDate <= GETDATE())

WHILE @i <= @iTotal 
BEGIN
DECLARE @EndDate Date = (Select EndDate FROM config.YearMonth WHERE @i=Sequence)

BEGIN
   -- Executes the Load_AccountsContract_PerMonth procedure. This is executed as long as the previous fetch succeeds.
   EXEC domain.Load_AccountsContract_PerMonth @EndDate		--@EndDate is the output variable used for InputEndDate in the Load_AccountsContract_PerMonth procedure
END

SET @i+=1
END
GO

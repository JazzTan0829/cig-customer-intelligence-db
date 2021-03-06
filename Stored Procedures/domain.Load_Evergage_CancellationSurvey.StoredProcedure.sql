USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Evergage_CancellationSurvey]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Evergage_CancellationSurvey]
GO
/****** Object:  StoredProcedure [domain].[Load_Evergage_CancellationSurvey]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [domain].[Load_Evergage_CancellationSurvey]
AS
BEGIN
	DECLARE @sqlCommand varchar(1000)
	IF ((SELECT COUNT(*) FROM raw.Evergage_CancellationSurvey) > 0) 
    BEGIN
        DROP TABLE IF EXISTS domain.Evergage_CancellationSurvey
		SELECT * INTO  domain.Evergage_CancellationSurvey FROM raw.Evergage_CancellationSurvey;
		ALTER TABLE domain.Evergage_CancellationSurvey ADD AccountId UNIQUEIDENTIFIER NULL
		SET @sqlCommand = 'UPDATE domain.Evergage_CancellationSurvey SET AccountId = (SELECT AccountId FROM [domain].[AccountIDsHashed] WHERE AccountIdHashed = AccountName)'
		EXEC (@sqlCommand)
    END
END
GO

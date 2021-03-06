USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_App]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[RunDaily_App]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_App]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-10-04
-- Description:	RunDaily master procedure
-- =============================================
CREATE PROCEDURE [domain].[RunDaily_App]
AS
BEGIN

BEGIN TRY

--EXECUTES APP PROCEDURES
INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'App_Information' AS Job, 'Start' AS [Action]
	EXEC domain.Load_App
INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'App_Information' AS Job, 'End' AS [Action]

INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'App_Usage' AS Job, 'Start' AS [Action]
	EXEC domain.Load_AppUsage
INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'App_Usage' AS Job, 'End' AS [Action]

INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'AppUsageLines' AS Job, 'Start' AS [Action]
	EXEC domain.Load_AppUsageLines
INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'AppUsageLines' AS Job, 'End' AS [Action]

INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'App_MonthlyAppUsage' AS Job, 'Start' AS [Action]
	EXEC domain.Load_MonthlyAppUsage
INSERT INTO config.JobLog (StartEndTime, Job, Action) SELECT GETDATE() AS StartEndTime, 'App_MonthlyAppUsage' AS Job, 'End' AS [Action]


END TRY

-- CAPTURES ANY ERRORS THAT OCCUR IN THE STORED PROCEDURES AND INSERTS THEM INTO THE ERRORLOG TABLE
BEGIN CATCH
    INSERT INTO config.ErrorLog
		(
			Occurrence
			, ErrorProcedure
			, ErrorMessage
			, ErrorNumber
			, ErrorSeverity
			, ErrorState
			, ErrorLine
		)
	SELECT
		   GETDATE() AS Occurrence
		 , ERROR_PROCEDURE() AS ErrorProcedure
		 , ERROR_MESSAGE() AS ErrorMessage
		 , ERROR_NUMBER() AS ErrorNumber
         , ERROR_SEVERITY() AS ErrorSeverity
         , ERROR_STATE() as ErrorState
         , ERROR_LINE() as ErrorLine;

END CATCH

END
GO

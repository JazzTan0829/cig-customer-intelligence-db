USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Opportunities]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[RunDaily_Opportunities]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Opportunities]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-09-28
-- Description:	Procedure Run Daily to build the Opportunities table
-- =============================================
CREATE PROCEDURE [domain].[RunDaily_Opportunities] 
AS
BEGIN

-- TRY STATEMENT CAPTURES ALL OF THE PROCEDURE EXECUTION STATEMENTS OF THE RUN_DAILY JOB. ANY ERRORS THAT ARE OCCUR ARE CAPTURED IN THE CATCH STATEMENT TOWARDS THE BOTTOM OF THE SCRIPT	
BEGIN TRY
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Opportunities_Hosting', 'Start')
	EXEC domain.Load_Opportunities_Hosting
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Opportunities_Hosting', 'End')

--Opportunities
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Opportunities', 'Start')
	EXEC domain.Load_Opportunities
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Opportunities', 'End')



END TRY

-- CAPTURES ANY ERRORS THAT OCCUR IN THE STORED PROCEDURES AND INSERTS THEM INTO THE ERRORLOG TABLE	
BEGIN CATCH
    INSERT INTO CustomerIntelligence.config.ErrorLog
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

USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Eloqua]    Script Date: 17-Oct-18 17:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-04-19
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[RunDaily_Eloqua] 
AS
BEGIN
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Eloqua_Accounts', 'Start')
	EXEC raw.Load_Eloqua_Accounts_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Eloqua_Accounts', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Eloqua_ContactLicences', 'Start')
	EXEC raw.Load_Eloqua_ContractLicences_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Eloqua_ContactLicences', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Eloqua_Contacts', 'Start')
	EXEC raw.Load_Eloqua_Contacts_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Eloqua_Contacts', 'End')


--Delete history data from eloqua
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Delete old Eloqua_Contacts', 'Start')
		SELECT *
		FROM	
			(
				SELECT *,
				ROW_NUMBER() OVER (PARTITION BY EmailAddress ORDER BY DateModified DESC) AS RN
				FROM [raw].[Eloqua_Contacts]
			) SUB
		WHERE RN>1
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Delete old Eloqua_Contacts', 'End')


END

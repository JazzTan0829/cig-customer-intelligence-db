USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_SkillUser]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_SkillUser]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_SkillUser]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_SkillUser] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_SkillUser
END
BEGIN

WITH Salesforce_SkillUser_Latest
(
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[UserId]
      ,[EtlInsertTime],
	  RN
)
AS
(
	SELECT
	 [Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[UserId]
      ,[EtlInsertTime],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_SkillUser]
)

INSERT INTO [domain].[Salesforce_SkillUser]
	(
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[UserId]
      ,[EtlInsertTime]
	)

	SELECT
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[UserId]
      ,[EtlInsertTime]
	  FROM Salesforce_SkillUser_Latest
	  WHERE RN = 1

END
GO

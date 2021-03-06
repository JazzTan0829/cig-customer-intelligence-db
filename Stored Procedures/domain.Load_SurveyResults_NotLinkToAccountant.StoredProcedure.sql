USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_SurveyResults_NotLinkToAccountant]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_SurveyResults_NotLinkToAccountant]
GO
/****** Object:  StoredProcedure [domain].[Load_SurveyResults_NotLinkToAccountant]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-04-24
-- Description:	Load procedure SurveyResults_NotLinkToAccountant
-- =============================================

CREATE PROCEDURE [domain].[Load_SurveyResults_NotLinkToAccountant]

AS
BEGIN
TRUNCATE TABLE domain.SurveyResults_NotLinkToAccountant
END


BEGIN
WITH UsersWithReasonsNotLinkToAccountant 
AS
(
SELECT 
	sr.CreatedDate AS SubmittedDate,
	sr.ObjectiveAnswer, 
	sr.SubjectiveAnswer,
	sr.AccountID, 
	sr.UserID,
	sr.DivisionCode ,
	ROW_NUMBER() OVER (PARTITION BY sr.AccountID ORDER BY sr.CreatedDate DESC) AS RowNumber
FROM domain.SurveyResults sr
WHERE sr.QuestionCode = 0
)

INSERT INTO domain.SurveyResults_NotLinkToAccountant
	(
	[SubmittedDate], 
	[ObjectiveAnswer], 
	[ObjectiveAnswerDescription], 
	[SubjectiveAnswer], 
	[AccountID], 
	[UserID], 
	[DivisionCode]
	)

SELECT 
	SubmittedDate,
	ObjectiveAnswer,
	CASE ObjectiveAnswer
		WHEN 0 THEN 'My accountant does not work with EOL'
		WHEN 1 THEN 'Have not chosen accountant'
		WHEN 2 THEN 'No need external accountant'
		WHEN 3 THEN 'Disallow accountant direct access'
		WHEN 4 THEN 'Other reasons'
		WHEN 5 THEN 'Intend to link accountant but skip the step later (* This answer is not visible to the user)'
	END AS ObjectiveAnswerDescription,
	SubjectiveAnswer,
	AccountID,
	UserID,
	DivisionCode
FROM UsersWithReasonsNotLinkToAccountant
WHERE RowNumber = '1'

END
GO

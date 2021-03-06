USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_ActivityDaily]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_ActivityDaily]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_ActivityDaily]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_ActivityDaily]
AS

SELECT
	CONCAT(Summary.Environment, Summary.AccountCode) AS EnviroAccountCode
	, Summary.Environment
	, Summary.AccountCode
	, [Date] AS ActivityDate
	, CASE WHEN AD.[Date] >= FirstCommStartDate THEN 'C' ELSE 'T' END AS ContractType
	, CASE WHEN AD.[Date] >= FirstCommStartDate THEN (DATEDIFF(DAY, FirstCommStartDate, AD.[Date]) + 1) ELSE (DATEDIFF(DAY, FirstTrialStartDate, AD.[Date]) + 1) END AS ContractLifetimeDay
	, AD.UserID
	, UserTypeDescription
	
	-- Determines if the UserID belongs to the entrepreneur or the accountant
	, CASE 
			WHEN AD.UserID IS NULL THEN NULL
			WHEN Summary.AccountantCode = Accounts.AccountCode THEN 'Accountant' 
			ELSE 'Entrepreneur' 
			END AS UserAccount
	, AD.DivisionCode AS AdministrationID
	, AD.ActivityID
	, ActivityDescription
	, ActivityGroup
	, ActivitySubGroup
	
	-- Determines broader activity actions e.g. Banking or Invoicing
	, CASE 
		WHEN AD.ActivityID = '500706' OR AD.ActivityID = '510906' OR AD.ActivityID = '5128' OR AD.ActivityID = '501302' THEN 'Banking'
		WHEN AD.ActivityID = '512328' OR AD.ActivityID = '512430' OR AD.ActivityID = '512526' OR AD.ActivityID = '512621' OR AD.ActivityID = '513821' OR AD.ActivityID = '513928' THEN 'Invoicing'
		ELSE NULL
		END
		AS MainActivity
	, Quantity												
FROM
	publish.VIEW_CustomerProfile_Summary AS Summary
	
LEFT JOIN		
	domain.ActivityDaily AD
	ON Summary.Environment = AD.Environment
	AND Summary.AccountCode = AD.AccountCode

LEFT JOIN config.Activities A
	ON AD.ActivityID = A.ActivityID

LEFT JOIN domain.Users  
	ON AD.UserID = Users.UserID 

LEFT JOIN domain.UserUserTypes  
	ON AD.UserID = UserUserTypes.UserID
	AND AD.[Date] <= (CASE WHEN UserUserTypes.EndDate IS NOT NULL THEN UserUserTypes.EndDate ELSE GETDATE() END) 

LEFT JOIN domain.UserTypes
	ON UserUserTypes.UserTypeID = UserTypes.UserTypeID

LEFT JOIN domain.Accounts
	ON Users.AccountID = Accounts.AccountID

GO

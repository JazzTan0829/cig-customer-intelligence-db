USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_BigQuery_Community]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_BigQuery_Community]
GO
/****** Object:  StoredProcedure [domain].[Load_BigQuery_Community]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [domain].[Load_BigQuery_Community] AS

BEGIN
TRUNCATE TABLE CustomerIntelligence.domain.BigQuery_Community

INSERT INTO [CustomerIntelligence].domain.BigQuery_Community
([UserID], [AccountID], [FullName], [Date], [PathLevel1], [PathLevel3], [PathLevel4], [HitNumber])
SELECT
	(U.UserID__c) AS UserID
	, U.ExactIDAccount__c AS AccountID
	, Users.FullName
	, CAST(DATEADD(S, [visitStartTime], '1970-01-01') AS DATE) AS [Date]  -- Converts the visitStartTime field into a usable datetime.
	, REPLACE(hits_page_pagePathLevel1,'/','') AS PathLevel1
	, REPLACE(hits_page_pagePathLevel3,'/','') AS PathLevel3
	, CASE 
		WHEN hits_page_pagePathLevel3='/search/' THEN REPLACE(hits_page_pagePathLevel4,'/All/Home/','') 
		WHEN hits_page_pagePathLevel3='/article/' THEN LTRIM(REPLACE(REPLACE(REPLACE(SUBSTRING(hits_page_pagePathLevel4, CHARINDEX('-HNO-', hits_page_pagePathLevel4), LEN(hits_page_pagePathLevel4)), '', ''),'-',' '),'HNO',''))
		WHEN hits_page_pagePathLevel3='/case/' THEN REPLACE(REPLACE(hits_page_pagePathLevel4,'/Case/',''),'/','')
		WHEN hits_page_pagePathLevel3='/group/' THEN REPLACE(hits_page_pagePathLevel4,'/CollaborationGroup/','') 
		WHEN hits_page_pagePathLevel3='/question/' THEN REPLACE(hits_page_pagePathLevel4,'/','') 
		WHEN hits_page_pagePathLevel3='/community/' THEN REPLACE(hits_page_pagePathLevel4,'/','') 
		WHEN hits_page_pagePathLevel3='/topic/' THEN SUBSTRING(REPLACE(hits_page_pagePathLevel4, '/', ''), LEN(hits_page_pagePathLevel4) - CHARINDEX('/',REVERSE(hits_page_pagePathLevel4)), CHARINDEX('/',REVERSE(hits_page_pagePathLevel4)) + 1)
		WHEN hits_page_pagePathLevel3='/profile/' THEN REPLACE(hits_page_pagePathLevel4,'/','') 
		ELSE hits_page_pagePathLevel4 END AS [PathLevel4]
	, hits_hitNumber as [HitNumber]

FROM [raw].[BigQuery_Salesforce] BQ
INNER JOIN 
	( 
		SELECT
			Id
			, TRY_CONVERT( uniqueidentifier, RTRIM(LTRIM(UserID__c))) AS UserID__c		-- Try convert required to return a NULL for values that cannot be converted to unique identifier. This is needed instead of a WHERE statement as the query optimizer was changing the order of the WHERE statement to run it after the regular cast/convert, resulting in an error.
			, UPPER(ExactIDAccount__c) AS ExactIDAccount__c
		FROM [raw].[Salesforce_User_Latest] 		
	) U
	ON BQ.userIdLong = U.Id

INNER JOIN domain.Users
	ON U.UserID__c = Users.UserID

WHERE
	 U.UserID__c IS NOT NULL
			-- Excludes the Salesforce user records that could not be converted into a unique identifier

Group by UserID__c, ExactIDAccount__c, [visitStartTime]	, hits_page_pagePathLevel1, hits_page_pagePathLevel2, hits_page_pagePathLevel3, hits_page_pagePathLevel4, FullName, hits_hitNumber
ORDER BY UserID__c, Date, hits_hitNumber
END
GO

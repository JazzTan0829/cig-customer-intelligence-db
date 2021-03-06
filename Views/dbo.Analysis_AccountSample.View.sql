USE [CustomerIntelligence]
GO
/****** Object:  View [dbo].[Analysis_AccountSample]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [dbo].[Analysis_AccountSample]
GO
/****** Object:  View [dbo].[Analysis_AccountSample]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[Analysis_AccountSample]
AS
SELECT 
	   ROW_NUMBER() OVER (ORDER BY Acc.AccountID) AS CustomerNumber,
	   Acc.Environment,
       Acc.AccountID,
       Acc.Churned,
       Acc.FullCancellationRequestDate,
       LatestCommStartDate,
       FirstCommStartDate,
	   LatestCommFinalDate,
	   Acc.FirstTrialStartDate,
	   Acc.FirstTrialFinalDate,
       Acc.HadTrial,
       Acc.AccountantLinked,
       Pack.Edition,
       Pack.Product
       --,DATEDIFF(DAY,Accounts_Summ.LatestCommStartDate, Activity.Date) AS Tenure 
FROM [CustomerIntelligence].[domain].[AccountsContract_Summary] AS Acc 
JOIN [CustomerIntelligence].[domain].[PackageClassification] AS Pack 
       ON Pack.PackageCode=Acc.LatestCommPackage AND Pack.Environment=Acc.Environment
JOIN [CustomerIntelligence].[domain].[Accounts] AS A
       ON Acc.AccountID = A.AccountID
WHERE Acc.FirstCommStartDate >= '2017-01-01'
  AND Acc.FirstCommStartDate <= '2017-03-31'
  AND Acc.HadCommContract = 1
  AND Product='Accounting'
  AND (A.AccountClassificationCode = 'EOL'
       OR A.AccountClassificationCode = 'ACC'
       OR A.AccountClassificationCode = 'AC7'
       OR A.AccountClassificationCode = 'JBO')
  AND Acc.Environment='NL'
       



GO

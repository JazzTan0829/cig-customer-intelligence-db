USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Accounts_MainDivision]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Accounts_MainDivision]
GO
/****** Object:  View [domain].[Accounts_MainDivision]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[Accounts_MainDivision] AS
SELECT 
	Sub1.Environment,
	Sub1.AccountCode,
	--AccountID,
	Sub1.DivisionCode,
	MasterDataSetupType

FROM (

		SELECT
			SUB.AccountCode,
			--AccountID, 
			SUB.DivisionCode, 
			SUB.Environment,
			Pageviews,
			NumberOfUsers,
			DMD.MasterDataSetupType,
			ROW_NUMBER() OVER (Partition by SUB.AccountCode, SUB.Environment ORDER BY Pageviews desc,NumberOfUsers desc) AS RowNumber
		FROM (
					Select
						AD.AccountCode,
						--AccountID, 
						AD.DivisionCode, 
						AD.Environment,
						SUM(Quantity) As Pageviews,
						COUNT(Distinct UserID) AS NumberOfUsers
					FROM domain.ActivityDaily AD
					WHERE 
						ActivityID='1'
						--AND Date>GETDATE()-92
					GROUP BY 
						AD.AccountCode,
						--AccountID, 
						AD.DivisionCode, 
						AD.Environment
		)SUB
LEFT JOIN domain.Divisions_MasterDataSetup DMD
ON SUB.DivisionCode=DMD.DivisionCode AND SUB.Environment=DMD.Environment
WHERE DMD.MasterDataSetupType<>'TemporaryDivision'
)Sub1


WHERE 
	Sub1.RowNumber='1'
GO

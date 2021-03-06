USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Eloqua_KeyEvents_New]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Eloqua_KeyEvents_New]
GO
/****** Object:  View [domain].[Eloqua_KeyEvents_New]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[Eloqua_KeyEvents_New] 
As
SELECT 
	ContactID, 
	LegislationTemplateCreated AS LegislationTemplateCreated,
	FirstPurchaseEntry AS FirstPurchaseEntry,
	FirstBankStatement AS FirstBankStatement,
	FirstSalesInvoice AS FirstSalesInvoice,
	FirstOpportunity AS FirstOpportunity,
	FirstTimeEntry AS FirstTimeEntry,
	FirstProject AS FirstProject,
	LastUpdatedDatetime

FROM
(
		SELECT ContactID, KeyEvent, Timestamp, MAX(InsertedDatetime) AS LastUpdatedDatetime
		FROM domain.Contacts C
		LEFT JOIN
		(
		--Legislastion Template
		SELECT 
			AccountID
			, 'LegislationTemplateCreated' AS [KeyEvent]
			,
				CASE
				WHEN [Key Event]='Legislation Template Created'  
				THEN MIN([Key Event timestamp]) 
				END AS [Timestamp]
			, InsertedDatetime
		FROM domain.KeyEvents_All
		WHERE [Key Event]='Legislation Template Created' 
		GROUP BY 
			AccountID,
			[Key Event], 
			InsertedDatetime

		UNION

		--Purchase Entry
		SELECT 
			KEA2.AccountID
			, 'FirstPurchaseEntry' AS [KeyEvent]
			, 	CASE
			WHEN [Key Event]='First Purchase Entry'  THEN MIN([Key Event timestamp]) END AS [FirstPurchaseEntry]
			,KEA2.InsertedDatetime
		FROM domain.KeyEvents_All KEA2

		LEFT JOIN 
			(
			SELECT 
				AccountID
				, 	CASE
					WHEN [Key Event]='Legislation Template Created'  THEN MIN([Key Event timestamp]) END AS [LegislationTemplateCreated]
				, InsertedDatetime
			FROM domain.KeyEvents_All
			WHERE [Key Event]='Legislation Template Created' 
			GROUP BY AccountID,[Key Event], InsertedDatetime
			) AS S2
		ON KEA2.AccountID=S2.AccountID

		WHERE 
			[Key Event]='First Purchase Entry' 
			AND KEA2.[Key Event timestamp]>S2.LegislationTemplateCreated
		GROUP BY KEA2.AccountID,[Key Event], KEA2.InsertedDatetime

		UNION

		--First Bank Statement
		SELECT 
			KEA3.AccountID
			, 'FirstBankStatement' AS [KeyEvent]
			, CASE
				WHEN [Key Event]='First Bank Statement Import'  THEN MIN([Key Event timestamp]) END AS [FirstBankStatementImport]
			, KEA3.InsertedDatetime
		FROM domain.KeyEvents_All KEA3

		LEFT JOIN 
			(
				SELECT 
				AccountID
				, 	CASE
					WHEN [Key Event]='Legislation Template Created'  THEN MIN([Key Event timestamp]) END AS [LegislationTemplateCreated]
				, InsertedDatetime
			FROM domain.KeyEvents_All
			WHERE [Key Event]='Legislation Template Created' 
			GROUP BY AccountID,[Key Event], InsertedDatetime
			) AS S3
		ON KEA3.AccountID=S3.AccountID

		WHERE [Key Event]='First Bank Statement Import' AND KEA3.[Key Event timestamp]>S3.LegislationTemplateCreated
		GROUP BY KEA3.AccountID,[Key Event], KEA3.InsertedDatetime

		UNION

		-- Sales Invoice
		SELECT 
			KEA4.AccountID
			, 'FirstSalesInvoice' AS [KeyEvent]
			, CASE
				WHEN [Key Event]='First Sales Invoice'  THEN MIN([Key Event timestamp]) END AS [FirstSalesInvoice]
			,KEA4.InsertedDatetime
		FROM domain.KeyEvents_All KEA4

		LEFT JOIN 
			(
				SELECT 
				AccountID
				, 	CASE
					WHEN [Key Event]='Legislation Template Created'  THEN MIN([Key Event timestamp]) END AS [LegislationTemplateCreated]
				, InsertedDatetime
			FROM domain.KeyEvents_All
			WHERE [Key Event]='Legislation Template Created' 
			GROUP BY AccountID,[Key Event], InsertedDatetime
			) AS S4
		ON KEA4.AccountID=S4.AccountID

		WHERE [Key Event]='First Sales Invoice' AND KEA4.[Key Event timestamp]>S4.LegislationTemplateCreated
		GROUP BY KEA4.AccountID,[Key Event], KEA4.InsertedDatetime

		UNION
		-- First Opportunity
		SELECT 
			KEA5.AccountID
			, 'FirstOpportunity' AS [KeyEvent]
			, 	CASE
				WHEN [Key Event]='First Opportunity'  THEN MIN([Key Event timestamp]) END AS [FirstOpportunity]
			, KEA5.InsertedDatetime
		FROM domain.KeyEvents_All KEA5

		LEFT JOIN 
			(
				SELECT 
				AccountID
				, 	CASE
					WHEN [Key Event]='Legislation Template Created'  THEN MIN([Key Event timestamp]) END AS [LegislationTemplateCreated]
				, InsertedDatetime
			FROM domain.KeyEvents_All
			WHERE [Key Event]='Legislation Template Created' 
			GROUP BY AccountID,[Key Event], InsertedDatetime
			) AS S5
		ON KEA5.AccountID=S5.AccountID

		WHERE [Key Event]='First Opportunity' AND KEA5.[Key Event timestamp]>S5.LegislationTemplateCreated
		GROUP BY KEA5.AccountID,[Key Event], KEA5.InsertedDatetime

		UNION
		-- Time Entry
		SELECT 
			KEA6.AccountID
			, 'FirstTimeEntry' AS [KeyEvent]
			, CASE
				WHEN [Key Event]='First Time Entry'  THEN MIN([Key Event timestamp]) END AS [FirstTimeEntry]
			, KEA6.InsertedDatetime
		FROM domain.KeyEvents_All KEA6

					LEFT JOIN 
						(
							SELECT 
							AccountID
							, 	CASE
								WHEN [Key Event]='Legislation Template Created'  THEN MIN([Key Event timestamp]) END AS [LegislationTemplateCreated]
							, InsertedDatetime
						FROM domain.KeyEvents_All
						WHERE [Key Event]='Legislation Template Created' 
						GROUP BY AccountID,[Key Event], InsertedDatetime
						) AS S6
					ON KEA6.AccountID=S6.AccountID


		WHERE [Key Event]='First Time Entry' AND KEA6.[Key Event timestamp]>S6.LegislationTemplateCreated
		GROUP BY KEA6.AccountID,[Key Event], KEA6.InsertedDatetime

		UNION
		--First Project
		SELECT 
			KEA7.AccountID
			, 'FirstProject' AS [KeyEvent]
			, CASE
				WHEN [Key Event]='First Project'  THEN MIN([Key Event timestamp]) END AS [FirstProject]
			, KEA7.InsertedDatetime
		FROM domain.KeyEvents_All KEA7

					LEFT JOIN 
						(
							SELECT 
							AccountID
							, 	CASE
								WHEN [Key Event]='Legislation Template Created'  THEN MIN([Key Event timestamp]) END AS [LegislationTemplateCreated]
							, InsertedDatetime
						FROM domain.KeyEvents_All
						WHERE [Key Event]='Legislation Template Created' 
						GROUP BY AccountID,[Key Event], InsertedDatetime
						) AS S7
					ON KEA7.AccountID=S7.AccountID


		WHERE [Key Event]='First Project' AND KEA7.[Key Event timestamp]>S7.LegislationTemplateCreated
		GROUP BY KEA7.AccountID,[Key Event], KEA7.InsertedDatetime
		) SUB
		ON C.AccountID=SUB.AccountID
		GROUP BY  ContactID, KeyEvent, Timestamp
) p
PIVOT
(
MAX([timestamp])
FOR KeyEvent IN (LegislationTemplateCreated, FirstPurchaseEntry,FirstBankStatement,FirstSalesInvoice,FirstOpportunity,FirstTimeEntry,FirstProject)
) AS pvt
GO

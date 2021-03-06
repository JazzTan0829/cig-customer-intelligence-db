USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionStartupType]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_DivisionStartupType]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionStartupType]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================
-- Author:		Alex Green
-- Create date: 16-01-2017
-- Description:	Loads the DivisionStartupType table. This is a hard-coded table based on the extract from TFS
--				provided by Maarten Wiertz - TFS (Exact.HRM\Jobs\DivisionCopy\DivisionMaintain.vb(316))
-- =====================================================================================================================


CREATE PROCEDURE [domain].[Load_DivisionStartupType]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.DivisionStartupType

INSERT INTO domain.DivisionStartupType (StartupType, StartupTypeDescription)
VALUES 
	('E', 'Empty')
	, ('X', 'LegislationTemplate') -- Normal Exact template
	, ('Y', 'LegislationDemo') -- Demo Template
	, ('A', 'DivisionTemplate') --Accountant Template, created by an accountant. The client can select that template.
	, ('D', 'DivisionCopy') -- Copied Division
	, ('R', 'DivisionReturn') -- Only if they use for example globe. They use EOL to do declerations.
	, ('C', 'Conversion') 
	, ('U', 'Unknown')


END

GO

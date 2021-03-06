USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_AccountingPSAUpgradeModel1_Enviro_AccountCode]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_AccountingPSAUpgradeModel1_Enviro_AccountCode] ON [raw].[20180424_AccountingCustomerPSAPotential_Model1] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[20180424_AccountingCustomerPSAPotential_Model1]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[20180424_AccountingCustomerPSAPotential_Model1]
GO
/****** Object:  Table [raw].[20180424_AccountingCustomerPSAPotential_Model1]    Script Date: 24-sept.-18 14:21:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[20180424_AccountingCustomerPSAPotential_Model1](
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Upgrade Probability] [float] NULL,
	[Environment] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AccountingPSAUpgradeModel1_Enviro_AccountCode]    Script Date: 24-sept.-18 14:21:49 ******/
CREATE CLUSTERED INDEX [IX_AccountingPSAUpgradeModel1_Enviro_AccountCode] ON [raw].[20180424_AccountingCustomerPSAPotential_Model1]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

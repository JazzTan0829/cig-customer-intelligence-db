USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_GDPR_AccountsDeletion_AccountIDProcessed]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_GDPR_AccountsDeletion_AccountIDProcessed] ON [config].[GDPR_AccountsDeletionLog] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[GDPR_AccountsDeletionLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[GDPR_AccountsDeletionLog]
GO
/****** Object:  Table [config].[GDPR_AccountsDeletionLog]    Script Date: 24-sept.-18 14:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[GDPR_AccountsDeletionLog](
	[AccountID] [uniqueidentifier] NULL,
	[DateTimeSelect] [datetime] NULL,
	[Processed] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_GDPR_AccountsDeletion_AccountIDProcessed]    Script Date: 24-sept.-18 14:21:05 ******/
CREATE CLUSTERED INDEX [IX_GDPR_AccountsDeletion_AccountIDProcessed] ON [config].[GDPR_AccountsDeletionLog]
(
	[Processed] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

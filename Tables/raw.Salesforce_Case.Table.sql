USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_Case_RecordType]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_RecordType] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_OwnerId]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_OwnerId] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_Owner]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_Owner] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_LastModifiedDate_Owner]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_LastModifiedDate_Owner] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_CreatedDate_Id]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_CreatedDate_Id] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_CreatedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_CreatedDate] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_ContactId]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_ContactId] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_Contact]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_Contact] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_CaseID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_CaseID] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_AccountId]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_AccountId] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_Account]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_Account] ON [raw].[Salesforce_Case]
GO
/****** Object:  Index [IX_Salesforce_Case_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Case_LastModifiedDate] ON [raw].[Salesforce_Case] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_Case]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Case]
GO
/****** Object:  Table [raw].[Salesforce_Case]    Script Date: 24-sept.-18 14:22:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Case](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CaseNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClosedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsClosed] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsEscalated] [bit] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastReferencedDate] [datetime] NULL,
	[LastViewedDate] [datetime] NULL,
	[Origin] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordTypeId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OwnerId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Number__c] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Call_me_back__c] [bit] NULL,
	[Case_subject__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date_Time_Answered__c] [datetime] NULL,
	[Enddate__c] [datetime] NULL,
	[Exact_Creation_Date__c] [datetime] NULL,
	[Exact_ID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exact_Request_Number__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Main_Reason__c] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Planned_End_Date__c] [datetime] NULL,
	[Reject_Reason__c] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Solution__c] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Startdate__c] [datetime] NULL,
	[Start_Date__c] [datetime] NULL,
	[Sub_Reason__c] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Owner_Role__c] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Related_case__c] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Hosting_Environment__c] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NOT NULL,
	[X2nd_Line_Help__c] [bit] NULL,
	[Date_Time_Reopened__c] [datetime] NULL,
	[Number_of_times_reopened__c] [float] NULL,
	[Reason_Complaint__c] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sub_Reason_Complaint__c] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_LastModifiedDate]    Script Date: 24-sept.-18 14:22:25 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_Case_LastModifiedDate] ON [raw].[Salesforce_Case]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_Account]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_Account] ON [raw].[Salesforce_Case]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_AccountId]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_AccountId] ON [raw].[Salesforce_Case]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_CaseID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_CaseID] ON [raw].[Salesforce_Case]
(
	[Id] ASC,
	[LastModifiedDate] DESC,
	[LastReferencedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_Contact]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_Contact] ON [raw].[Salesforce_Case]
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_ContactId]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_ContactId] ON [raw].[Salesforce_Case]
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Salesforce_Case_CreatedDate]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_CreatedDate] ON [raw].[Salesforce_Case]
(
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_CreatedDate_Id]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_CreatedDate_Id] ON [raw].[Salesforce_Case]
(
	[CreatedDate] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_LastModifiedDate_Owner]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_LastModifiedDate_Owner] ON [raw].[Salesforce_Case]
(
	[Id] ASC,
	[LastModifiedDate] ASC,
	[OwnerId] ASC,
	[Owner_Role__c] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_Owner]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_Owner] ON [raw].[Salesforce_Case]
(
	[OwnerId] ASC,
	[Owner_Role__c] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_OwnerId]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_OwnerId] ON [raw].[Salesforce_Case]
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Case_RecordType]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_Case_RecordType] ON [raw].[Salesforce_Case]
(
	[RecordTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

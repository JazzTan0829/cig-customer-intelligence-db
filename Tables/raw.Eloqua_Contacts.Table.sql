USE [CustomerIntelligence]
GO
/****** Object:  Index [NonClusteredIndex-20180723-163208]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20180723-163208] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [IX_Eloqua_Contacts_EOLContactID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Contacts_EOLContactID] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [IX_Eloqua_Contacts_EOLAccountID_EmailAddress_DateModified]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Contacts_EOLAccountID_EmailAddress_DateModified] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [IX_Eloqua_Contacts_EOLAccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Contacts_EOLAccountID] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [IX_Eloqua_Contacts_EmailAddress]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Contacts_EmailAddress] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [IX_Eloqua_Contacts_EloquaContactID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Contacts_EloquaContactID] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [IX_Eloqua_Contacts_DateCreated]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Contacts_DateCreated] ON [raw].[Eloqua_Contacts]
GO
/****** Object:  Index [CIX_Eloqua_Contacts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_Eloqua_Contacts] ON [raw].[Eloqua_Contacts] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Eloqua_Contacts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_Contacts]
GO
/****** Object:  Table [raw].[Eloqua_Contacts]    Script Date: 24-sept.-18 14:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_Contacts](
	[EmailAddress] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailDisplayName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address3] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateOrProvince] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipOrPostalCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhone] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobilePhone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Salutation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Salesperson] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFDCContactID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFDCLeadID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[EloquaContactID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFDCAccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedByCRMSystem] [datetime] NULL,
	[LastSFDCCampaignID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastSFDCCampaignStatus] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyRevenue] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SFDCEmailOptOut] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadSourceMostRecent] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadSourceOriginal] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Industry] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnnualRevenue] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobRole] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadScore_HighValueWebsiteContent] [float] NULL,
	[LeadScodeDate_EngagementMostRecent] [datetime] NULL,
	[IntegratedMarketingAndSalesFunnel] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductSolutionOfInterest] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Region] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PURLName_DefaultHypersite] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadRatingCombined] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddressDomain] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstAndLastName] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanySize] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadScore_LastHighTouchEventDate] [datetime] NULL,
	[LeadRating_ProfileExplicit] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadRating_EngagementImplicit] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadScore_ProfileExplicit] [float] NULL,
	[LeadScore_EngagementImplicit] [float] NULL,
	[LeadScoreDate_ProfileMostRecent] [datetime] NULL,
	[Employees] [float] NULL,
	[Territory] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MD5HashedEmailAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SHA256HashedEmailAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MD5HashedBusinessPhone] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SHA256HashedBusinessPhone] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MD5HashedMobilePhone] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SHA256HashedMobilePhone] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadScore] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PURLName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLContactID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAccountCode] [float] NULL,
	[EOLAccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAdministration] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BirthDate] [datetime] NULL,
	[FullName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Initials] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MainContact] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstNameForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastNameForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhoneForm] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobilePhoneForm] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProbablyAccountantForm] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCOptOutDate] [datetime] NULL,
	[PCOptInDate] [datetime] NULL,
	[JobTitle] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LanguageForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobTitleForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TitleForm] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCProjectManagement] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCTimeAndBilling] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCManufacturing] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCWholesale] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCAccountancy] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCAccounting] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DecisionMakingRoleForm] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipOrPostalCodeForm] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanySizeForm] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityCampaignCode] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityLeadType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityNotesOld] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityProjectName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityCategory] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCOptOutReason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCOptOutReasonOther] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLOpportunityID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyEmail] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebsiteForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCOptIn] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EGBlogUpdates] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EGEvents] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EGNewsletter] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EGProductInformation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EGThirdPartyEmails] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IMSFStage] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IMSFStatus] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IMSFStageSince] [datetime] NULL,
	[IMSFStatusSince] [datetime] NULL,
	[IMSFSince] [datetime] NULL,
	[UserStatus] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserStartDate] [datetime] NULL,
	[UserEndDate] [datetime] NULL,
	[SpamControl] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountryForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhoneExtension] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedByEOLSystem] [datetime] NULL,
	[CRMSubscribed] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubsectorForm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DUNSNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChamberOfCommerce] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EGEmailService] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SALControl] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Validation] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidationDate] [datetime] NULL,
	[TouchPoint] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaidLead] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormSingleOptIn] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormOptIn] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExactUniqueID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormTitleRSFormProJoomla] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormOpportunityOptOut] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormOpportunityCategory] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormAssessmentResult] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormLanguageForm] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FormSourceLanguage] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastLoginDate] [datetime] NULL,
	[OpportunityNotes] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MarketingFunnel] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MarketingFunnelDate] [datetime] NULL,
	[DataCleansing] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebinarDate] [datetime] NULL,
	[PCEndorsement] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityDescription] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityResellerCode] [float] NULL,
	[GAPGoogleID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityChannel] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityAccountantCode] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Eloqua_Contacts]    Script Date: 24-sept.-18 14:21:58 ******/
CREATE CLUSTERED INDEX [CIX_Eloqua_Contacts] ON [raw].[Eloqua_Contacts]
(
	[DateModified] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Eloqua_Contacts_DateCreated]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Contacts_DateCreated] ON [raw].[Eloqua_Contacts]
(
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Contacts_EloquaContactID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Contacts_EloquaContactID] ON [raw].[Eloqua_Contacts]
(
	[EloquaContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Contacts_EmailAddress]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Contacts_EmailAddress] ON [raw].[Eloqua_Contacts]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Contacts_EOLAccountID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Contacts_EOLAccountID] ON [raw].[Eloqua_Contacts]
(
	[EOLAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Contacts_EOLAccountID_EmailAddress_DateModified]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Contacts_EOLAccountID_EmailAddress_DateModified] ON [raw].[Eloqua_Contacts]
(
	[EOLAccountID] ASC
)
INCLUDE ( 	[EmailAddress],
	[DateModified]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Contacts_EOLContactID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Contacts_EOLContactID] ON [raw].[Eloqua_Contacts]
(
	[EOLContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20180723-163208]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180723-163208] ON [raw].[Eloqua_Contacts]
(
	[DateModified] DESC,
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

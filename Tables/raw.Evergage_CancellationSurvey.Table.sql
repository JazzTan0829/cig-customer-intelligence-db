USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Evergage_CancellationSurvey]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Evergage_CancellationSurvey]
GO
/****** Object:  Table [raw].[Evergage_CancellationSurvey]    Script Date: 24-sept.-18 14:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Evergage_CancellationSurvey](
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountName] [char](28) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SegmentJoined] [datetime2](7) NOT NULL,
	[FullCancellationReason_NonAccountancy1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_Submit_Actions_for_all_time] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a1b1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a1a1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a2b1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a1d1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1b1d2] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a1c1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a1d2] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_Viewed_Campaign_FullCancellationReason_Accounting_NL] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1b1d1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_Viewed_Campaign_FullCancellationReason_Accountancy_NL_EN] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1b2] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1b1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1a2] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1b2t1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellationReason_NonAccountancy1d1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO

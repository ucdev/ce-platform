
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Degree]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Degree](
		[PersonDegreeID] [int] IDENTITY(1,1) NOT NULL,
		[PersonID] [int] NOT NULL,
		[DegreeID] [int] NOT NULL,
		[Created] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Person_Degree] PRIMARY KEY CLUSTERED 
	(
		[PersonDegreeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Degree]') AND name = N'Degree ID')
	CREATE NONCLUSTERED INDEX [Degree ID] ON [ceschema].[ce_Person_Degree] 
	(
		[PersonID] ASC
	)
	INCLUDE ( [DegreeID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessQuestionType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_AssessQuestionType](
		[QuestionTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Sys_QuestionType] PRIMARY KEY CLUSTERED 
	(
		[QuestionTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entitytype]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entitytype](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_entity_type] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Application](
		[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[ReceivedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ReceivedDate] [datetime] NULL,
		[SentFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SentDate] [datetime] NULL,
		[ApprovedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ApprovedDate] [datetime] NULL,
		[NeedsFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[NeedsDate] [datetime] NULL,
		[ObjFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ObjDate] [datetime] NULL,
		[SuppFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SuppDate] [datetime] NULL,
		[AttendFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AttendDate] [datetime] NULL,
		[CVFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CVDate] [datetime] NULL,
		[BrochFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[BrochDate] [datetime] NULL,
		[MembApprFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[MembApprDate] [datetime] NULL,
		[ConflictFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ConflictDate] [datetime] NULL,
		[EvalFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EvalDate] [datetime] NULL,
	 CONSTRAINT [PK_ce_Activity_Application] PRIMARY KEY CLUSTERED 
	(
		[ApplicationID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[geonameCities]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[geonameCities](
		[geonameid] [int] NOT NULL,
		[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[asciiname] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[alternatenames] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[latitude] [decimal](9, 6) NULL,
		[longitude] [decimal](9, 6) NULL,
		[feature_class] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[feature_code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[country_code] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[cc2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[admin1_code] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[admin2_code] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[admin3_code] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[admin4_code] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[population] [bigint] NULL,
		[elevation] [int] NULL,
		[gtopo30] [int] NULL,
		[timezone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[modification_date] [datetime] NULL,
	 CONSTRAINT [PK_geoname2] PRIMARY KEY CLUSTERED 
	(
		[geonameid] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[geonameCities]'))
	CREATE FULLTEXT INDEX ON [ceschema].[geonameCities](
	[admin1_code] LANGUAGE [English], 
	[alternatenames] LANGUAGE [English], 
	[asciiname] LANGUAGE [English], 
	[country_code] LANGUAGE [English], 
	[name] LANGUAGE [English])
	KEY INDEX [PK_geoname2] ON [searchall]
	WITH CHANGE_TRACKING AUTO;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_AssessType](
		[AssessTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Sys_AssessType] PRIMARY KEY CLUSTERED 
	(
		[AssessTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_operation]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_operation](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[_create] [tinyint] NULL,
		[_read] [tinyint] NULL,
		[_update] [tinyint] NULL,
		[_delete] [tinyint] NULL,
		[locked] [tinyint] NOT NULL,
	 CONSTRAINT [PK_ac_action] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	 CONSTRAINT [IX_ac_operation] UNIQUE NONCLUSTERED 
	(
		[name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_entityrole]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity_entityrole](
		[entity_id] [int] NOT NULL,
		[entityrole_id] [int] NOT NULL,
	 CONSTRAINT [PK_ce_entity_entityrole] PRIMARY KEY CLUSTERED 
	(
		[entity_id] ASC,
		[entityrole_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Attendee_Component]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Attendee_Component](
		[CompStatusID] [int] IDENTITY(1,1) NOT NULL,
		[AttendeeID] [int] NOT NULL,
		[ComponentID] [int] NOT NULL,
		[StatusID] [int] NOT NULL,
		[PercentComplete] [float] NULL,
		[TestScore] [float] NULL,
		[LikeFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Feedback] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PingMinutes] [int] NULL,
		[Updated] [datetime] NULL,
	 CONSTRAINT [PK_ce_Attendee_Component] PRIMARY KEY CLUSTERED 
	(
		[CompStatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinBudget]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_FinBudget](
		[BudgetID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[EntryTypeID] [int] NOT NULL,
		[Amount] [float] NOT NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Activity_FinBudget] PRIMARY KEY CLUSTERED 
	(
		[BudgetID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Attendee](
		[AttendeeID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[PersonID] [int] NOT NULL,
		[StatusID] [int] NULL,
		[CheckedInFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CheckIn] [datetime] NULL,
		[CheckedOutFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CheckOut] [datetime] NULL,
		[MDflag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TermsFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PaymentFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PayAmount] [float] NULL,
		[PayOrderNo] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PaymentDate] [datetime] NULL,
		[RegisterDate] [datetime] NULL,
		[CompleteDate] [datetime] NULL,
		[TermDate] [datetime] NULL,
		[firstName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[middleName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[lastName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[email] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[certName] [nvarchar](225) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[address1] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[address2] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[city] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[stateProvince] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[stateId] [int] NULL,
		[countryId] [int] NULL,
		[postalCode] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone1ext] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone2ext] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[fax] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[faxext] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[entryMethod] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[emailSentFlag] [tinyint] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NOT NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_CourseSect_Person] PRIMARY KEY CLUSTERED 
	(
		[AttendeeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[geonameCountryInfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[geonameCountryInfo](
		[ISO] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ISO3] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ISOnumeric] [int] NULL,
	
		[fips] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[country] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[capital] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[area] [float] NULL,
		[population] [bigint] NULL,
		[continent] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[tld] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[currencyCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[currencyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[postalCodeFormat] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[postalCodeRegex] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[languages] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[geonameid] [int] NOT NULL,
		[neighbors] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[equivFipsCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
	END;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_hub]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_hub](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[details] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[text_cat1] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[text_cat2] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[primary_image_id] [int] NULL,
		[wiki_flag] [tinyint] NULL,
		[wiki_pageid] [int] NULL,
		[wiki_title] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[wiki_image] [nvarchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[geonameid] [int] NULL,
		[created] [datetime] NULL,
		[updated] [datetime] NULL,
	 CONSTRAINT [PK_ce_hub] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END;

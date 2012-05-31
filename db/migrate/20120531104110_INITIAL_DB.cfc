<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB">
  <cffunction name="up">
    <cfscript>
    execute("IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ceschema')
			EXEC sys.sp_executesql N'CREATE SCHEMA [ceschema] AUTHORIZATION [ccpdDevUser]'");
	
	execute("EXEC sp_fulltext_database 'enable'");
	
	execute("IF NOT EXISTS (SELECT * FROM sysfulltextcatalogs ftc WHERE ftc.name = N'searchall')
	CREATE FULLTEXT CATALOG [searchall]
	WITH ACCENT_SENSITIVITY = ON
	AUTHORIZATION [ccpdDevUser]");
	
	announce("Object:  Table [ceschema].[ce_Comment]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Comment]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Comment](
		[CommentID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[Comment] [nvarchar](750) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ApproveFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ApprovedBy] [int] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Comment] PRIMARY KEY CLUSTERED 
	(
		[CommentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	
	announce("Object:  Table [ceschema].[xLegacy_cm_STDOrgType]    Script Date: 05/31/2012 10:19:08");
	
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_STDOrgType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_STDOrgType](
		[STDOrgTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Description] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_cm_STDOrgType] PRIMARY KEY CLUSTERED 
	(
		[STDOrgTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity_Note]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Note]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Note](
		[NoteID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[Body] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_CourseNote] PRIMARY KEY CLUSTERED 
	(
		[NoteID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_apiClient]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_apiClient](
		[clientid] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[contactName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[contactPhone] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[hostName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[clientKey] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[statUsers] [int] NULL,
		[statCalls] [int] NULL,
		[statUpdate] [int] NULL,
		[statSignup] [int] NULL,
		[statLogin] [int] NULL,
		[lastAccessed] [datetime] NULL,
		[created] [datetime] NULL,
		[updated] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_apiClient] PRIMARY KEY CLUSTERED 
	(
		[clientid] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]') AND name = N'IX_ce_Sys_apiClient')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_ce_Sys_apiClient] ON [ceschema].[ce_Sys_apiClient] 
	(
		[clientKey] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");

	announce("Object:  Table [ceschema].[xLegacy_cm_STDPercentage]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_STDPercentage]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_STDPercentage](
		[STDPercentageID] [int] IDENTITY(1,1) NOT NULL,
		[Description] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_cm_STDPercentage] PRIMARY KEY CLUSTERED 
	(
		[STDPercentageID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Person_Address]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Address]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Address](
		[AddressID] [int] IDENTITY(1,1) NOT NULL,
		[PersonID] [int] NOT NULL,
		[AddressTypeID] [int] NULL,
		[Address1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[stateId] [int] NULL,
		[Province] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[countryId] [int] NULL,
		[ZipCode] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone1] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone1Ext] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone2] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone2Ext] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone3] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone3Ext] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[geonameid] [int] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
	 CONSTRAINT [PK_ce_Person_Address] PRIMARY KEY CLUSTERED 
	(
		[AddressID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_locationType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_locationType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_locationType](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created] [datetime] NULL,
		[updated] [datetime] NULL,
	 CONSTRAINT [PK_ce_locationType] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_cm_STDPrinOcc]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_STDPrinOcc]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_STDPrinOcc](
		[STDPrinOccID] [int] IDENTITY(1,1) NOT NULL,
		[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_cm_STDPrinOcc] PRIMARY KEY CLUSTERED 
	(
		[STDPrinOccID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_FunRN]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_FunRN]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_FunRN](
		[FunRNID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_FunRN] PRIMARY KEY CLUSTERED 
	(
		[FunRNID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_Supporter]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Supporter]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Supporter](
		[ContributorID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Contributor] PRIMARY KEY CLUSTERED 
	(
		[ContributorID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_pageLayoutMenu_page]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_pageLayoutMenu_page]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_pageLayoutMenu_page](
		[menu_id] [int] NOT NULL,
		[page_id] [int] NOT NULL,
		[parent_page_id] [int] NULL,
		[show_icon] [tinyint] NULL,
		[show_stat] [tinyint] NULL,
		[sort] [int] NULL,
	 CONSTRAINT [PK_ce_pageLayoutMenu_page] PRIMARY KEY CLUSTERED 
	(
		[menu_id] ASC,
		[page_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_cm_TrainingCenter]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_TrainingCenter]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_TrainingCenter](
		[TrainingCenterID] [int] IDENTITY(1,1) NOT NULL,
		[TrainingCenterName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_cm_TrainingCenter] PRIMARY KEY CLUSTERED 
	(
		[TrainingCenterID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Attendee_Step]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Attendee_Step]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Attendee_Step](
		[AttendeeStepID] [int] IDENTITY(1,1) NOT NULL,
		[AttendeeID] [int] NOT NULL,
		[StepTypeID] [int] NOT NULL,
		[StepStatusID] [int] NOT NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
	 CONSTRAINT [PK_ce_Attendee_Step] PRIMARY KEY CLUSTERED 
	(
		[AttendeeStepID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_tt_CourseCreditType]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_CourseCreditType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_CourseCreditType](
		[CourseCreditTypeId] [int] IDENTITY(1,1) NOT NULL,
		[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_tt_CourseCreditType] PRIMARY KEY CLUSTERED 
	(
		[CourseCreditTypeId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity_Other]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Other](
		[OtherID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[DidacticHrs] [float] NULL,
		[ExperimentalHrs] [float] NULL,
		[SecClinSiteFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CollabPTCFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CollabPTCSpecify] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CollabAgencyFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CollabAgencySpecify] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[competenceDesign] [tinyint] NULL,
		[performanceDesign] [tinyint] NULL,
		[outcomesDesign] [tinyint] NULL,
		[competenceEval] [tinyint] NULL,
		[performanceEval] [tinyint] NULL,
		[outcomesEval] [tinyint] NULL,
	 CONSTRAINT [PK_ce_CourseCDC] PRIMARY KEY CLUSTERED 
	(
		[OtherID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Process_Person]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Process_Person]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Process_Person](
		[Process_PersonID] [int] IDENTITY(1,1) NOT NULL,
		[ProcessID] [int] NULL,
		[PersonID] [int] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Process_Person] PRIMARY KEY CLUSTERED 
	(
		[Process_PersonID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_tt_CourseSponsor]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_CourseSponsor]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_CourseSponsor](
		[CourseSponsorID] [int] IDENTITY(1,1) NOT NULL,
		[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_tt_CourseSponsor] PRIMARY KEY CLUSTERED 
	(
		[CourseSponsorID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity_FinSupport]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinSupport]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_FinSupport](
		[SupportID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[SupporterID] [int] NOT NULL,
		[SupportTypeID] [int] NOT NULL,
		[Amount] [float] NOT NULL,
		[ContractNum] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[BudgetRequested] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[BudgetDueDate] [datetime] NULL,
		[BudgetSentDate] [datetime] NULL,
		[SentDate] [datetime] NULL,
		[FundsReturned] [float] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_CourseContrib] PRIMARY KEY CLUSTERED 
	(
		[SupportID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_relicensure]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_relicensure]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_relicensure](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[location_name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[location_code] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[country_code] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[prof_area_id] [int] NULL,
		[cert_area_id] [int] NULL,
		[credit_id] [int] NULL,
		[amount] [int] NULL,
		[term] [int] NULL,
		[term_method] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created] [datetime] NULL,
		[updated] [datetime] NULL,
		[deleted] [datetime] NULL,
		[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_relicensure] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_tt_CourseStatusCode]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_CourseStatusCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_CourseStatusCode](
		[CourseStatusID] [int] IDENTITY(1,1) NOT NULL,
		[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_tt_CourseStatusCode] PRIMARY KEY CLUSTERED 
	(
		[CourseStatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Person_Note]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Note]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Note](
		[NoteID] [int] IDENTITY(1,1) NOT NULL,
		[PersonID] [int] NOT NULL,
		[Body] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_PersonNote] PRIMARY KEY CLUSTERED 
	(
		[NoteID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_SupportType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SupportType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_SupportType](
		[ContribTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_ContribType] PRIMARY KEY CLUSTERED 
	(
		[ContribTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_tt_CourseType]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_CourseType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_CourseType](
		[CourseTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_xLegacy_tt_CourseType] PRIMARY KEY CLUSTERED 
	(
		[CourseTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_Market]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Market]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Market](
		[MarketID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_Market] PRIMARY KEY CLUSTERED 
	(
		[MarketID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_activity_profile]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_profile]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_activity_profile](
		[activity_id] [int] NOT NULL,
		[primary_image_id] [int] NULL,
	 CONSTRAINT [PK_ce_activity_profile] PRIMARY KEY CLUSTERED 
	(
		[activity_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[xLegacy_tt_TrainingFacility]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_tt_TrainingFacility]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_tt_TrainingFacility](
		[TrainingFacilityId] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[StateId] [int] NULL,
		[PostalCode] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phone] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Province] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CountryId] [int] NULL,
	 CONSTRAINT [PK_xLegacy_tt_TrainingFacility] PRIMARY KEY CLUSTERED 
	(
		[TrainingFacilityId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity](
		[ActivityID] [int] IDENTITY(1,1) NOT NULL,
		[ParentActivityID] [int] NULL,
		[ActivityTypeID] [int] NOT NULL,
		[GroupingID] [int] NULL,
		[Title] [nvarchar](750) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ReleaseDate] [datetime] NOT NULL,
		[StartDate] [datetime] NULL,
		[EndDate] [datetime] NULL,
		[LocationID] [int] NULL,
		[Location] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Address2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[State] [int] NULL,
		[Province] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Country] [int] NULL,
		[PostalCode] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SessionType] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[StatusID] [int] NULL,
		[StatMaxRegistrants] [float] NULL,
		[StatAttendees] [float] NULL,
		[StatAddlAttendees] [float] NULL,
		[StatCMEHours] [float] NULL,
		[StatMD] [float] NULL,
		[StatNonMD] [float] NULL,
		[StatSupporters] [float] NULL,
		[StatSuppAmount] [float] NULL,
		[Sponsorship] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Sponsor] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ExternalID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[refreshFlag] [tinyint] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Activity] PRIMARY KEY CLUSTERED 
	(
		[ActivityID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ac_tenantkind]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_tenantkind]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_tenantkind](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created] [datetime] NULL,
	 CONSTRAINT [PK_ac_tenantkind] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	 CONSTRAINT [IX_ac_tenantkind] UNIQUE NONCLUSTERED 
	(
		[name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_AttendeeCredit]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCredit]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AttendeeCredit](
		[AttendeeCreditID] [int] IDENTITY(1,1) NOT NULL,
		[AttendeeID] [int] NOT NULL,
		[CreditID] [int] NOT NULL,
		[Amount] [float] NOT NULL,
		[ReferenceNo] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ExpirationDate] [datetime] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NOT NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_AttendeeCredit] PRIMARY KEY CLUSTERED 
	(
		[AttendeeCreditID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Certificate]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Certificate]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Certificate](
		[certificateId] [int] IDENTITY(1,1) NOT NULL,
		[title] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[detail] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[certConfigFile] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	 CONSTRAINT [PK_ce_Certificate] PRIMARY KEY CLUSTERED 
	(
		[certificateId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity_FinLedger]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinLedger]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_FinLedger](
		[EntryID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[EntryDate] [datetime] NOT NULL,
		[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Memo] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EntryTypeID] [int] NOT NULL,
		[Amount] [float] NOT NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Activity_FinLedger] PRIMARY KEY CLUSTERED 
	(
		[EntryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_entity_activity]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_activity]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity_activity](
		[entity_id] [int] NOT NULL,
		[activity_id] [int] NOT NULL,
	 CONSTRAINT [PK_ce_entity_activity] PRIMARY KEY CLUSTERED 
	(
		[entity_id] ASC,
		[activity_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Person_Interest_Except]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Interest_Except]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Interest_Except](
		[PersonIntExceptID] [int] IDENTITY(1,1) NOT NULL,
		[PersonID] [int] NOT NULL,
		[ActivityID] [int] NOT NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Person_Interest_Exception] PRIMARY KEY CLUSTERED 
	(
		[PersonIntExceptID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_entity_credit]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_credit]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity_credit](
		[entity_id] [int] NOT NULL,
		[credit_id] [int] NOT NULL,
		[entityrole_id] [int] NOT NULL,
		[body_entity_id] [int] NULL,
		[provider_entity_id] [int] NULL,
	 CONSTRAINT [PK_ce_entity_credit] PRIMARY KEY CLUSTERED 
	(
		[entity_id] ASC,
		[credit_id] ASC,
		[entityrole_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_ProjectType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ProjectType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_ProjectType](
		[ProjectTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_ProjectType] PRIMARY KEY CLUSTERED 
	(
		[ProjectTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ac_user_role]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_user_role]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_user_role](
		[user_id] [int] NOT NULL,
		[role_id] [int] NOT NULL,
		[tenant_id] [int] NOT NULL,
	 CONSTRAINT [PK_ac_user_role] PRIMARY KEY CLUSTERED 
	(
		[user_id] ASC,
		[role_id] ASC,
		[tenant_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_objectFieldType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_objectFieldType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_objectFieldType](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[maxIndex] [tinyint] NOT NULL,
	 CONSTRAINT [PK_ce_objectFieldType] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_objectForm]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_objectForm]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_objectForm](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[link_label] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[objectType_id] [int] NULL,
		[entity_id] [int] NULL,
		[entitytype_id] [int] NULL,
		[entityrole_id] [int] NULL,
		[credit_id] [int] NULL,
		[page_event] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_objectForm] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Person_File]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_File]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_File](
		[PersonFileID] [int] IDENTITY(1,1) NOT NULL,
		[FileID] [int] NULL,
		[PersonID] [int] NULL,
		[FileGroupID] [int] NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Person_File] PRIMARY KEY CLUSTERED 
	(
		[PersonFileID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_OccClass]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_OccClass]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_OccClass](
		[OccClassID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_OccClass] PRIMARY KEY CLUSTERED 
	(
		[OccClassID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_EntryType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_EntryType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_EntryType](
		[EntryTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ExpenseFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_EntryType] PRIMARY KEY CLUSTERED 
	(
		[EntryTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_objectType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_objectType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_objectType](
		[objectTypeId] [int] IDENTITY(1,1) NOT NULL,
		[simpleName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[tableName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[primaryKey] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_objectType] PRIMARY KEY CLUSTERED 
	(
		[objectTypeId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Person]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person](
		[PersonID] [int] IDENTITY(1,1) NOT NULL,
		[Prefix] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FirstName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[MiddleName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[LastName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Suffix] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DisplayName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CertName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EthnicityID] [int] NULL,
		[OMBEthnicityID] [int] NULL,
		[Email] [nvarchar](175) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Password] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PrimaryAddressID] [int] NULL,
		[Birthdate] [datetime] NULL,
		[SSN] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Gender] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[StatusID] [int] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DeletedBy] [int] NULL,
	 CONSTRAINT [PK_ce_Person] PRIMARY KEY CLUSTERED 
	(
		[PersonID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person]') AND name = N'Primary Address ID')
	CREATE NONCLUSTERED INDEX [Primary Address ID] ON [ceschema].[ce_Person] 
	(
		[PersonID] ASC
	)
	INCLUDE ( [PrimaryAddressID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");

	announce("Object:  Table [ceschema].[ce_FileGroup]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_FileGroup]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_FileGroup](
		[FileGroupID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Code] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FileGroupTypeID] [int] NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_FileGroup] PRIMARY KEY CLUSTERED 
	(
		[FileGroupID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_page_element]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_page_element]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_page_element](
		[page_info_id] [int] IDENTITY(1,1) NOT NULL,
		[page_id] [int] NOT NULL,
		[page_section_id] [int] NULL,
		[dataService] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[sort] [int] NULL,
		[label] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[field_name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[field_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[field_type] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[field_width] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[field_height] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[field_css] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_page_info] PRIMARY KEY CLUSTERED 
	(
		[page_info_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ac_session]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_session]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_session](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[created] [datetime] NULL,
	 CONSTRAINT [PK_ac_session] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	 CONSTRAINT [IX_ac_session] UNIQUE NONCLUSTERED 
	(
		[name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_AuthorityPage]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AuthorityPage]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AuthorityPage](
		[AuthorityPageID] [int] IDENTITY(1,1) NOT NULL,
		[AuthorityID] [int] NULL,
		[PageID] [int] NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_AuthorityPage] PRIMARY KEY CLUSTERED 
	(
		[AuthorityPageID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  UserDefinedFunction [dbo].[listFind]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[listFind]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[listFind](
	@list VARCHAR(8000),
	@value VARCHAR(255),
	@delimiter VARCHAR(10))
	
	RETURNS int
	
	AS
	BEGIN
	-- 2 declarations
	-- @pos will be the location in the list
	DECLARE @pos int
	-- @item will contain items from the list
	DECLARE @item VARCHAR(255)
	-- set @pos to 0 by default
	SELECT @pos = 0
	
	-- Loop over the commadelimited list
	WHILE (DATALENGTH(@list) > 0)
	BEGIN    
	-- this is the current position of @item in the list
	SELECT @pos = @pos + 1
	-- IF the list length is greater than 1
	IF CHARINDEX(@delimiter,@list) > 0
	BEGIN
		-- item contains the value to compare
	SELECT @item =
	SUBSTRING(@list,1,(CHARINDEX(@delimiter, @list)-1))
		-- remove that particular item from the list
	SELECT @list =
	SUBSTRING(@list,(CHARINDEX(@delimiter, @list) + DATALENGTH(@delimiter)),DATALENGTH(@list))
		  
		   -- if the 2 items are the same return the position
	IF @item = @value
			 RETURN @pos
	END
	
	ELSE
	   -- there is only 1 item in the list (or perhaps a zero length string)
	   -- so we just compare them directly
	BEGIN
			SELECT @item = @list
		   SELECT @list = null
			IF @item = @value
			 return @pos
	END
	
	END
	-- if we get this far the item is not in the list
	SELECT @pos = 0
	   RETURN @pos
	END' 
	END");

	announce("Object:  Table [ceschema].[ce_pageLayout]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_pageLayout]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_pageLayout](
		[layout_id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_pageLayout] PRIMARY KEY CLUSTERED 
	(
		[layout_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_entityrole]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entityrole]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entityrole](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_entityrole] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity_FinFee]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinFee]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_FinFee](
		[FeeID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NOT NULL,
		[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DisplayName] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[StartDate] [datetime] NULL,
		[EndDate] [datetime] NULL,
		[Amount] [float] NOT NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Activity_FinFee] PRIMARY KEY CLUSTERED 
	(
		[FeeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_sys_activityRole]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_sys_activityRole]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_sys_activityRole](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_sys_activityRole] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_entity_relate]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_relate]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity_relate](
		[entity_id] [int] NOT NULL,
		[linked_entity_id] [int] NOT NULL,
	 CONSTRAINT [PK_ce_entity_relate] PRIMARY KEY CLUSTERED 
	(
		[entity_id] ASC,
		[linked_entity_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_PrinEmp]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_PrinEmp]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_PrinEmp](
		[PrinEmpID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Sys_PrinEmp] PRIMARY KEY CLUSTERED 
	(
		[PrinEmpID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_Country]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Country]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Country](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Sys_Country] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Country]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_Sys_Country](
	[name] LANGUAGE [English])
	KEY INDEX [PK_ce_Sys_Country] ON [searchall]
	WITH CHANGE_TRACKING AUTO");

	announce("Object:  Table [ceschema].[ac_object]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_object]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_object](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[locked] [tinyint] NULL,
	 CONSTRAINT [PK_ac_object] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_entity]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity](
		[id] [int] IDENTITY(1921350,1) NOT NULL,
		[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[name_abbrv] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[stub] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[category_id] [int] NOT NULL,
		[sub_category_id] [int] NOT NULL,
		[uuid] [uniqueidentifier] NOT NULL,
		[domain] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[domainalias1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[domainalias2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[parent_entity_id] [int] NOT NULL,
		[stat_users] [int] NOT NULL,
		[is_verified] [tinyint] NOT NULL,
		[primary_image_id] [int] NULL,
		[created] [datetime] NULL,
		[updated] [datetime] NULL,
		[deleted] [datetime] NULL,
		[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_entity] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_entity](
	[domain] LANGUAGE [English], 
	[domainalias1] LANGUAGE [English], 
	[domainalias2] LANGUAGE [English], 
	[name] LANGUAGE [English], 
	[name_abbrv] LANGUAGE [English], 
	[stub] LANGUAGE [English])
	KEY INDEX [PK_ce_entity] ON [searchall]
	WITH CHANGE_TRACKING AUTO");

	announce("Object:  Table [ceschema].[ce_Sys_GroupType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_GroupType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_GroupType](
		[partnerTypeId] [int] IDENTITY(1,1) NOT NULL,
		[title] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[details] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_PartnerType] PRIMARY KEY CLUSTERED 
	(
		[partnerTypeId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ac_tenant]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_tenant]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_tenant](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[tenantkind_id] [int] NOT NULL,
		[address1] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[address2] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[address3] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[city] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[state] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[postalcode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[country] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[phone3] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[fax1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[fax2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[uuid] [uniqueidentifier] NULL,
		[created] [datetime] NULL,
		[createdby] [int] NULL,
		[updated] [datetime] NULL,
		[updatedby] [int] NULL,
		[deleted] [datetime] NULL,
		[deletedflag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[deletedby] [int] NULL,
	 CONSTRAINT [PK_ce_Group] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Activity_Faculty]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Faculty]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Faculty](
		[FacultyID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NULL,
		[PersonID] [int] NULL,
		[CVFileID] [int] NULL,
		[CVApproveFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DisclosureFileID] [int] NULL,
		[DisclosureApproveFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RoleID] [int] NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NULL,
		[Updated] [datetime] NULL,
		[UpdatedBy] [int] NULL,
		[Deleted] [datetime] NULL,
		[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Activity_Faculty] PRIMARY KEY CLUSTERED 
	(
		[FacultyID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[geoname]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[geoname]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[geoname](
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
	 CONSTRAINT [PK_geoname] PRIMARY KEY CLUSTERED 
	(
		[geonameid] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[geoname]'))
	CREATE FULLTEXT INDEX ON [ceschema].[geoname](
	[alternatenames] LANGUAGE [English], 
	[asciiname] LANGUAGE [English], 
	[cc2] LANGUAGE [English], 
	[country_code] LANGUAGE [English], 
	[name] LANGUAGE [English])
	KEY INDEX [PK_geoname] ON [searchall]
	WITH CHANGE_TRACKING AUTO");

	announce("Object:  Table [ceschema].[ce_Sys_Component]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Component]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Component](
		[ComponentID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TypeCode] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SortFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[MaxUsage] [int] NULL,
	 CONSTRAINT [PK_ce_Sys_Component] PRIMARY KEY CLUSTERED 
	(
		[ComponentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[geonameUSA]    Script Date: 05/31/2012 10:19:08");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[geonameUSA]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[geonameUSA](
		[geonameid] [int] NULL,
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
		[modification_date] [datetime] NULL
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Person_Client]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_Client]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_Client](
		[personConnectId] [int] IDENTITY(1,1) NOT NULL,
		[personId] [int] NOT NULL,
		[clientId] [int] NOT NULL,
		[clientToken] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[revokeFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[created] [datetime] NULL,
		[updated] [datetime] NULL,
		[deleted] [datetime] NULL,
		[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Person_Client] PRIMARY KEY CLUSTERED 
	(
		[personConnectId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_Report]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Report]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Report](
		[ReportID] [int] IDENTITY(1,1) NOT NULL,
		[Title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FileName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
		[Updated] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_Report] PRIMARY KEY CLUSTERED 
	(
		[ReportID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Sys_OrgType]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_OrgType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_OrgType](
		[OrgTypeID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
	 CONSTRAINT [PK_ce_Sys_OrgType] PRIMARY KEY CLUSTERED 
	(
		[OrgTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_Action]    Script Date: 05/31/2012 10:19:07");
execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Action]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Action](
		[ActionID] [int] IDENTITY(1,1) NOT NULL,
		[ActivityID] [int] NULL,
		[PersonID] [int] NULL,
		[Code] [nchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ShortName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[LongName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[HiddenFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Created] [datetime] NULL,
		[CreatedBy] [int] NOT NULL,
		[MovedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	 CONSTRAINT [PK_ce_Action] PRIMARY KEY CLUSTERED 
	(
		[ActionID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");

	announce("Object:  Table [ceschema].[ce_entity_entitytype]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");

	execute("SET QUOTED_IDENTIFIER ON");

	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_entitytype]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity_entitytype](
		[entity_id] [int] NOT NULL,
		[entitytype_id] [int] NOT NULL,
	 CONSTRAINT [PK_ce_entity_entitytype] PRIMARY KEY CLUSTERED 
	(
		[entity_id] ASC,
		[entitytype_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>

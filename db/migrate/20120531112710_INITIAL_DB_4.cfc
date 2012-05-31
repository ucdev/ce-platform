<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB 4">
  <cffunction name="up">
    <cfscript>
    
	announce("Object:  Table [ceschema].[ce_sys_stat_log_type]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_sys_stat_log_type]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_sys_stat_log_type](
	[statLogId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
	END");
	
	execute("SET ANSI_PADDING OFF");
	
	announce("Object:  Table [ceschema].[ce_image]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_image]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagetype_id] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[data_key] [int] NULL,
	[caption] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[filename] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[file_ext] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[orig_filename] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created] [datetime] NULL,
	[created_by] [int] NULL,
	CONSTRAINT [PK_ce_image] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_Degree]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Degree]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Degree](
	[DegreeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Abbrev] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sort] [int] NULL,
	[Profession] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_Degree] PRIMARY KEY CLUSTERED 
	(
	[DegreeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Degree]') AND name = N'DegreeId')
	CREATE NONCLUSTERED INDEX [DegreeId] ON [ceschema].[ce_Sys_Degree] 
	(
	[DegreeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_ProcessStep_Activity]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep_Activity]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_ProcessStep_Activity](
	[Step_ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[StepID] [int] NOT NULL,
	[ActivityID] [int] NOT NULL,
	[AssignedToID] [int] NULL,
	[DueDate] [datetime] NULL,
	[StepStatusID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_ProcessStep_Course] PRIMARY KEY CLUSTERED 
	(
	[Step_ActivityID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_EmailStyle]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_EmailStyle]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_EmailStyle](
	[EmailStyleID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TemplateHTML] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TemplatePlain] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_ce_Sys_EmailStyle] PRIMARY KEY CLUSTERED 
	(
	[EmailStyleID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_entity_person]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_person]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_entity_person](
	[entity_person_id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NOT NULL,
	[entity_name] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entity_id] [int] NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[role_id] [int] NULL,
	[is_verified] [int] NOT NULL,
	[created] [datetime] NULL,
	[createdby] [int] NULL,
	CONSTRAINT [PK_ce_user_entity] PRIMARY KEY CLUSTERED 
	(
	[entity_person_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_entity_person]') AND name = N'IX_Person_Entity')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_Person_Entity] ON [ceschema].[ce_entity_person] 
	(
	[person_id] ASC,
	[entity_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_Activity_Vote]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Vote]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Vote](
	[ActivityVoteID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[VoteValue] [float] NOT NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Activity_Vote] PRIMARY KEY CLUSTERED 
	(
	[ActivityVoteID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_Ethnicity]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Ethnicity]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Ethnicity](
	[EthnicityID] [int] NOT NULL,
	[Name] [nvarchar](355) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_Ethnicity] PRIMARY KEY CLUSTERED 
	(
	[EthnicityID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_ActivityStepType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ActivityStepType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_ActivityStepType](
	[StepTypeID] [int] IDENTITY(1,1) NOT NULL,
	[StepName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StepCode] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sort] [int] NULL,
	CONSTRAINT [PK_ce_Sys_ActivityStepType] PRIMARY KEY CLUSTERED 
	(
	[StepTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_ActivityType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ActivityType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_ActivityType](
	[ActivityTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_CourseType] PRIMARY KEY CLUSTERED 
	(
	[ActivityTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_FileType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_FileType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_FileType](
	[FileTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_FileGroupType] PRIMARY KEY CLUSTERED 
	(
	[FileTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Activity_SpecialtyLMS]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_SpecialtyLMS]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_SpecialtyLMS](
	[Activity_LMS_SpecialtyID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_SpecialtyLMS] PRIMARY KEY CLUSTERED 
	(
	[Activity_LMS_SpecialtyID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_ProcessStep]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_ProcessStep](
	[StepID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessID] [int] NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Instructions] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DueDateSetting] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DueDate] [datetime] NULL,
	[BeforeOrAfter] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RelativeDays] [int] NULL,
	[WaitingDays] [int] NULL,
	[NotifyFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sort] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_ProcessStep] PRIMARY KEY CLUSTERED 
	(
	[StepID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_HistoryType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_HistoryType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_HistoryType](
	[HistoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_HistoryType] PRIMARY KEY CLUSTERED 
	(
	[HistoryTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Activity_Category]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Category]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Category](
	[Activity_CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_Category] PRIMARY KEY CLUSTERED 
	(
	[Activity_CategoryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_Grouping]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Grouping]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Grouping](
	[GroupingID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityTypeID] [int] NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Aliases] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_Grouping] PRIMARY KEY CLUSTERED 
	(
	[GroupingID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_History]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_History]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_History](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryStyleID] [int] NOT NULL,
	[HistoryHTML] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FromPersonID] [int] NOT NULL,
	[FromActivityID] [int] NULL,
	[ToPersonID] [int] NULL,
	[ToActivityID] [int] NULL,
	[ToHistoryID] [int] NULL,
	[ToContainerID] [int] NULL,
	[ToContent] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ToCreditID] [int] NULL,
	[ToSiteID] [int] NULL,
	[OldActionID] [int] NULL,
	[Created] [datetime] NULL,
	[HiddenFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
	(
	[HistoryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_ProcessManager]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_ProcessManager]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_ProcessManager](
	[ProcessManagerID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_ProcessManager] PRIMARY KEY CLUSTERED 
	(
	[ProcessManagerID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_CBAFund]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CBAFund]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_CBAFund](
	[CBAFundID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_CBAFund] PRIMARY KEY CLUSTERED 
	(
	[CBAFundID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Credit_Cert]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Credit_Cert]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Credit_Cert](
	[creditCertId] [int] IDENTITY(1,1) NOT NULL,
	[creditId] [int] NOT NULL,
	[certificateId] [int] NOT NULL,
	[created] [datetime] NULL,
	CONSTRAINT [PK_ce_Credit_Cert] PRIMARY KEY CLUSTERED 
	(
	[creditCertId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_StepStatus]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_StepStatus]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_StepStatus](
	[StepStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority] [int] NULL,
	CONSTRAINT [PK_ce_ProcessStepStatus] PRIMARY KEY CLUSTERED 
	(
	[StepStatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Activity_PubGeneral]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_PubGeneral](
	[PubGeneralID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[LinkName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Overview] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Keywords] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Objectives] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Goals] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PublishFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PublishDate] [datetime] NULL,
	[RemoveDate] [datetime] NULL,
	[PaymentFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentFee] [float] NULL,
	[TermsFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TermsText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowFeedback] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowCommentFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommentApproveFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NotifyEmails] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatViews] [int] NULL,
	[StatVoteCount] [float] NULL,
	[StatVoteValue] [float] NULL,
	[FeaturedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[extHostFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[extHostLink] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RestrictedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Updated] [datetime] NULL,
	CONSTRAINT [PK_ce_Activity_PubGeneral] PRIMARY KEY CLUSTERED 
	(
	[PubGeneralID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_SubscriptionType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SubscriptionType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_SubscriptionType](
	[SubscriptionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_SubscriptionType] PRIMARY KEY CLUSTERED 
	(
	[SubscriptionTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Activity_Site]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Site]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Site](
	[ActivitySiteID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_Site] PRIMARY KEY CLUSTERED 
	(
	[ActivitySiteID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Category]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Category]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityCount] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[primary_image_id] [int] NULL,
	CONSTRAINT [PK_ce_Category] PRIMARY KEY CLUSTERED 
	(
	[CategoryID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Category]') AND name = N'Category Name')
	CREATE UNIQUE NONCLUSTERED INDEX [Category Name] ON [ceschema].[ce_Category] 
	(
	[CategoryID] ASC
	)
	INCLUDE ( [Name]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_Category]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_Category](
	[Name] LANGUAGE [English])
	KEY INDEX [PK_ce_Category] ON [searchall]
	WITH CHANGE_TRACKING AUTO");
	
	announce("Object:  Table [ceschema].[ce_objectData]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_objectData]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_objectData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity_id] [int] NOT NULL,
	[objectForm_id] [int] NULL,
	[objecttype_id] [int] NOT NULL,
	[datakey_id] [int] NOT NULL,
	[int1] [int] NULL,
	[int2] [int] NULL,
	[int3] [int] NULL,
	[int4] [int] NULL,
	[int5] [int] NULL,
	[string1] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[string2] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[string3] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[string4] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[string5] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stringBig1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stringBig2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stringBig3] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stringBig4] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stringBig5] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dateTime1] [datetime] NULL,
	[dateTime2] [datetime] NULL,
	[dateTime3] [datetime] NULL,
	[dateTime4] [datetime] NULL,
	[dateTime5] [datetime] NULL,
	[created] [datetime] NULL,
	[createdBy] [int] NULL,
	[updated] [datetime] NULL,
	[updatedBy] [int] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_objectData] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_TestType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_TestType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_TestType](
	[TestTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_TestType] PRIMARY KEY CLUSTERED 
	(
	[TestTypeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Tally]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Tally]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Tally](
	[N] [int] IDENTITY(1,1) NOT NULL,
	CONSTRAINT [PK_Tally_N] PRIMARY KEY CLUSTERED 
	(
	[N] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[pd_personinfoforcme]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[pd_personinfoforcme]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[pd_personinfoforcme](
	[personid] [int] NOT NULL,
	[lastname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[firstname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[middlename] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[birthdate] [datetime] NULL,
	[Email] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressPrimaryFlay] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[country] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[streetline1] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[streetline2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[province] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[postalcode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pd_person_education_endyear] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pd_person_education_highestdegreeflag] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pd_person_education_InstitutionName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EducationActiveflag] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Educationdegreeflag] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EducationName] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Educationdescription] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EducationAAMCNumericCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EducationDegreeLevelFlag] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
	END");
	
	execute("SET ANSI_PADDING OFF");
	
	announce("Object:  Table [ceschema].[ce_Cert_Credit]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Cert_Credit]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Cert_Credit](
	[certCreditId] [int] IDENTITY(1,1) NOT NULL,
	[certId] [int] NOT NULL,
	[creditId] [int] NOT NULL,
	[created] [datetime] NULL,
	CONSTRAINT [PK_ce_Cert_Credit] PRIMARY KEY CLUSTERED 
	(
	[certCreditId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_object]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_object]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_object](
	[object_id] [int] NOT NULL,
	[object_table] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[uuid] [uniqueidentifier] NULL,
	[name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[subtext1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subtext2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[searchText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[objectType_id] [int] NULL,
	[image_id] [int] NULL,
	[path] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[refreshed] [datetime] NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[index_id] [int] IDENTITY(1,1) NOT NULL,
	CONSTRAINT [PK_ce_object_1] PRIMARY KEY CLUSTERED 
	(
	[object_id] ASC,
	[object_table] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_object]') AND name = N'IX_ce_object')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_ce_object] ON [ceschema].[ce_object] 
	(
	[index_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_object]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_object](
	[searchText] LANGUAGE [English])
	KEY INDEX [IX_ce_object] ON [searchall]
	WITH CHANGE_TRACKING AUTO");
	
	announce("Object:  Table [ceschema].[schemainfo]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[schemainfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[schemainfo](
	[version] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
	END");
	
	execute("SET ANSI_PADDING OFF");
	
	announce("Object:  Table [ceschema].[ce_Process]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Process]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Process](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HiddenFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Process] PRIMARY KEY CLUSTERED 
	(
	[ProcessID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_SiteLMS]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SiteLMS]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_SiteLMS](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NameShort] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DomainName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContactName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactPhone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_SiteLMS] PRIMARY KEY CLUSTERED 
	(
	[SiteID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[temp_STDInfo]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[temp_STDInfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[temp_STDInfo](
	[CourseID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Part] [int] NULL,
	[CrsDate] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StuId] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sex] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[amind] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[asian] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[black] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[white] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pacific] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hispanic] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[occClass] [int] NULL,
	[ProfC] [int] NULL,
	[ProfCSp] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FunRC] [int] NULL,
	[FunRCSp] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfN] [int] NULL,
	[ProfNSp] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FunRN] [int] NULL,
	[FunRNSp] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkSt] [int] NULL,
	[WorkZip] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrgType] [int] NULL,
	[Tspecify] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOFund] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOCDC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOOth] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBAFund] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBACDC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBAOth] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSTD] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocHIV] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocWRH] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocGen] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocAdol] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocMH] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSub] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocEm] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocCor] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocOth] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSpec] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopGen] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAdol] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopGLB] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopTran] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrpHome] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopCorr] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopPreg] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopSW] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAA] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAs] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopNH] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAIAN] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopHisp] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopImm] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopIDU] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopSub] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopHIV] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopOth] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopSpec] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Market] [int] NULL,
	[Mspecify] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_AttendeeInfo]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_AttendeeInfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_AttendeeInfo](
	[personid] [int] NULL,
	[PhysicianTypeID] [int] NULL,
	[MealtypeID] [int] NULL,
	[Notes] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BadgeText] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstitutionAff] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BreakSessions] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MailingHome] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainingCenterID] [int] NULL,
	[AttendeeId] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[CountyId] [int] NULL,
	[Inactive] [int] NULL,
	[MedicalLicense] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STDPrinOcc] [int] NULL,
	[STDOrgType] [int] NULL,
	[STDPercentage] [int] NULL,
	[STDPrinOccOther] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STDOrgTypeOther] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CourseMarketId] [int] NULL,
	[OtherSource] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_AssessTmpl]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessTmpl]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AssessTmpl](
	[AssessTmplID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssessmentID] [int] NOT NULL,
	[AssessTypeID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Assess_Tmpl] PRIMARY KEY CLUSTERED 
	(
	[AssessTmplID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_CBAFundCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_CBAFundCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_CBAFundCode](
	[CBAFundId] [int] NULL,
	[Description] [nvarchar](55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_CBOFundCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_CBOFundCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_CBOFundCode](
	[CBOFundId] [int] NULL,
	[Description] [nvarchar](55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_HistoryStyle]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_HistoryStyle]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_HistoryStyle](
	[HistoryStyleID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryTypeID] [int] NULL,
	[Title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TemplateFrom] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TemplateTo] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PossessiveFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IconImg] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldTitles] [nvarchar](2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_History] PRIMARY KEY CLUSTERED 
	(
	[HistoryStyleID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Group]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Group]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Group](
	[groupId] [int] IDENTITY(10005,1952) NOT NULL,
	[groupTypeId] [int] NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[domain] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[clientGUID] [uniqueidentifier] NULL,
	[accreditedFlag] [bit] NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Client] PRIMARY KEY CLUSTERED 
	(
	[groupId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_CourseInfo]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_CourseInfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_CourseInfo](
	[CourseID] [int] NULL,
	[RequiredStaffing] [int] NULL,
	[IsGrandRounds] [int] NULL,
	[CertificateExtraInfo] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsExternalCourse] [int] NULL,
	[CommSuppFlag] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommSuppTotal] [float] NULL,
	[RegFeeTotal] [float] NULL,
	[ExhibitFeeTotal] [float] NULL,
	[FederalGrantTotal] [float] NULL,
	[InkindTotal] [float] NULL,
	[OtherFeeTotal] [float] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_CourseMarket]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_CourseMarket]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_CourseMarket](
	[CourseMarketId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastUpdate] [datetime] NULL
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Account]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Account]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[UserID] [int] NULL,
	[AuthorityID] [int] NULL,
	[supervisors] [int] NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Account] PRIMARY KEY CLUSTERED 
	(
	[AccountID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_CourseSectionInfo]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_CourseSectionInfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_CourseSectionInfo](
	[CourseSectionID] [int] NULL,
	[SponsoringDept] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CoSponsor] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsConfirmed] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainingCenterID] [int] NULL,
	[DidHrs] [decimal](5, 2) NULL,
	[PracHrs] [decimal](5, 2) NULL,
	[ClinSit2] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CollPTC] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cspecify] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CollOth] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CoSpecif] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsWebReg] [int] NULL,
	[EventTypeId] [int] NULL
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_FunRCCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_FunRCCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_FunRCCode](
	[FunRCId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_FunRCCode] PRIMARY KEY CLUSTERED 
	(
	[FunRCId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_FunRNCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_FunRNCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_FunRNCode](
	[FunRNId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_FunRNCode] PRIMARY KEY CLUSTERED 
	(
	[FunRNId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Activity_PubComponent]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubComponent]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_PubComponent](
	[PubComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[ActivityID] [int] NOT NULL,
	[Sort] [int] NULL,
	[DisplayName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalURL] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssessmentID] [int] NULL,
	[FileID] [int] NULL,
	[RequiredFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_PubComponent] PRIMARY KEY CLUSTERED 
	(
	[PubComponentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'ceschema', N'TABLE',N'ce_Activity_PubComponent', N'COLUMN',N'ExternalURL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Swap the value of this field for External URLs, etc.' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'TABLE',@level1name=N'ce_Activity_PubComponent', @level2type=N'COLUMN',@level2name=N'ExternalURL'");
	
	announce("Object:  Table [ceschema].[ce_professionArea]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_professionArea]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_professionArea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parent_id] [int] NOT NULL,
	CONSTRAINT [PK_ce_professionArea] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_MarketCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_MarketCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_MarketCode](
	[MarketId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_MarketCode] PRIMARY KEY CLUSTERED 
	(
	[MarketId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_Credit]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Credit]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Credit](
	[CreditID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
	[Code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferenceFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Statement] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Credit] PRIMARY KEY CLUSTERED 
	(
	[CreditID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_pageLayoutMenu]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_pageLayoutMenu]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_pageLayoutMenu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[layout_id] [int] NOT NULL,
	[position] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT [PK_ce_pageLayoutMenu] PRIMARY KEY CLUSTERED 
	(
	[menu_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_cdcSTDInfo]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_cdcSTDInfo]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_cdcSTDInfo](
	[cdcSTDInfoId] [int] IDENTITY(1,1) NOT NULL,
	[Registrationid] [int] NULL,
	[CBAFundId] [int] NULL,
	[CBACDC] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBAOth] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOFundId] [int] NULL,
	[CBOCDC] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBOOth] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FunRCId] [int] NULL,
	[FunRCSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FunRNId] [int] NULL,
	[FunRNSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MarketId] [int] NULL,
	[Mspecify] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OccClassId] [int] NULL,
	[OrgTypeId] [int] NULL,
	[Tspecify] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfCId] [int] NULL,
	[ProfCSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfNId] [int] NULL,
	[ProfNSp] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkState] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkZip] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSTD] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocHIV] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocWRH] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocGen] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocAdol] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocMH] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSub] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocEm] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocCor] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocOth] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FocSpec] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopGen] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAdol] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopGLB] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopTran] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopHome] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopCorr] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopPreg] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopSW] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAA] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAs] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopNH] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopAIAN] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopHisp] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopImm] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopIDU] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopSub] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopHIV] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopOth] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PopSpec] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Update] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Eval] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainingAlert] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
	[CurrentlyEnrolled] [bit] NULL,
	[RelevantTraining] [bit] NULL,
	[MotivationTraining] [bit] NULL,
	CONSTRAINT [PK_xLegacy_cm_cdcSTDInfo] PRIMARY KEY CLUSTERED 
	(
	[cdcSTDInfoId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ac_role_permission]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ac_role_permission]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ac_role_permission](
	[role_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
	CONSTRAINT [PK_ac_role_permission] PRIMARY KEY CLUSTERED 
	(
	[role_id] ASC,
	[permission_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'ceschema', N'TABLE',N'ac_role_permission', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Binds Zone Priviledges to Zones' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'TABLE',@level1name=N'ac_role_permission'");
	
	announce("Object:  Table [ceschema].[ce_objectField]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_objectField]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_objectField](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[objectForm_id] [int] NOT NULL,
	[objectType_id] [int] NOT NULL,
	[fieldIndex] [int] NOT NULL,
	[fieldType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[columnLabel] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[displayLabel] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[displayShortLabel] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created] [datetime] NULL,
	[createdBy] [int] NULL,
	CONSTRAINT [PK_ce_objectField] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'ceschema', N'TABLE',N'ce_objectField', N'COLUMN',N'columnLabel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'shouldn''t have any spaces (like a data column)' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'TABLE',@level1name=N'ce_objectField', @level2type=N'COLUMN',@level2name=N'columnLabel'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'ceschema', N'TABLE',N'ce_objectField', N'COLUMN',N'displayLabel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'used for web forms and interfaces' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'TABLE',@level1name=N'ce_objectField', @level2type=N'COLUMN',@level2name=N'displayLabel'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'ceschema', N'TABLE',N'ce_objectField', N'COLUMN',N'displayShortLabel'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'used for shorter purposes (it can have spaces)' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'TABLE',@level1name=N'ce_objectField', @level2type=N'COLUMN',@level2name=N'displayShortLabel'");
	
	announce("Object:  Table [ceschema].[ce_Sys_PersonStatus]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_PersonStatus]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_PersonStatus](
	[PersonStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_PersonStatus] PRIMARY KEY CLUSTERED 
	(
	[PersonStatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_CBOFund]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CBOFund]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_CBOFund](
	[CBOFundID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_CBOFund] PRIMARY KEY CLUSTERED 
	(
	[CBOFundID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_Role]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Role]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_Role] PRIMARY KEY CLUSTERED 
	(
	[RoleID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_AssessResultStatus]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessResultStatus]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_AssessResultStatus](
	[ResultStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_ResultStatus] PRIMARY KEY CLUSTERED 
	(
	[ResultStatusID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_activity_step]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_step]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_activity_step](
	[activityStepId] [int] IDENTITY(1,1) NOT NULL,
	[activityId] [int] NOT NULL,
	[stepId] [int] NOT NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Activity_Step] PRIMARY KEY CLUSTERED 
	(
	[activityStepId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Sys_SpecialtyLMS]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SpecialtyLMS]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_SpecialtyLMS](
	[SpecialtyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_specialty_id] [int] NULL,
	[primary_image_id] [int] NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_SpecialtyLMS] PRIMARY KEY CLUSTERED 
	(
	[SpecialtyID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SpecialtyLMS]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_Sys_SpecialtyLMS](
	[Description] LANGUAGE [English], 
	[Name] LANGUAGE [English])
	KEY INDEX [PK_ce_Sys_SpecialtyLMS] ON [searchall]
	WITH CHANGE_TRACKING AUTO");
	
	announce("Object:  Table [ceschema].[ce_Cert]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Cert]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Cert](
	[certId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[details] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[template] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created] [datetime] NULL,
	[createdBy] [int] NULL,
	[updated] [datetime] NULL,
	[updatedBy] [int] NULL,
	[deleted] [datetime] NULL,
	[deletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[deletedBy] [int] NULL,
	CONSTRAINT [PK_ce_Cert] PRIMARY KEY CLUSTERED 
	(
	[certId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_location]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_location]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_location](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[locationType_id] [int] NOT NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NULL,
	CONSTRAINT [PK_ce_location] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_OccClassCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_OccClassCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_OccClassCode](
	[OccClassId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_OccClassCode] PRIMARY KEY CLUSTERED 
	(
	[OccClassId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_activity_tags]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_tags]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_activity_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[tagcount] [int] NOT NULL,
	[hideflag] [tinyint] NULL,
	CONSTRAINT [PK_ce_activity_tag] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_tags]') AND name = N'IX_TagName')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_TagName] ON [ceschema].[ce_activity_tags] 
	(
	[name] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_Sys_FunRC]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_FunRC]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_FunRC](
	[FunRCID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	CONSTRAINT [PK_ce_Sys_FunRC] PRIMARY KEY CLUSTERED 
	(
	[FunRCID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_OrgTypeCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_OrgTypeCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_OrgTypeCode](
	[OrgTypeId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_OrgTypeCode] PRIMARY KEY CLUSTERED 
	(
	[OrgTypeId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_GroupType]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_GroupType]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_GroupType](
	[group_TypeId] [int] IDENTITY(1,1) NOT NULL,
	[groupId] [int] NOT NULL,
	[groupTypeId] [int] NOT NULL,
	[sort] [int] NULL,
	[created] [datetime] NULL,
	CONSTRAINT [PK_ce_Partner_Type] PRIMARY KEY CLUSTERED 
	(
	[group_TypeId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_activity_tag_relates]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_tag_relates]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_activity_tag_relates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[activityid] [int] NOT NULL,
	[tagid] [int] NOT NULL,
	CONSTRAINT [PK_ce_activity_tag_relates] PRIMARY KEY CLUSTERED 
	(
	[id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_activity_tag_relates]') AND name = N'IX_activitytag')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_activitytag] ON [ceschema].[ce_activity_tag_relates] 
	(
	[activityid] ASC,
	[tagid] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_File]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_File]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_File](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FileCaption] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FileSize] [float] NULL,
	[FileTypeID] [int] NULL,
	[PersonID] [int] NULL,
	[ActivityID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_File] PRIMARY KEY CLUSTERED 
	(
	[FileID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_ProfCCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_ProfCCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_ProfCCode](
	[ProfCId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_ProfCCode] PRIMARY KEY CLUSTERED 
	(
	[ProfCId] ASC
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

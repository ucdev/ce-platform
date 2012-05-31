<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB 5">
  <cffunction name="up">
    <cfscript>
    
	announce("Object:  Table [ceschema].[ce_Activity_Committee]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Committee]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Committee](
	[CommitteeID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NULL,
	[PersonID] [int] NULL,
	[RoleID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_CourseCommittee] PRIMARY KEY CLUSTERED 
	(
	[CommitteeID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_Person_SpecialtyLMS]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Person_SpecialtyLMS]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Person_SpecialtyLMS](
	[PersonSpecialtyID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Person_SpecialtyLMS] PRIMARY KEY CLUSTERED 
	(
	[PersonSpecialtyID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[xLegacy_cm_ProfNCode]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[xLegacy_cm_ProfNCode]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[xLegacy_cm_ProfNCode](
	[ProfNId] [int] NOT NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationDate] [datetime] NULL,
	CONSTRAINT [PK_xLegacy_cm_ProfNCode] PRIMARY KEY CLUSTERED 
	(
	[ProfNId] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_page]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_page]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_page](
	[page_id] [int] IDENTITY(1,1) NOT NULL,
	[parent_page_id] [int] NULL,
	[unique_name] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[linkTitle] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stub] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[event] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fileName] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[icon] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[objectForm_id] [int] NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Page] PRIMARY KEY CLUSTERED 
	(
	[page_id] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_page]') AND name = N'IX_ce_page_event')
	CREATE UNIQUE NONCLUSTERED INDEX [IX_ce_page_event] ON [ceschema].[ce_page] 
	(
	[event] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_Sys_State]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Sys_State]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Sys_State](
	[stateid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[code] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APAbbrv] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_Sys_State] PRIMARY KEY CLUSTERED 
	(
	[stateid] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("SET ANSI_PADDING OFF");
	
	execute("IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[ceschema].[ce_Sys_State]'))
	CREATE FULLTEXT INDEX ON [ceschema].[ce_Sys_State](
	[name] LANGUAGE [English])
	KEY INDEX [PK_ce_Sys_State] ON [searchall]
	WITH CHANGE_TRACKING AUTO");
	
	announce("Object:  Table [ceschema].[ce_Assessment]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Assessment](
	[AssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[AssessTypeID] [int] NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PassingScore] [float] NULL,
	[MaxAttempts] [int] NULL,
	[RequiredFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RandomFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommentFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sort] [int] NULL,
	[ActivityID] [int] NULL,
	[ExternalID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedBy] [int] NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_cp_CourseTest] PRIMARY KEY CLUSTERED 
	(
	[AssessmentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]') AND name = N'IX_Activity')
	CREATE NONCLUSTERED INDEX [IX_Activity] ON [ceschema].[ce_Assessment] 
	(
	[ActivityID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_AssessAnswer]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AssessAnswer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[ResultID] [int] NULL,
	[AssessmentID] [int] NULL,
	[QuestionID] [int] NULL,
	[I1] [int] NULL,
	[I2] [int] NULL,
	[VC1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VC2] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DT1] [datetime] NULL,
	[DT2] [datetime] NULL,
	[TXT1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TXT2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CorrectFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[updatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_cp_PersonTestAnswer] PRIMARY KEY NONCLUSTERED 
	(
	[AnswerID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]') AND name = N'MyClusteredIndex')
	CREATE CLUSTERED INDEX [MyClusteredIndex] ON [ceschema].[ce_AssessAnswer] 
	(
	[QuestionID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]') AND name = N'IX_AssessId')
	CREATE NONCLUSTERED INDEX [IX_AssessId] ON [ceschema].[ce_AssessAnswer] 
	(
	[AssessmentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]') AND name = N'IX_ResultID')
	CREATE NONCLUSTERED INDEX [IX_ResultID] ON [ceschema].[ce_AssessAnswer] 
	(
	[ResultID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_AssessSection]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessSection]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AssessSection](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentSectionID] [int] NULL,
	[AssessmentID] [int] NULL,
	[Sort] [int] NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_TestSection] PRIMARY KEY CLUSTERED 
	(
	[SectionID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  Table [ceschema].[ce_AssessResult]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AssessResult](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[AssessmentID] [int] NULL,
	[ResultStatusID] [int] NULL,
	[Score] [float] NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_TestResult] PRIMARY KEY CLUSTERED 
	(
	[ResultID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]') AND name = N'IX_AssessID')
	CREATE NONCLUSTERED INDEX [IX_AssessID] ON [ceschema].[ce_AssessResult] 
	(
	[AssessmentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]') AND name = N'IX_Person')
	CREATE NONCLUSTERED INDEX [IX_Person] ON [ceschema].[ce_AssessResult] 
	(
	[PersonID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_AssessQuestion]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_AssessQuestion](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionTypeID] [int] NOT NULL,
	[AssessmentID] [int] NOT NULL,
	[LabelText] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DetailText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequiredFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CorrectField] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SectionID] [int] NULL,
	[Sort] [int] NULL,
	[i1] [int] NULL,
	[i2] [int] NULL,
	[i3] [int] NULL,
	[i4] [int] NULL,
	[i5] [int] NULL,
	[i6] [int] NULL,
	[i7] [int] NULL,
	[i8] [int] NULL,
	[i9] [int] NULL,
	[i10] [int] NULL,
	[vc1] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc2] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc3] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc4] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc5] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc6] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc7] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc8] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc9] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vc10] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dt1] [datetime] NULL,
	[dt2] [datetime] NULL,
	[dt3] [datetime] NULL,
	[dt4] [datetime] NULL,
	[dt5] [datetime] NULL,
	[txt1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[txt2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[txt3] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[txt4] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[txt5] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_TestQuestion] PRIMARY KEY CLUSTERED 
	(
	[QuestionID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]') AND name = N'IX_AssessId')
	CREATE NONCLUSTERED INDEX [IX_AssessId] ON [ceschema].[ce_AssessQuestion] 
	(
	[AssessmentID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	announce("Object:  Table [ceschema].[ce_Activity_Credit]    Script Date: 05/31/2012 10:19:07");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Credit]') AND type in (N'U'))
	BEGIN
	CREATE TABLE [ceschema].[ce_Activity_Credit](
	[Activity_CreditID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[CreditID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[ReferenceNo] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedFlag] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT [PK_ce_CourseCredit] PRIMARY KEY CLUSTERED 
	(
	[Activity_CreditID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END");
	
	announce("Object:  View [dbo].[View_ACCME_Data]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_ACCME_Data]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[View_ACCME_Data]
	AS
	SELECT     ATT.PersonID, CASE att.PersonId WHEN 0 THEN CASE att.mdFlag WHEN ''Y'' THEN ''MD'' ELSE NULL END ELSE
					  (SELECT     TOP 1 sd.name
						FROM          ceschema.ce_Person_Degree AS pd INNER JOIN
											   ceschema.ce_sys_degree AS sd ON sd.degreeId = pd.degreeId
						WHERE      pd.persoNId = att.personId) END AS degree, CASE att.PersonId WHEN 0 THEN att.stateProvince ELSE
					  (SELECT     pa.state
						FROM          ceschema.ce_person AS p LEFT JOIN
											   ceschema.ce_person_address AS pa ON pa.addressId = p.primaryAddressId
						WHERE      pa.personId = att.personId) END AS stateCode, ATT.CompleteDate, a.StartDate, a.EndDate, ATT.ActivityID
	FROM         ceschema.ce_Activity AS a INNER JOIN
				  ceschema.ce_Attendee AS ATT ON ATT.ActivityID = a.ActivityID
	WHERE     (a.ActivityTypeID <> 2) AND (a.DeletedFlag = ''N'') AND (a.StatusID IN (1, 2, 3)) AND (ATT.DeletedFlag = ''N'') OR
				  (a.ActivityTypeID <> 2) AND (a.DeletedFlag = ''N'') AND (a.StatusID IN (1, 2, 3)) AND (ATT.DeletedFlag = ''N'') OR
				  (a.ActivityTypeID <> 2) AND (a.DeletedFlag = ''N'') AND (a.StatusID IN (1, 2, 3)) AND (ATT.DeletedFlag = ''N'') AND (a.ActivityID IN
					  (SELECT     actcat.ActivityID
						FROM          ceschema.ce_Activity_Category AS actcat INNER JOIN
											   ceschema.ce_Category AS cat ON actcat.CategoryID = cat.CategoryID
						WHERE      (cat.Name LIKE ''ACCME 2008'') AND (actcat.DeletedFlag = ''N''))) OR
				  (a.ActivityTypeID = 2) AND (a.DeletedFlag = ''N'') AND (a.StatusID IN (1, 2, 3)) AND (ATT.DeletedFlag = ''N'') AND
					  ((SELECT     COUNT(AttendeeID) AS Expr1
						  FROM         ceschema.ce_Attendee AS Att
						  WHERE     (ActivityID = a.ActivityID)) > 0) AND
					  ((SELECT     COUNT(Activity_CreditID) AS Expr1
						  FROM         ceschema.ce_Activity_Credit AS ACr
						  WHERE     (ActivityID = a.ActivityID) AND (CreditID = 1) AND (DeletedFlag = ''N'')) > 0) OR
				  (a.ActivityTypeID = 2) AND (a.DeletedFlag = ''N'') AND (a.StatusID IN (1, 2, 3)) AND (ATT.DeletedFlag = ''N'') AND
					  ((SELECT     COUNT(AttendeeID) AS Expr1
						  FROM         ceschema.ce_Attendee AS Att
						  WHERE     (ActivityID = a.ActivityID)) > 0) AND
					  ((SELECT     COUNT(Activity_CreditID) AS Expr1
						  FROM         ceschema.ce_Activity_Credit AS ACr
						  WHERE     (ActivityID = a.ActivityID) AND (CreditID = 1) AND (DeletedFlag = ''N'')) > 0) OR
				  (a.ActivityTypeID = 2) AND (a.DeletedFlag = ''N'') AND (a.StatusID IN (1, 2, 3)) AND (ATT.DeletedFlag = ''N'') AND (a.ActivityID IN
					  (SELECT     actcat.ActivityID
						FROM          ceschema.ce_Activity_Category AS actcat INNER JOIN
											   ceschema.ce_Category AS cat ON actcat.CategoryID = cat.CategoryID
						WHERE      (cat.Name LIKE ''ACCME 2008'') AND (actcat.DeletedFlag = ''N'')))
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'View_ACCME_Data', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[30] 4[23] 2[13] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1[50] 2[25] 3) )''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4[30] 2[40] 3) )''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2[66] 3) )''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 2
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''a''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 430
		   Right = 213
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ATT''
		Begin Extent = 
		   Top = 6
		   Left = 251
		   Bottom = 490
		   Right = 410
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ''''
	End
	Begin ColumnWidths = 9
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	PaneHidden = 
	Begin ColumnWidths = 14
	 Column = 4740
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ACCME_Data'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'View_ACCME_Data', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ACCME_Data'");
	
	announce("Object:  View [ceschema].[View_Activities]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_Activities]'))
	EXEC dbo.sp_executesql @statement = N'
	CREATE VIEW [ceschema].[View_Activities]
	WITH SCHEMABINDING 
	AS
	SELECT     
	C.ActivityID, 
	C.Title, 
	C.Description, 
	C.StartDate, 
	C.ActivityTypeID, 
	T.Name AS ActivityType, 
	C.GroupingID, 
	C.SessionType,
	G.Name AS Grouping, 
	SearchAll = 
	C.Title + '' '' + 
	ISNULL(G.Name, '''') + '' '' +
	ISNULL(G.Aliases, '''') + '' '' +
	ISNULL(T.Name, '''') + '' '' +
	ISNULL(C.Description, '''') + ''  '' + 
	ISNULL(CONVERT(char(10), C.StartDate, 101),'''') + ''  '' + 
	ISNULL(LEFT(CONVERT(char(50), C.StartDate, 121),4),'''') + ''  '' + 
	ISNULL(SUBSTRING(CONVERT(char(50), C.StartDate, 121),6,2),'''') + ''  ''
	FROM         
	ceschema.ce_Activity AS C 
	INNER JOIN
	ceschema.ce_Sys_Grouping AS G ON C.GroupingID = G.GroupingID 
	INNER JOIN
	ceschema.ce_Sys_ActivityType AS T ON C.ActivityTypeID = T.ActivityTypeID
	WHERE     
	(0 = 0) AND 
	(C.DeletedFlag = ''N'')
	
	
	
	
	'");
	
	execute("SET ARITHABORT ON");
	
	execute("SET CONCAT_NULL_YIELDS_NULL ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_NULLS ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("SET ANSI_WARNINGS ON");
	
	execute("SET NUMERIC_ROUNDABORT OFF");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[View_Activities]') AND name = N'IX_ActivityID')
	CREATE UNIQUE CLUSTERED INDEX [IX_ActivityID] ON [ceschema].[View_Activities] 
	(
	[ActivityID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_Activities', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[41] 4[20] 2[14] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''C''
		Begin Extent = 
		   Top = 6
		   Left = 236
		   Bottom = 237
		   Right = 420
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''G''
		Begin Extent = 
		   Top = 135
		   Left = 524
		   Bottom = 243
		   Right = 675
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''T''
		Begin Extent = 
		   Top = 19
		   Left = 766
		   Bottom = 127
		   Right = 917
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	Begin ColumnWidths = 11
	 Width = 284
	 Width = 1500
	 Width = 1905
	 Width = 2025
	 Width = 2340
	 Width = 1500
	 Width = 1500
	 Width = 983040
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 9
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_Activities'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_Activities', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_Activities'");
	
	announce("Object:  View [ceschema].[View_People]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_People]'))
	EXEC dbo.sp_executesql @statement = N'
	CREATE VIEW [ceschema].[View_People]
	WITH SCHEMABINDING 
	AS
	SELECT     
	PersonID, 
	Prefix, 
	FirstName, 
	MiddleName, 
	LastName, 
	Suffix, 
	DisplayName, 
	CertName, 
	Email, 
	Birthdate, 
	SSN,
	searchAll = '''' +
	isNull(Prefix,'''') + '' '' +
	isNull(FirstName,'''') + '' '' +
	isNull(MiddleName,'''') + '' '' +
	isNull(LastName,'''') + '' '' +
	isNull(FirstName,'''') + '' '' +
	isNull(LastName,'''') + '' '' +
	isNull(Suffix,'''') + '' '' +
	isNull(DisplayName,'''') + '' '' +
	isNull(CertName,'''') + '' '' +
	isNull(Email,'''') + '' '' +
	isNull(CONVERT(char(10), Birthdate, 101),'''') + ''  '' + 
	isNull(LEFT(CONVERT(char(50), Birthdate, 121),4),'''') + ''  '' + 
	isNull(SUBSTRING(CONVERT(char(50), Birthdate, 121),6,2),'''') + ''  '' +
	isNull(SSN,'''')
	FROM         ceschema.ce_Person
	
	'");
	
	execute("SET ARITHABORT ON");
	
	execute("SET CONCAT_NULL_YIELDS_NULL ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_NULLS ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("SET ANSI_WARNINGS ON");
	
	execute("SET NUMERIC_ROUNDABORT OFF");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[View_People]') AND name = N'IX_PersonID')
	CREATE UNIQUE CLUSTERED INDEX [IX_PersonID] ON [ceschema].[View_People] 
	(
	[PersonID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_People', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[40] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''ce_Person (ceschema)''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 318
		   Right = 337
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ''''
	End
	Begin ColumnWidths = 9
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_People'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_People', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_People'");
	
	announce("Object:  View [ceschema].[View_PersonEmailHosts]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_PersonEmailHosts]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_PersonEmailHosts]
	AS
	SELECT     RIGHT(Email, CHARINDEX(''@'', REVERSE(Email), 0) - 1) AS EmailHost, Email
	FROM         ceschema.ce_Person
	WHERE     (CHARINDEX('' '', LTRIM(RTRIM(Email))) = 0) AND (LEFT(LTRIM(Email), 1) <> ''@'') AND (RIGHT(RTRIM(Email), 1) <> ''.'') AND (CHARINDEX(''.'', Email, CHARINDEX(''@'', 
				  Email)) - CHARINDEX(''@'', Email) > 1) AND (LEN(LTRIM(RTRIM(Email))) - LEN(REPLACE(LTRIM(RTRIM(Email)), ''@'', '''')) = 1) AND (CHARINDEX(''.'', 
				  REVERSE(LTRIM(RTRIM(Email)))) >= 3) AND (CHARINDEX(''.@'', Email) = 0) AND (CHARINDEX(''..'', Email) = 0)
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PersonEmailHosts', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[27] 4[34] 2[15] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''ce_Person (ceschema)''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 213
		   Right = 204
		End
		DisplayFlags = 280
		TopColumn = 2
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ''''
	End
	Begin ColumnWidths = 9
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PersonEmailHosts'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PersonEmailHosts', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PersonEmailHosts'");
	
	announce("Object:  View [ceschema].[View_History]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_History]'))
	EXEC dbo.sp_executesql @statement = N'
	CREATE VIEW [ceschema].[View_History]
	AS
	SELECT     
	TOP (100) PERCENT 
	H.HistoryID, 
	H.HistoryStyleID, 
	S.HistoryTypeID, 
	H.FromPersonID, 
	FromU.DisplayName AS FromPersonDisplayName, 
	H.ToPersonID, 
	ToU.DisplayName AS ToPersonDisplayName, 
	ToPossessive = (CASE 
					ToU.Gender 
					WHEN ''M'' THEN 
						''his'' 
					WHEN ''F'' THEN 
						''her'' 
					WHEN NULL THEN 
						''their'' 
				END), 
	FromPossessive = (CASE FromU.Gender WHEN ''M'' THEN ''his'' WHEN ''F'' THEN ''her'' WHEN NULL THEN ''their'' END), 
	FromReflexive = (CASE FromU.Gender WHEN ''M'' THEN ''himself'' WHEN ''F'' THEN ''herself'' WHEN NULL THEN ''theirself'' END), 
	H.ToActivityID, H.FromActivityID, 
	ToA.Title AS ToActivityTitle, 
	H.ToHistoryID, 
	H.ToContainerID, 
	ceschema.ce_Category.CategoryID, 
	H.ToCreditID,
	ToCreditName = ToCredit.creditName,
	ToCreditAmount = ToCredit.creditAmount,
	H.ToSiteID, 
	ToSiteName = ToSite.Name, 
	ToSiteNameShort = ToSite.NameShort, 
	ToSiteHostName = ToSite.DomainName, 
	H.ToContent, 
	H.Created, 
	H.HiddenFlag, 
	S.TemplateFrom, 
	S.TemplateTo, 
	S.IconImg, 
	ToActivityDate = ToA.StartDate
	FROM         
	ceschema.ce_History AS H 
	INNER JOIN
	ceschema.ce_Sys_HistoryStyle AS S ON H.HistoryStyleID = S.HistoryStyleID 
	LEFT OUTER JOIN
	ceschema.ce_Sys_SiteLMS AS ToSite ON H.ToSiteID = ToSite.SiteID 
	LEFT OUTER JOIN
	ceschema.ce_Category ON H.ToContainerID = ceschema.ce_Category.CategoryID 
	LEFT OUTER JOIN
	ceschema.ce_History AS ToHistory ON H.ToHistoryID = ToHistory.HistoryID 
	LEFT OUTER JOIN
	ceschema.ce_Activity AS ToA ON H.ToActivityID = ToA.ActivityID 
	LEFT OUTER JOIN
	(
	SELECT 
	actCred.activityId,
	actCred.CreditID, 
	cred.Name AS CreditName, 
	actCred.Amount AS CreditAmount
	FROM         
	ceschema.ce_Activity_Credit AS actCred 
	INNER JOIN
	ceschema.ce_Sys_Credit AS cred ON actCred.CreditID = cred.CreditID
	) As ToCredit ON ToCredit.activityId = H.ToActivityID
	LEFT OUTER JOIN
	ceschema.ce_Person AS ToU ON H.ToPersonID = ToU.PersonID 
	LEFT OUTER JOIN
	ceschema.ce_Person AS FromU ON H.FromPersonID = FromU.PersonID
	ORDER BY H.Created DESC
	
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_History', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[55] 4[6] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = -192
	 Left = -596
	End
	Begin Tables = 
	 Begin Table = ''H''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 413
		   Right = 203
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''S''
		Begin Extent = 
		   Top = 0
		   Left = 662
		   Bottom = 119
		   Right = 822
		End
		DisplayFlags = 280
		TopColumn = 1
	 End
	 Begin Table = ''ToSite''
		Begin Extent = 
		   Top = 284
		   Left = 332
		   Bottom = 457
		   Right = 483
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ce_Category (ceschema)''
		Begin Extent = 
		   Top = 442
		   Left = 217
		   Bottom = 550
		   Right = 368
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ToHistory''
		Begin Extent = 
		   Top = 287
		   Left = 618
		   Bottom = 406
		   Right = 783
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ToA''
		Begin Extent = 
		   Top = 199
		   Left = 846
		   Bottom = 496
		   Right = 1030
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ToU''
		Begin Extent = 
		   Top = 90
		   Left = 607
		   Bottom = 209
		   Right = 782
		End
		DisplayFlags = 2' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_History'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'ceschema', N'VIEW',N'View_History', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'80
		TopColumn = 0
	 End
	 Begin Table = ''FromU''
		Begin Extent = 
		   Top = 31
		   Left = 798
		   Bottom = 173
		   Right = 973
		End
		DisplayFlags = 280
		TopColumn = 17
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	Begin ColumnWidths = 21
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_History'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_History', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_History'");
	
	announce("Object:  UserDefinedFunction [ceschema].[getDisplayNameByID]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[getDisplayNameByID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'
	-- =============================================
	-- Author:		<Author,,Name>
	-- Create date: <Create Date, ,>
	-- Description:	<Description, ,>
	-- =============================================
	CREATE FUNCTION [ceschema].[getDisplayNameByID] 
	(
	@PersonID int
	)
	RETURNS nvarchar(255) WITH SCHEMABINDING
	AS
	BEGIN
	-- Declare the return variable here
	DECLARE @DisplayName nvarchar(255)
	
	-- Add the T-SQL statements to compute the return value here
	SET @DisplayName = (SELECT DisplayName
	FROM ceschema.ce_Person
	WHERE PersonID=@PersonID)
	
	-- Return the result of the function
	RETURN @DisplayName
	
	END
	' 
	END");
	
	announce("Object:  View [ceschema].[view_entity_relate]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[view_entity_relate]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[view_entity_relate]
	AS
	SELECT     ee.entity_id, ee.linked_entity_id, ceschema.ce_entity.name AS entity_name, ceschema.ce_entity.name_abbrv AS entity_name_abbrv, 
				  ceschema.ce_entity.stub AS entity_stub, r.name AS entity_role, t.name AS entity_type
	FROM         ceschema.ce_entitytype AS t INNER JOIN
				  ceschema.ce_entity_entitytype AS et ON t.id = et.entitytype_id RIGHT OUTER JOIN
				  ceschema.ce_entity INNER JOIN
				  ceschema.ce_entity_relate AS ee ON ceschema.ce_entity.id = ee.linked_entity_id LEFT OUTER JOIN
				  ceschema.ce_entityrole AS r INNER JOIN
				  ceschema.ce_entity_entityrole AS er ON r.id = er.entityrole_id ON ee.linked_entity_id = er.entity_id ON et.entity_id = ee.linked_entity_id
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'view_entity_relate', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[40] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''t''
		Begin Extent = 
		   Top = 6
	
		   Left = 38
		   Bottom = 110
		   Right = 198
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''et''
		Begin Extent = 
		   Top = 6
		   Left = 236
		   Bottom = 95
		   Right = 396
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ce_entity (ceschema)''
		Begin Extent = 
		   Top = 6
		   Left = 434
		   Bottom = 125
		   Right = 603
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''ee''
		Begin Extent = 
		   Top = 6
		   Left = 641
		   Bottom = 95
		   Right = 805
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''r''
		Begin Extent = 
		   Top = 6
		   Left = 843
		   Bottom = 110
		   Right = 1003
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''er''
		Begin Extent = 
		   Top = 96
		   Left = 236
		   Bottom = 185
		   Right = 396
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	Begin ColumnWidths = 9
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'view_entity_relate'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'ceschema', N'VIEW',N'view_entity_relate', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'view_entity_relate'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'view_entity_relate', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'view_entity_relate'");
	
	announce("Object:  View [ceschema].[View_OldActions]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_OldActions]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_OldActions]
	AS
	SELECT     TOP (100) PERCENT ActionID, CASE WHEN RTrim(LTrim(ShortName)) 
				  = ''Changed activity status.'' THEN CASE WHEN LongName LIKE ''%Active%'' THEN ''Set to active.'' WHEN LongName LIKE ''%Ended%'' THEN ''Set to ended.'' WHEN LongName
				   LIKE ''%Cancelled%'' THEN ''Set to cancelled.'' WHEN LongName LIKE ''%Pending%'' THEN ''Set to pending.'' END WHEN RTrim(LTrim(ShortName)) 
				  = ''Added note.'' THEN CASE WHEN PersonID IS NOT NULL THEN ''Added person note.'' WHEN ActivityID IS NOT NULL 
				  THEN ''Added activity note.'' ELSE ''Added unknown note.'' END WHEN RTrim(LTrim(ShortName)) = ''Deleted note.'' THEN CASE WHEN PersonID IS NOT NULL 
				  THEN ''Deleted person note.'' WHEN ActivityID IS NOT NULL 
				  THEN ''Deleted activity note.'' ELSE ''Deleted unknown note.'' END WHEN ShortName LIKE ''Changed 1 status.'' THEN ''Changed registrant statuses'' WHEN ShortName LIKE
				   ''%registrants'''' statuses.'' THEN ''Changed registrant statuses'' ELSE ShortName END AS ShortName, PersonID AS ToPersonID, ActivityID AS ToActivityID, 
				  CreatedBy AS FromPersonID, LongName AS ToContent, Created AS PostDate
	FROM         ceschema.ce_Action
	WHERE     (ShortName IS NOT NULL) AND (ShortName <> '''') AND (MovedFlag = ''N'')
	ORDER BY ShortName
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_OldActions', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[40] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''ce_Action (ceschema)''
		Begin Extent = 
		   Top = 6

		   Left = 38
		   Bottom = 114
		   Right = 189
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_OldActions'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_OldActions', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_OldActions'");
	
	announce("Object:  View [ceschema].[View_geonameCities]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_geonameCities]'))
	EXEC dbo.sp_executesql @statement = N'
	CREATE VIEW [ceschema].[View_geonameCities]
	WITH SCHEMABINDING 
	AS
	SELECT 
				  geonameid, name,asciiname, alternatenames, country_code, admin1_code, population, elevation, name + ISNULL((CASE WHEN isNull(admin1_code, '''') 
				  <> '''' THEN '', '' + admin1_code END), N'''') AS searchText
	FROM         ceschema.geonameCities AS cities
	
	'");
	
	execute("SET ARITHABORT ON");
	
	execute("SET CONCAT_NULL_YIELDS_NULL ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("SET ANSI_NULLS ON");
	
	execute("SET ANSI_PADDING ON");
	
	execute("SET ANSI_WARNINGS ON");
	
	execute("SET NUMERIC_ROUNDABORT OFF");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[View_geonameCities]') AND name = N'IX_geonameid')
	CREATE UNIQUE CLUSTERED INDEX [IX_geonameid] ON [ceschema].[View_geonameCities] 
	(
	[geonameid] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_geonameCities', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[40] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''cities''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 299
		   Right = 212
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	Begin ColumnWidths = 9
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_geonameCities'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_geonameCities', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_geonameCities'");
	
	announce("Object:  UserDefinedFunction [ceschema].[getActivityStatusByID]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[getActivityStatusByID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'
	-- =============================================
	-- Author:		<Author,,Name>
	-- Create date: <Create Date, ,>
	-- Description:	<Description, ,>
	-- =============================================
	CREATE FUNCTION [ceschema].[getActivityStatusByID]
	(
	@StatusID int
	)
	RETURNS nvarchar(255)
	WITH SCHEMABINDING
	AS
	BEGIN
	-- Declare the return variable here
	DECLARE @StatusName nvarchar(255)
	
	-- Add the T-SQL statements to compute the return value here
	SET @StatusName = (SELECT Name
	FROM ceschema.ce_Sys_Status
	WHERE StatusID=@StatusID)
	
	-- Return the result of the function
	RETURN @StatusName
	
	END
	
	' 
	END");
	
	announce("Object:  View [ceschema].[View_erroredAnswers]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_erroredAnswers]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_erroredAnswers]
	AS
	WITH CTE_Group AS (SELECT     AR.ResultID, AA.QuestionID, MAX(AA.AnswerID) AS latestAnswer
										   FROM         ceschema.ce_AssessAnswer AS AA INNER JOIN
																  ceschema.ce_AssessResult AS AR ON AA.ResultID = AR.ResultID
										   WHERE     (AA.DeletedFlag = ''N'') AND
																	  ((SELECT     COUNT(AnswerID) AS Expr1
																		  FROM         ceschema.ce_AssessAnswer AS AA2
																		  WHERE     (ResultID = AR.ResultID) AND (AA.QuestionID = QuestionID)) > 1)
										   GROUP BY AR.ResultID, AA.QuestionID)
	SELECT     TOP (100) PERCENT AA3.AnswerID
	FROM         CTE_Group AS Gr INNER JOIN
						ceschema.ce_AssessAnswer AS AA3 ON AA3.ResultID = Gr.ResultID AND AA3.QuestionID = Gr.QuestionID AND 
						Gr.latestAnswer <> AA3.AnswerID
	ORDER BY AA3.ResultID, AA3.QuestionID, AA3.AnswerID
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_erroredAnswers', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[40] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''Gr''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 106
		   Right = 190
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''AA3''
		Begin Extent = 
		   Top = 18
		   Left = 406
		   Bottom = 133
		   Right = 558
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 11
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_erroredAnswers'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_erroredAnswers', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_erroredAnswers'");
	
	announce("Object:  View [ceschema].[View_OldCDCPeople]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_OldCDCPeople]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_OldCDCPeople]
	AS
	SELECT     R.AttendeeID AS PersonID, COUNT(CDC.cdcSTDInfoId) AS PifCount
	FROM         ceschema.xLegacy_cm_Registration AS R INNER JOIN
				  ceschema.xLegacy_tt_CourseSection AS CS ON R.CourseSectionId = CS.CourseSectionId INNER JOIN
				  ceschema.xLegacy_tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
				  ceschema.xLegacy_STDCourseList AS STDCourse ON C.Name = STDCourse.CourseName LEFT OUTER JOIN
				  ceschema.xLegacy_cm_cdcSTDInfo AS CDC ON CDC.Registrationid = R.RegistrationID
	GROUP BY R.AttendeeID
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_OldCDCPeople', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[41] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''R''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 114
		   Right = 243
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''CS''
		Begin Extent = 
		   Top = 6
		   Left = 281
		   Bottom = 114
		   Right = 468
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''C''
		Begin Extent = 
		   Top = 6
		   Left = 506
		   Bottom = 114
		   Right = 686
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''STDCourse''
		Begin Extent = 
		   Top = 6
		   Left = 724
		   Bottom = 99
		   Right = 891
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''CDC''
		Begin Extent = 
		   Top = 102
		   Left = 724
		   Bottom = 210
		   Right = 908
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 12
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	E' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_OldCDCPeople'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'ceschema', N'VIEW',N'View_OldCDCPeople', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_OldCDCPeople'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_OldCDCPeople', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_OldCDCPeople'");
	
	announce("Object:  View [ceschema].[View_AttendeePifCount]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_AttendeePifCount]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_AttendeePifCount]
	AS
	SELECT     Att.PersonID, COUNT(PIF.AttendeeCDCID) AS PIFCount
	FROM         ceschema.ce_Attendee AS Att INNER JOIN
				  ceschema.ce_Activity AS Act ON Att.ActivityID = Act.ActivityID LEFT OUTER JOIN
				  ceschema.ce_AttendeeCDC AS PIF ON Att.AttendeeID = PIF.AttendeeID
	WHERE     (Att.DeletedFlag = ''N'') AND (Act.StartDate NOT IN
					  (SELECT     CS.StartDate
						FROM          ceschema.xLegacy_cm_Registration AS R INNER JOIN
											   ceschema.xLegacy_tt_CourseSection AS CS ON R.CourseSectionId = CS.CourseSectionId INNER JOIN
											   ceschema.xLegacy_tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
											   ceschema.xLegacy_STDCourseList AS STDCourse ON C.Name = STDCourse.CourseName
						WHERE      (Att.PersonID = R.AttendeeID)
						GROUP BY R.AttendeeID, CS.StartDate))
	GROUP BY Att.PersonID
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_AttendeePifCount', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[40] 4[20] 2[20] 3) )''
	End
	Begin PaneConfiguration = 1
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 4 [25] 3))''
	End
	Begin PaneConfiguration = 2
	 NumPanes = 3
	 Configuration = ''(H (1 [50] 2 [25] 3))''
	End
	Begin PaneConfiguration = 3
	 NumPanes = 3
	 Configuration = ''(H (4 [30] 2 [40] 3))''
	End
	Begin PaneConfiguration = 4
	 NumPanes = 2
	 Configuration = ''(H (1 [56] 3))''
	End
	Begin PaneConfiguration = 5
	 NumPanes = 2
	 Configuration = ''(H (2 [66] 3))''
	End
	Begin PaneConfiguration = 6
	 NumPanes = 2
	 Configuration = ''(H (4 [50] 3))''
	End
	Begin PaneConfiguration = 7
	 NumPanes = 1
	 Configuration = ''(V (3))''
	End
	Begin PaneConfiguration = 8
	 NumPanes = 3
	 Configuration = ''(H (1[56] 4[18] 2) )''
	End
	Begin PaneConfiguration = 9
	 NumPanes = 2
	 Configuration = ''(H (1 [75] 4))''
	End
	Begin PaneConfiguration = 10
	 NumPanes = 2
	 Configuration = ''(H (1[66] 2) )''
	End
	Begin PaneConfiguration = 11
	 NumPanes = 2
	 Configuration = ''(H (4 [60] 2))''
	End
	Begin PaneConfiguration = 12
	 NumPanes = 1
	 Configuration = ''(H (1) )''
	End
	Begin PaneConfiguration = 13
	 NumPanes = 1
	 Configuration = ''(V (4))''
	End
	Begin PaneConfiguration = 14
	 NumPanes = 1
	 Configuration = ''(V (2))''
	End
	ActivePaneConfig = 0
	End
	Begin DiagramPane = 
	Begin Origin = 
	 Top = 0
	 Left = 0
	End
	Begin Tables = 
	 Begin Table = ''Att''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 114
		   Right = 213
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''PIF''
		Begin Extent = 
		   Top = 6
		   Left = 586
		   Bottom = 114
		   Right = 770
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Act''
		Begin Extent = 
		   Top = 166
		   Left = 516
		   Bottom = 274
		   Right = 707
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	End
	End
	Begin SQLPane = 
	End
	Begin DataPane = 
	Begin ParameterDefaults = ""
	End
	Begin ColumnWidths = 9
	 Width = 284
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	End
	End
	Begin CriteriaPane = 
	Begin ColumnWidths = 12
	 Column = 1440
	 Alias = 900
	 Table = 1170
	 Output = 720
	 Append = 1400
	 NewValue = 1170
	 SortType = 1350
	 SortOrder = 1410
	 GroupBy = 1350
	 Filter = 4155
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_AttendeePifCount'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_AttendeePifCount', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_AttendeePifCount'");
	
	
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>

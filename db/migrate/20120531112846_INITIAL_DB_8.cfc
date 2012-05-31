<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB 8">
  <cffunction name="up">
    <cfscript>
	announce("Object:  Default [DF_ce_Test_RandomFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Test_RandomFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Test_RandomFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Assessment] ADD  CONSTRAINT [DF_ce_Test_RandomFlag]  DEFAULT (N'N') FOR [RandomFlag]
	END
	End");
	
	announce("Object:  Default [DF_ce_Test_CommentFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Test_CommentFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Test_CommentFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Assessment] ADD  CONSTRAINT [DF_ce_Test_CommentFlag]  DEFAULT (N'N') FOR [CommentFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Test_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Test_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Test_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Assessment] ADD  CONSTRAINT [DF_ce_Test_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Test_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Test_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Test_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Assessment] ADD  CONSTRAINT [DF_ce_Test_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestQuestion_RequiredFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestQuestion_RequiredFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestQuestion_RequiredFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessQuestion] ADD  CONSTRAINT [DF_ce_TestQuestion_RequiredFlag]  DEFAULT (N'N') FOR [RequiredFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AssessQuestion_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AssessQuestion_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AssessQuestion_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessQuestion] ADD  CONSTRAINT [DF_ce_AssessQuestion_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestQuestion_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestQuestion_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestQuestion_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessQuestion] ADD  CONSTRAINT [DF_ce_TestQuestion_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestResult_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestResult_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestResult_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessResult] ADD  CONSTRAINT [DF_ce_TestResult_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestResult_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestResult_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestResult_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessResult] ADD  CONSTRAINT [DF_ce_TestResult_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestSection_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestSection_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessSection]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestSection_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessSection] ADD  CONSTRAINT [DF_ce_TestSection_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestSection_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestSection_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessSection]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestSection_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessSection] ADD  CONSTRAINT [DF_ce_TestSection_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Assess_Tmpl_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Assess_Tmpl_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessTmpl]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Assess_Tmpl_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessTmpl] ADD  CONSTRAINT [DF_ce_Assess_Tmpl_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Assess_Tmpl_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Assess_Tmpl_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessTmpl]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Assess_Tmpl_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessTmpl] ADD  CONSTRAINT [DF_ce_Assess_Tmpl_DeletedFlag]  DEFAULT ('N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseSect_Person_CheckedInFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseSect_Person_CheckedInFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseSect_Person_CheckedInFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee] ADD  CONSTRAINT [DF_ce_CourseSect_Person_CheckedInFlag]  DEFAULT (N'N') FOR [CheckedInFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseSect_Person_CheckedOutFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseSect_Person_CheckedOutFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseSect_Person_CheckedOutFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee] ADD  CONSTRAINT [DF_ce_CourseSect_Person_CheckedOutFlag]  DEFAULT (N'N') FOR [CheckedOutFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Attendee_MDflag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Attendee_MDflag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Attendee_MDflag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee] ADD  CONSTRAINT [DF_ce_Attendee_MDflag]  DEFAULT (N'N') FOR [MDflag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Attendee_emailSentFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Attendee_emailSentFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Attendee_emailSentFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee] ADD  CONSTRAINT [DF_ce_Attendee_emailSentFlag]  DEFAULT ((0)) FOR [emailSentFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseSect_Person_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseSect_Person_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseSect_Person_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee] ADD  CONSTRAINT [DF_ce_CourseSect_Person_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Attendee_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Attendee_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Attendee_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee] ADD  CONSTRAINT [DF_ce_Attendee_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Attendee_Component_LikeFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Attendee_Component_LikeFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee_Component]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Attendee_Component_LikeFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee_Component] ADD  CONSTRAINT [DF_ce_Attendee_Component_LikeFlag]  DEFAULT (N'N') FOR [LikeFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Attendee_Component_Updated]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Attendee_Component_Updated]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee_Component]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Attendee_Component_Updated]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee_Component] ADD  CONSTRAINT [DF_ce_Attendee_Component_Updated]  DEFAULT (getdate()) FOR [Updated]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Attendee_Step_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Attendee_Step_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Attendee_Step]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Attendee_Step_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Attendee_Step] ADD  CONSTRAINT [DF_ce_Attendee_Step_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_Updates]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_Updates]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_Updates]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_Updates]  DEFAULT ('N') FOR [Updates]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_Eval]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_Eval]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_Eval]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_Eval]  DEFAULT ('N') FOR [Eval]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_TrainingAlert]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_TrainingAlert]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_TrainingAlert]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_TrainingAlert]  DEFAULT ('N') FOR [TrainingAlert]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_CurrentlyEnrolled]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_CurrentlyEnrolled]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_CurrentlyEnrolled]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_CurrentlyEnrolled]  DEFAULT ('N') FOR [CurrentlyEnrolled]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_RelevantTraining]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_RelevantTraining]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_RelevantTraining]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_RelevantTraining]  DEFAULT ('N') FOR [RelevantTraining]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_MotivationTraining]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_MotivationTraining]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_MotivationTraining]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_MotivationTraining]  DEFAULT ('N') FOR [MotivationTraining]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_SentFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_SentFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_SentFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_SentFlag]  DEFAULT (N'N') FOR [SentFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCDC_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCDC_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCDC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCDC_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCDC] ADD  CONSTRAINT [DF_ce_AttendeeCDC_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCredit_Amount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCredit_Amount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCredit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCredit_Amount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCredit] ADD  CONSTRAINT [DF_ce_AttendeeCredit_Amount]  DEFAULT ((0)) FOR [Amount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCredit_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCredit_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCredit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCredit_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCredit] ADD  CONSTRAINT [DF_ce_AttendeeCredit_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AttendeeCredit_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AttendeeCredit_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AttendeeCredit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AttendeeCredit_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AttendeeCredit] ADD  CONSTRAINT [DF_ce_AttendeeCredit_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Authority_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Authority_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Authority]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Authority_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Authority] ADD  CONSTRAINT [DF_ce_Authority_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Authority_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Authority_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Authority]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Authority_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Authority] ADD  CONSTRAINT [DF_ce_Authority_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AuthorityPage_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AuthorityPage_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AuthorityPage]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AuthorityPage_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AuthorityPage] ADD  CONSTRAINT [DF_ce_AuthorityPage_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AuthorityPage_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AuthorityPage_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AuthorityPage]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AuthorityPage_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AuthorityPage] ADD  CONSTRAINT [DF_ce_AuthorityPage_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Category_ActivityCount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Category_ActivityCount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Category]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Category_ActivityCount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Category] ADD  CONSTRAINT [DF_ce_Category_ActivityCount]  DEFAULT ((0)) FOR [ActivityCount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Category_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Category_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Category]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Category_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Category] ADD  CONSTRAINT [DF_ce_Category_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Category_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Category_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Category]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Category_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Category] ADD  CONSTRAINT [DF_ce_Category_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Category_primary_image_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Category_primary_image_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Category]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Category_primary_image_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Category] ADD  CONSTRAINT [DF_ce_Category_primary_image_id]  DEFAULT ((0)) FOR [primary_image_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Cert_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Cert_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Cert]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Cert_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Cert] ADD  CONSTRAINT [DF_ce_Cert_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Cert_Credit_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Cert_Credit_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Cert_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Cert_Credit_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Cert_Credit] ADD  CONSTRAINT [DF_ce_Cert_Credit_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_Table_1_ApproveFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_Table_1_ApproveFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Comment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_ApproveFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Comment] ADD  CONSTRAINT [DF_Table_1_ApproveFlag]  DEFAULT ('N') FOR [ApproveFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Comment_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Comment_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Comment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Comment_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Comment] ADD  CONSTRAINT [DF_ce_Comment_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Comment_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Comment_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Comment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Comment_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Comment] ADD  CONSTRAINT [DF_ce_Comment_DeletedFlag]  DEFAULT ('N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Credit_Cert_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Credit_Cert_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Credit_Cert]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Credit_Cert_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Credit_Cert] ADD  CONSTRAINT [DF_ce_Credit_Cert_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_degree_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_degree_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_degree]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_degree_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_degree] ADD  CONSTRAINT [DF_ce_degree_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_degree_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_degree_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_degree]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_degree_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_degree] ADD  CONSTRAINT [DF_ce_degree_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Degree_Credit_sort]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Degree_Credit_sort]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Degree_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Degree_Credit_sort]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Degree_Credit] ADD  CONSTRAINT [DF_ce_Sys_Degree_Credit_sort]  DEFAULT ((1)) FOR [sort]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Degree_Credit_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Degree_Credit_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Degree_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Degree_Credit_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Degree_Credit] ADD  CONSTRAINT [DF_ce_Sys_Degree_Credit_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_category_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_category_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_category_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_category_id]  DEFAULT ((0)) FOR [category_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_sub_category_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_sub_category_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_sub_category_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_sub_category_id]  DEFAULT ((0)) FOR [sub_category_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_uuid]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_uuid]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_uuid]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_uuid]  DEFAULT (newid()) FOR [uuid]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_parent_entity_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_parent_entity_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_parent_entity_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_parent_entity_id]  DEFAULT ((0)) FOR [parent_entity_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_stat_users]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_stat_users]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_stat_users]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_stat_users]  DEFAULT ((0)) FOR [stat_users]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_is_verified]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_is_verified]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_is_verified]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_is_verified]  DEFAULT ((0)) FOR [is_verified]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_primary_image_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_primary_image_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_primary_image_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_primary_image_id]  DEFAULT ((0)) FOR [primary_image_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity] ADD  CONSTRAINT [DF_ce_entity_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_entity_person_role_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_entity_person_role_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity_person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_entity_person_role_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity_person] ADD  CONSTRAINT [DF_ce_entity_person_role_id]  DEFAULT ((0)) FOR [role_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_user_entity_is_verified]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_user_entity_is_verified]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity_person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_user_entity_is_verified]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity_person] ADD  CONSTRAINT [DF_ce_user_entity_is_verified]  DEFAULT ((0)) FOR [is_verified]
	END
	
	
	End");

	
	announce("Object:  Default [DF_ce_user_entity_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_user_entity_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_entity_person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_user_entity_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_entity_person] ADD  CONSTRAINT [DF_ce_user_entity_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_File_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_File_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_File]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_File_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_File] ADD  CONSTRAINT [DF_ce_File_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_File_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_File_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_File]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_File_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_File] ADD  CONSTRAINT [DF_ce_File_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_FileGroup_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_FileGroup_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_FileGroup]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_FileGroup_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_FileGroup] ADD  CONSTRAINT [DF_ce_FileGroup_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_FileGroup_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_FileGroup_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_FileGroup]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_FileGroup_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_FileGroup] ADD  CONSTRAINT [DF_ce_FileGroup_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Client_clientGUID]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Client_clientGUID]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Group]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Client_clientGUID]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Group] ADD  CONSTRAINT [DF_ce_Client_clientGUID]  DEFAULT (newid()) FOR [clientGUID]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Partner_accreditedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Partner_accreditedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Group]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Partner_accreditedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Group] ADD  CONSTRAINT [DF_ce_Partner_accreditedFlag]  DEFAULT ((0)) FOR [accreditedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Client_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Client_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Group]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Client_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Group] ADD  CONSTRAINT [DF_ce_Client_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Client_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Client_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Group]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Client_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Group] ADD  CONSTRAINT [DF_ce_Client_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Partner_Type_sort]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Partner_Type_sort]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_GroupType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Partner_Type_sort]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_GroupType] ADD  CONSTRAINT [DF_ce_Partner_Type_sort]  DEFAULT ((1)) FOR [sort]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Partner_Type_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Partner_Type_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_GroupType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Partner_Type_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_GroupType] ADD  CONSTRAINT [DF_ce_Partner_Type_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_History_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_History_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_History]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_History_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_History] ADD  CONSTRAINT [DF_History_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_History_HiddenFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_History_HiddenFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_History]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_History_HiddenFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_History] ADD  CONSTRAINT [DF_History_HiddenFlag]  DEFAULT (N'N') FOR [HiddenFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_hub_isWikipedia]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_hub_isWikipedia]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_hub]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_hub_isWikipedia]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_hub] ADD  CONSTRAINT [DF_ce_hub_isWikipedia]  DEFAULT ((0)) FOR [wiki_flag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_hub_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_hub_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_hub]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_hub_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_hub] ADD  CONSTRAINT [DF_ce_hub_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_image_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_image_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_image]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_image_created]') AND type = 'D')
	BEGIN

	ALTER TABLE [ceschema].[ce_image] ADD  CONSTRAINT [DF_ce_image_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_location_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_location_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_location]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_location_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_location] ADD  CONSTRAINT [DF_ce_location_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_locationType_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_locationType_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_locationType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_locationType_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_locationType] ADD  CONSTRAINT [DF_ce_locationType_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_object_uuid]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_object_uuid]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_object]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_object_uuid]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_object] ADD  CONSTRAINT [DF_ce_object_uuid]  DEFAULT (newid()) FOR [uuid]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_object_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_object_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_object]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_object_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_object] ADD  CONSTRAINT [DF_ce_object_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");

	
	announce("Object:  Default [DF_ce_object_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_object_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_object]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_object_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_object] ADD  CONSTRAINT [DF_ce_object_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_objectData_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_objectData_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_objectData]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_objectData_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_objectData] ADD  CONSTRAINT [DF_ce_objectData_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_objectData_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_objectData_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_objectData]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_objectData_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_objectData] ADD  CONSTRAINT [DF_ce_objectData_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_objectField_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_objectField_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_objectField]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_objectField_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_objectField] ADD  CONSTRAINT [DF_ce_objectField_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_occupation_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_occupation_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_occupation]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_occupation_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_occupation] ADD  CONSTRAINT [DF_ce_occupation_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Page_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Page_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_page]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Page_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_page] ADD  CONSTRAINT [DF_ce_Page_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Page_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Page_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_page]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Page_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_page] ADD  CONSTRAINT [DF_ce_Page_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_page_section_sort]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_page_section_sort]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_page_section]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_page_section_sort]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_page_section] ADD  CONSTRAINT [DF_ce_page_section_sort]  DEFAULT ((0)) FOR [sort]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_page_section_show_label]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_page_section_show_label]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_page_section]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_page_section_show_label]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_page_section] ADD  CONSTRAINT [DF_ce_page_section_show_label]  DEFAULT ((0)) FOR [show_label]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_page_section_show_rule]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_page_section_show_rule]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_page_section]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_page_section_show_rule]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_page_section] ADD  CONSTRAINT [DF_ce_page_section_show_rule]  DEFAULT ((1)) FOR [show_rule]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_pageLayoutMenu_page_show_icon]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_pageLayoutMenu_page_show_icon]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_pageLayoutMenu_page]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_pageLayoutMenu_page_show_icon]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_pageLayoutMenu_page] ADD  CONSTRAINT [DF_ce_pageLayoutMenu_page_show_icon]  DEFAULT ((0)) FOR [show_icon]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_pageLayoutMenu_page_show_stat]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_pageLayoutMenu_page_show_stat]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_pageLayoutMenu_page]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_pageLayoutMenu_page_show_stat]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_pageLayoutMenu_page] ADD  CONSTRAINT [DF_ce_pageLayoutMenu_page_show_stat]  DEFAULT ((0)) FOR [show_stat]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_pageLayoutMenu_page_sort]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_pageLayoutMenu_page_sort]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_pageLayoutMenu_page]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_pageLayoutMenu_page_sort]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_pageLayoutMenu_page] ADD  CONSTRAINT [DF_ce_pageLayoutMenu_page_sort]  DEFAULT ((0)) FOR [sort]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Gender]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Gender]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Gender]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person] ADD  CONSTRAINT [DF_ce_Person_Gender]  DEFAULT (N'U') FOR [Gender]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person] ADD  CONSTRAINT [DF_ce_Person_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person] ADD  CONSTRAINT [DF_ce_Person_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Address_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Address_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Address]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Address_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Address] ADD  CONSTRAINT [DF_ce_Person_Address_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Client_revokeFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Client_revokeFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Client]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Client_revokeFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Client] ADD  CONSTRAINT [DF_ce_Person_Client_revokeFlag]  DEFAULT (N'N') FOR [revokeFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Client_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Client_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Client]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Client_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Client] ADD  CONSTRAINT [DF_ce_Person_Client_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Client_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Client_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Client]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Client_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Client] ADD  CONSTRAINT [DF_ce_Person_Client_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Degree_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Degree_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Degree]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Degree_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Degree] ADD  CONSTRAINT [DF_ce_Person_Degree_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Degree_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Degree_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Degree]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Degree_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Degree] ADD  CONSTRAINT [DF_ce_Person_Degree_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_person_email_is_verified]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_person_email_is_verified]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Email]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_person_email_is_verified]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Email] ADD  CONSTRAINT [DF_ce_person_email_is_verified]  DEFAULT ((0)) FOR [is_verified]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_person_email_allow_login]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_person_email_allow_login]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Email]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_person_email_allow_login]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Email] ADD  CONSTRAINT [DF_ce_person_email_allow_login]  DEFAULT ((0)) FOR [allow_login]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_File_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_File_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_File]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_File_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_File] ADD  CONSTRAINT [DF_ce_Person_File_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_File_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_File_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_File]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_File_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_File] ADD  CONSTRAINT [DF_ce_Person_File_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Interest_Exception_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Interest_Exception_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Interest_Except]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Interest_Exception_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Interest_Except] ADD  CONSTRAINT [DF_ce_Person_Interest_Exception_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_PersonNote_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_PersonNote_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Note]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_PersonNote_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Note] ADD  CONSTRAINT [DF_ce_PersonNote_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_PersonNote_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_PersonNote_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Note]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_PersonNote_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Note] ADD  CONSTRAINT [DF_ce_PersonNote_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_Pref_createdAt]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_Pref_createdAt]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_Pref]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_Pref_createdAt]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_Pref] ADD  CONSTRAINT [DF_ce_Person_Pref_createdAt]  DEFAULT (getdate()) FOR [createdAt]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_SpecialtyLMS_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_SpecialtyLMS_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_SpecialtyLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_SpecialtyLMS_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_SpecialtyLMS] ADD  CONSTRAINT [DF_ce_Person_SpecialtyLMS_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Person_SpecialtyLMS_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Person_SpecialtyLMS_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Person_SpecialtyLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Person_SpecialtyLMS_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Person_SpecialtyLMS] ADD  CONSTRAINT [DF_ce_Person_SpecialtyLMS_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_person_user_primary_entity_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_person_user_primary_entity_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_person_user]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_person_user_primary_entity_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_person_user] ADD  CONSTRAINT [DF_ce_person_user_primary_entity_id]  DEFAULT ((0)) FOR [primary_entity_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Process_HiddenFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Process_HiddenFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Process]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Process_HiddenFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Process] ADD  CONSTRAINT [DF_ce_Process_HiddenFlag]  DEFAULT (N'N') FOR [HiddenFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Process_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Process_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Process]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Process_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Process] ADD  CONSTRAINT [DF_ce_Process_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Process_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Process_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Process]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Process_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Process] ADD  CONSTRAINT [DF_ce_Process_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Process_Person_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Process_Person_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Process_Person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Process_Person_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Process_Person] ADD  CONSTRAINT [DF_ce_Process_Person_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Process_Person_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Process_Person_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Process_Person]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Process_Person_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Process_Person] ADD  CONSTRAINT [DF_ce_Process_Person_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessManager_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessManager_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessManager]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessManager_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessManager] ADD  CONSTRAINT [DF_ce_ProcessManager_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessManager_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessManager_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessManager]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessManager_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessManager] ADD  CONSTRAINT [DF_ce_ProcessManager_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessStep_NotifyFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessStep_NotifyFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessStep_NotifyFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessStep] ADD  CONSTRAINT [DF_ce_ProcessStep_NotifyFlag]  DEFAULT (N'Y') FOR [NotifyFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessStep_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessStep_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessStep_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessStep] ADD  CONSTRAINT [DF_ce_ProcessStep_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessStep_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessStep_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessStep_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessStep] ADD  CONSTRAINT [DF_ce_ProcessStep_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessStep_Course_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessStep_Course_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessStep_Course_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessStep_Activity] ADD  CONSTRAINT [DF_ce_ProcessStep_Course_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ProcessStep_Course_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ProcessStep_Course_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_ProcessStep_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ProcessStep_Course_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_ProcessStep_Activity] ADD  CONSTRAINT [DF_ce_ProcessStep_Course_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_professionArea_parent_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_professionArea_parent_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_professionArea]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_professionArea_parent_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_professionArea] ADD  CONSTRAINT [DF_ce_professionArea_parent_id]  DEFAULT ((0)) FOR [parent_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Project_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Project_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Project]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Project_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Project] ADD  CONSTRAINT [DF_ce_Project_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Project_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Project_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Project]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Project_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Project] ADD  CONSTRAINT [DF_ce_Project_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_relicensure_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_relicensure_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_relicensure]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_relicensure_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_relicensure] ADD  CONSTRAINT [DF_ce_relicensure_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_relicensure_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_relicensure_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_relicensure]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_relicensure_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_relicensure] ADD  CONSTRAINT [DF_ce_relicensure_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Subscription_OptInDate]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Subscription_OptInDate]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Subscription]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Subscription_OptInDate]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Subscription] ADD  CONSTRAINT [DF_ce_Subscription_OptInDate]  DEFAULT (getdate()) FOR [OptInDate]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Subscription_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Subscription_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Subscription]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Subscription_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Subscription] ADD  CONSTRAINT [DF_ce_Subscription_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Subscription_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Subscription_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Subscription]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Subscription_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Subscription] ADD  CONSTRAINT [DF_ce_Subscription_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_ActivityStepType_Sort]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_ActivityStepType_Sort]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ActivityStepType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_ActivityStepType_Sort]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_ActivityStepType] ADD  CONSTRAINT [DF_ce_Sys_ActivityStepType_Sort]  DEFAULT ((1)) FOR [Sort]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ActivityType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_ActivityType] ADD  CONSTRAINT [DF_ce_CourseType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseType_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseType_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ActivityType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseType_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_ActivityType] ADD  CONSTRAINT [DF_ce_CourseType_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_apiClient_statUsers]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_apiClient_statUsers]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_apiClient_statUsers]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_apiClient] ADD  CONSTRAINT [DF_ce_Sys_apiClient_statUsers]  DEFAULT ((0)) FOR [statUsers]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_apiClient_statCalls]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_apiClient_statCalls]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_apiClient_statCalls]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_apiClient] ADD  CONSTRAINT [DF_ce_Sys_apiClient_statCalls]  DEFAULT ((0)) FOR [statCalls]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_apiClient_statUpdate]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_apiClient_statUpdate]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_apiClient_statUpdate]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_apiClient] ADD  CONSTRAINT [DF_ce_Sys_apiClient_statUpdate]  DEFAULT ((0)) FOR [statUpdate]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_apiClient_statSignup]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_apiClient_statSignup]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_apiClient_statSignup]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_apiClient] ADD  CONSTRAINT [DF_ce_Sys_apiClient_statSignup]  DEFAULT ((0)) FOR [statSignup]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_apiClient_statLogin]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_apiClient_statLogin]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_apiClient_statLogin]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_apiClient] ADD  CONSTRAINT [DF_ce_Sys_apiClient_statLogin]  DEFAULT ((0)) FOR [statLogin]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_apiClient_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_apiClient_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_apiClient]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_apiClient_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_apiClient] ADD  CONSTRAINT [DF_ce_Sys_apiClient_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_QuestionType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_QuestionType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessQuestionType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_QuestionType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_AssessQuestionType] ADD  CONSTRAINT [DF_ce_Sys_QuestionType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_QuestionType_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_QuestionType_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessQuestionType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_QuestionType_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_AssessQuestionType] ADD  CONSTRAINT [DF_ce_Sys_QuestionType_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_ResultStatus_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_ResultStatus_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessResultStatus]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_ResultStatus_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_AssessResultStatus] ADD  CONSTRAINT [DF_ce_Sys_ResultStatus_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_ResultStatus_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_ResultStatus_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_AssessResultStatus]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_ResultStatus_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_AssessResultStatus] ADD  CONSTRAINT [DF_ce_Sys_ResultStatus_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_CategoryLMS_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_CategoryLMS_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CategoryLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_CategoryLMS_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_CategoryLMS] ADD  CONSTRAINT [DF_ce_Sys_CategoryLMS_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_CategoryLMS_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_CategoryLMS_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CategoryLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_CategoryLMS_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_CategoryLMS] ADD  CONSTRAINT [DF_ce_Sys_CategoryLMS_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_CBAFund_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_CBAFund_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CBAFund]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_CBAFund_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_CBAFund] ADD  CONSTRAINT [DF_ce_Sys_CBAFund_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_CBOFund_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_CBOFund_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_CBOFund]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_CBOFund_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_CBOFund] ADD  CONSTRAINT [DF_ce_Sys_CBOFund_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Component_SortFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Component_SortFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Component]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Component_SortFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Component] ADD  CONSTRAINT [DF_ce_Sys_Component_SortFlag]  DEFAULT (N'Y') FOR [SortFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Component_MaxUsage]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Component_MaxUsage]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Component]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Component_MaxUsage]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Component] ADD  CONSTRAINT [DF_ce_Sys_Component_MaxUsage]  DEFAULT ((0)) FOR [MaxUsage]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Credit_ReferenceFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Credit_ReferenceFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Credit_ReferenceFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Credit] ADD  CONSTRAINT [DF_ce_Sys_Credit_ReferenceFlag]  DEFAULT (N'N') FOR [ReferenceFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Credit_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Credit_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Credit_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Credit] ADD  CONSTRAINT [DF_ce_Credit_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Credit_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Credit_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Credit_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Credit] ADD  CONSTRAINT [DF_ce_Credit_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_EntryType_ExpenseFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_EntryType_ExpenseFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_EntryType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_EntryType_ExpenseFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_EntryType] ADD  CONSTRAINT [DF_ce_Sys_EntryType_ExpenseFlag]  DEFAULT (N'N') FOR [ExpenseFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_EntryType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_EntryType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_EntryType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_EntryType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_EntryType] ADD  CONSTRAINT [DF_ce_Sys_EntryType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	
	announce("Object:  Default [DF_ce_Sys_FunRC_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_FunRC_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_FunRC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_FunRC_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_FunRC] ADD  CONSTRAINT [DF_ce_Sys_FunRC_Created]  DEFAULT (getdate()) FOR [Created]
	END
	

	
	End");
	
	announce("Object:  Default [DF_ce_Sys_FunRN_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_FunRN_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_FunRN]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_FunRN_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_FunRN] ADD  CONSTRAINT [DF_ce_Sys_FunRN_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Grouping_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Grouping_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Grouping]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Grouping_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Grouping] ADD  CONSTRAINT [DF_ce_Sys_Grouping_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ur__HistoryStyle_PossessiveFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ur__HistoryStyle_PossessiveFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_HistoryStyle]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ur__HistoryStyle_PossessiveFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_HistoryStyle] ADD  CONSTRAINT [DF_ur__HistoryStyle_PossessiveFlag]  DEFAULT (N'Y') FOR [PossessiveFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Market_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Market_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Market]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Market_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Market] ADD  CONSTRAINT [DF_ce_Sys_Market_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_OccClass_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_OccClass_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_OccClass]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_OccClass_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_OccClass] ADD  CONSTRAINT [DF_ce_Sys_OccClass_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_OrgType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_OrgType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_OrgType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_OrgType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_OrgType] ADD  CONSTRAINT [DF_ce_Sys_OrgType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_PrinEmp_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_PrinEmp_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_PrinEmp]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_PrinEmp_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_PrinEmp] ADD  CONSTRAINT [DF_ce_Sys_PrinEmp_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_ProfC_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_ProfC_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ProfC]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_ProfC_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_ProfC] ADD  CONSTRAINT [DF_ce_Sys_ProfC_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_ProfN_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_ProfN_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ProfN]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_ProfN_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_ProfN] ADD  CONSTRAINT [DF_ce_Sys_ProfN_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_ProjectType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_ProjectType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_ProjectType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_ProjectType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_ProjectType] ADD  CONSTRAINT [DF_ce_Sys_ProjectType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_Report_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Report_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Report]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Report_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Report] ADD  CONSTRAINT [DF_ce_Sys_Report_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_SiteLMS_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_SiteLMS_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SiteLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_SiteLMS_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_SiteLMS] ADD  CONSTRAINT [DF_ce_Sys_SiteLMS_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_SiteLMS_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_SiteLMS_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SiteLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_SiteLMS_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_SiteLMS] ADD  CONSTRAINT [DF_ce_Sys_SiteLMS_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_SpecialtyLMS_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_SpecialtyLMS_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SpecialtyLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_SpecialtyLMS_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_SpecialtyLMS] ADD  CONSTRAINT [DF_ce_Sys_SpecialtyLMS_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_SpecialtyLMS_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_SpecialtyLMS_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SpecialtyLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_SpecialtyLMS_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_SpecialtyLMS] ADD  CONSTRAINT [DF_ce_Sys_SpecialtyLMS_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");

	
	announce("Object:  Default [DF_ce_Sys_Status_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_Status_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Status]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_Status_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Status] ADD  CONSTRAINT [DF_ce_Sys_Status_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Contributor_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Contributor_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Supporter]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Contributor_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Supporter] ADD  CONSTRAINT [DF_ce_Contributor_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Contributor_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Contributor_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_Supporter]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Contributor_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_Supporter] ADD  CONSTRAINT [DF_ce_Contributor_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ContribType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ContribType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SupportType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ContribType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_SupportType] ADD  CONSTRAINT [DF_ce_ContribType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ContribType_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ContribType_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_SupportType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ContribType_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_SupportType] ADD  CONSTRAINT [DF_ce_ContribType_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_TestType_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_TestType_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_TestType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_TestType_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_TestType] ADD  CONSTRAINT [DF_ce_Sys_TestType_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Sys_TestType_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Sys_TestType_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Sys_TestType]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Sys_TestType_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Sys_TestType] ADD  CONSTRAINT [DF_ce_Sys_TestType_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  ForeignKey [FK_ce_CourseCredit_ce_Credit]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_CourseCredit_ce_Credit]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Credit]'))
	ALTER TABLE [ceschema].[ce_Activity_Credit]  WITH CHECK ADD  CONSTRAINT [FK_ce_CourseCredit_ce_Credit] FOREIGN KEY([CreditID])
	REFERENCES [ceschema].[ce_Sys_Credit] ([CreditID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_CourseCredit_ce_Credit]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Credit]'))
	ALTER TABLE [ceschema].[ce_Activity_Credit] CHECK CONSTRAINT [FK_ce_CourseCredit_ce_Credit]");
	
	announce("Object:  ForeignKey [FK_ce_AssessAnswer_ce_Assessment]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessAnswer_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	ALTER TABLE [ceschema].[ce_AssessAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessAnswer_ce_Assessment] FOREIGN KEY([AssessmentID])
	REFERENCES [ceschema].[ce_Assessment] ([AssessmentID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessAnswer_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	ALTER TABLE [ceschema].[ce_AssessAnswer] CHECK CONSTRAINT [FK_ce_AssessAnswer_ce_Assessment]");
	
	announce("Object:  ForeignKey [FK_ce_AssessAnswer_ce_AssessQuestion]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessAnswer_ce_AssessQuestion]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	ALTER TABLE [ceschema].[ce_AssessAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessAnswer_ce_AssessQuestion] FOREIGN KEY([QuestionID])
	REFERENCES [ceschema].[ce_AssessQuestion] ([QuestionID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessAnswer_ce_AssessQuestion]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	ALTER TABLE [ceschema].[ce_AssessAnswer] CHECK CONSTRAINT [FK_ce_AssessAnswer_ce_AssessQuestion]");
	
	announce("Object:  ForeignKey [FK_ce_AssessAnswer_ce_AssessResult]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessAnswer_ce_AssessResult]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	ALTER TABLE [ceschema].[ce_AssessAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessAnswer_ce_AssessResult] FOREIGN KEY([ResultID])
	REFERENCES [ceschema].[ce_AssessResult] ([ResultID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessAnswer_ce_AssessResult]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	ALTER TABLE [ceschema].[ce_AssessAnswer] CHECK CONSTRAINT [FK_ce_AssessAnswer_ce_AssessResult]");
	
	announce("Object:  ForeignKey [FK_ce_Assessment_ce_Sys_AssessType]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_Assessment_ce_Sys_AssessType]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	ALTER TABLE [ceschema].[ce_Assessment]  WITH CHECK ADD  CONSTRAINT [FK_ce_Assessment_ce_Sys_AssessType] FOREIGN KEY([AssessTypeID])
	REFERENCES [ceschema].[ce_Sys_AssessType] ([AssessTypeID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_Assessment_ce_Sys_AssessType]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	ALTER TABLE [ceschema].[ce_Assessment] CHECK CONSTRAINT [FK_ce_Assessment_ce_Sys_AssessType]");
	
	announce("Object:  ForeignKey [FK_ce_AssessQuestion_ce_Assessment]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessQuestion_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	ALTER TABLE [ceschema].[ce_AssessQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessQuestion_ce_Assessment] FOREIGN KEY([AssessmentID])
	REFERENCES [ceschema].[ce_Assessment] ([AssessmentID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessQuestion_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	ALTER TABLE [ceschema].[ce_AssessQuestion] CHECK CONSTRAINT [FK_ce_AssessQuestion_ce_Assessment]");
	
	announce("Object:  ForeignKey [FK_ce_AssessQuestion_ce_AssessSection]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessQuestion_ce_AssessSection]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	ALTER TABLE [ceschema].[ce_AssessQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessQuestion_ce_AssessSection] FOREIGN KEY([SectionID])
	REFERENCES [ceschema].[ce_AssessSection] ([SectionID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessQuestion_ce_AssessSection]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessQuestion]'))
	ALTER TABLE [ceschema].[ce_AssessQuestion] CHECK CONSTRAINT [FK_ce_AssessQuestion_ce_AssessSection]");
	
	announce("Object:  ForeignKey [FK_ce_AssessResult_ce_Assessment]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessResult_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]'))
	ALTER TABLE [ceschema].[ce_AssessResult]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessResult_ce_Assessment] FOREIGN KEY([AssessmentID])
	REFERENCES [ceschema].[ce_Assessment] ([AssessmentID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessResult_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]'))
	ALTER TABLE [ceschema].[ce_AssessResult] CHECK CONSTRAINT [FK_ce_AssessResult_ce_Assessment]");
	
	announce("Object:  ForeignKey [FK_ce_AssessResult_ce_Sys_AssessResultStatus]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessResult_ce_Sys_AssessResultStatus]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]'))
	ALTER TABLE [ceschema].[ce_AssessResult]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessResult_ce_Sys_AssessResultStatus] FOREIGN KEY([ResultStatusID])
	REFERENCES [ceschema].[ce_Sys_AssessResultStatus] ([ResultStatusID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessResult_ce_Sys_AssessResultStatus]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessResult]'))
	ALTER TABLE [ceschema].[ce_AssessResult] CHECK CONSTRAINT [FK_ce_AssessResult_ce_Sys_AssessResultStatus]");
	
	announce("Object:  ForeignKey [FK_ce_AssessSection_ce_Assessment]    Script Date: 05/31/2012 10:19:07");
	execute("IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessSection_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessSection]'))
	ALTER TABLE [ceschema].[ce_AssessSection]  WITH CHECK ADD  CONSTRAINT [FK_ce_AssessSection_ce_Assessment] FOREIGN KEY([AssessmentID])
	REFERENCES [ceschema].[ce_Assessment] ([AssessmentID])");
	
	execute("IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ceschema].[FK_ce_AssessSection_ce_Assessment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessSection]'))
	ALTER TABLE [ceschema].[ce_AssessSection] CHECK CONSTRAINT [FK_ce_AssessSection_ce_Assessment]");
	



    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>

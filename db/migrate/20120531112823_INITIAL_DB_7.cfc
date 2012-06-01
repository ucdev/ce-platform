<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB 7">
  <cffunction name="up">
    <cfscript>
    /*
	announce("Object:  View [ceschema].[View_PreferredPifFull]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_PreferredPifFull]'))
	EXEC dbo.sp_executesql @statement = N'
	CREATE VIEW [ceschema].[View_PreferredPifFull]
	AS
	WITH CTE_PreferredPif AS (SELECT     MaxPIFid, PersonID, PrinEmpBit, MaxCreated
														FROM         ceschema.View_PreferredPif)
	SELECT     PIF.AttendeeCDCID, PIF.AttendeeID, PIF.CBAFundId, PIF.CBACDC, PIF.CBAOth, PIF.CBOFundId, PIF.CBOCDC, PIF.CBOOth, PIF.FunRCId, PIF.FunRCSp, PIF.FunRNId, 
						PIF.FunRNSp, PIF.MarketId, PIF.Mspecify, PIF.OccClassId, PIF.OrgTypeId, PIF.Tspecify, PIF.ProfCId, PIF.ProfCSp, PIF.ProfNId, PIF.ProfNSp, PIF.PrinEmpID, 
						PIF.PrinEmpSp, PIF.WorkState, PIF.WorkZip, PIF.FocSTD, PIF.FocHIV, PIF.FocWRH, PIF.FocGen, PIF.FocAdol, PIF.FocMH, PIF.FocSub, PIF.FocEm, PIF.FocCor, 
						PIF.FocOth, PIF.FocSpec, PIF.PopGen, PIF.PopAdol, PIF.PopGLB, PIF.PopTran, PIF.PopHome, PIF.PopCorr, PIF.PopPreg, PIF.PopSW, PIF.PopAA, PIF.PopAs, 
						PIF.PopNH, PIF.PopAIAN, PIF.PopHisp, PIF.PopImm, PIF.PopIDU, PIF.PopSub, PIF.PopHIV, PIF.PopOth, PIF.PopSpec, PIF.Updates, PIF.Eval, PIF.TrainingAlert, 
						PIF.CurrentlyEnrolled, PIF.RelevantTraining, PIF.MotivationTraining, PIF.SentFlag, PIF.SentDate, PIF.Created, PIF.CreatedBy, PIF.Updated, PIF.UpdatedBy, 
						PIF.Deleted, PIF.DeletedFlag, PrefPIF.MaxPIFid, PrefPIF.PrinEmpBit, PrefPIF.MaxCreated, PrefPIF.PersonID
	FROM         CTE_PreferredPif AS PrefPIF INNER JOIN
						ceschema.ce_AttendeeCDC AS PIF ON PIF.AttendeeCDCID = PrefPIF.MaxPIFid
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PreferredPifFull', NULL,NULL))
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
	 Begin Table = ''PIF''
		Begin Extent = 
		   Top = 6
		   Left = 227
		   Bottom = 114
		   Right = 395
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''PrefPIF''
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
	Begin ColumnWidths = 73
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
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	 Width = 1500
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PreferredPifFull'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PreferredPifFull', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
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
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PreferredPifFull'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PreferredPifFull', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PreferredPifFull'");
	
	announce("Object:  View [ceschema].[View_FullPIFaudit]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_FullPIFaudit]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_FullPIFaudit]
	AS
	SELECT     TOP (100) PERCENT PifAudit.AttendeeID, Att.ActivityID, Act.Title, Att.PersonID, P.FirstName, P.LastName, PifAudit.NewerPifs, PifAudit.OlderPifs, PifAudit.TotalPifs, 
				  PifAudit.TotalAttended, PifAudit.TotalMissing, Att.CompleteDate, Act.StartDate AS ActivityDate
	FROM         ceschema.View_CdcPifAudit AS PifAudit INNER JOIN
				  ceschema.ce_Attendee AS Att ON PifAudit.AttendeeID = Att.AttendeeID INNER JOIN
				  ceschema.ce_Person AS P ON Att.PersonID = P.PersonID INNER JOIN
				  ceschema.ce_Activity AS Act ON Att.ActivityID = Act.ActivityID
	ORDER BY PifAudit.AttendeeID
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_FullPIFaudit', NULL,NULL))
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
	 Begin Table = ''PifAudit''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 114
		   Right = 189
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Att''
		Begin Extent = 
		   Top = 6
		   Left = 227
		   Bottom = 309
		   Right = 386
		End
		DisplayFlags = 280
		TopColumn = 6
	 End
	 Begin Table = ''P''
		Begin Extent = 
		   Top = 6
		   Left = 424
		   Bottom = 114
		   Right = 590
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Act''
		Begin Extent = 
		   Top = 6
		   Left = 628
		   Bottom = 286
		   Right = 803
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
	Begin ColumnWidths = 10
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
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_FullPIFaudit'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'ceschema', N'VIEW',N'View_FullPIFaudit', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_FullPIFaudit'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_FullPIFaudit', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_FullPIFaudit'");
	
	announce("Object:  Default [DF_ac_object_locked]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_object_locked]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_object]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_object_locked]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_object] ADD  CONSTRAINT [DF_ac_object_locked]  DEFAULT ((0)) FOR [locked]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_operation__create]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_operation__create]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_operation]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_operation__create]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_operation] ADD  CONSTRAINT [DF_ac_operation__create]  DEFAULT ((0)) FOR [_create]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_operation__read]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_operation__read]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_operation]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_operation__read]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_operation] ADD  CONSTRAINT [DF_ac_operation__read]  DEFAULT ((0)) FOR [_read]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_operation__update]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_operation__update]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_operation]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_operation__update]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_operation] ADD  CONSTRAINT [DF_ac_operation__update]  DEFAULT ((0)) FOR [_update]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_operation__delete]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_operation__delete]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_operation]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_operation__delete]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_operation] ADD  CONSTRAINT [DF_ac_operation__delete]  DEFAULT ((0)) FOR [_delete]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_operation_locked]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_operation_locked]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_operation]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_operation_locked]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_operation] ADD  CONSTRAINT [DF_ac_operation_locked]  DEFAULT ((0)) FOR [locked]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_session_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_session_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_session]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_session_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_session] ADD  CONSTRAINT [DF_ac_session_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Group_uuid]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Group_uuid]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_tenant]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Group_uuid]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_tenant] ADD  CONSTRAINT [DF_ce_Group_uuid]  DEFAULT (newid()) FOR [uuid]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Group_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Group_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_tenant]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Group_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_tenant] ADD  CONSTRAINT [DF_ce_Group_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Group_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Group_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_tenant]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Group_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_tenant] ADD  CONSTRAINT [DF_ce_Group_deletedFlag]  DEFAULT (N'N') FOR [deletedflag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_ACL_TenantType_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_ACL_TenantType_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_tenantkind]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_ACL_TenantType_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_tenantkind] ADD  CONSTRAINT [DF_ce_ACL_TenantType_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ac_user_role_tenant_id]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ac_user_role_tenant_id]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ac_user_role]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ac_user_role_tenant_id]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ac_user_role] ADD  CONSTRAINT [DF_ac_user_role_tenant_id]  DEFAULT ((0)) FOR [tenant_id]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Account_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Account_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Account]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Account_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Account] ADD  CONSTRAINT [DF_ce_Account_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Account_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Account_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Account]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Account_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Account] ADD  CONSTRAINT [DF_ce_Account_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Action_Code]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Action_Code]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Action]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Action_Code]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Action] ADD  CONSTRAINT [DF_ce_Action_Code]  DEFAULT (N'U') FOR [Code]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Action_HiddenFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Action_HiddenFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Action]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Action_HiddenFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Action] ADD  CONSTRAINT [DF_ce_Action_HiddenFlag]  DEFAULT (N'N') FOR [HiddenFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Action_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Action_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Action]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Action_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Action] ADD  CONSTRAINT [DF_ce_Action_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Action_MovedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Action_MovedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Action]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Action_MovedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Action] ADD  CONSTRAINT [DF_ce_Action_MovedFlag]  DEFAULT (N'N') FOR [MovedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_SessionType]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_SessionType]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_SessionType]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_SessionType]  DEFAULT (N'S') FOR [SessionType]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_StatMaxRegistrants]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_StatMaxRegistrants]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_StatMaxRegistrants]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_StatMaxRegistrants]  DEFAULT ((0)) FOR [StatMaxRegistrants]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_AttendeeCount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_AttendeeCount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_AttendeeCount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_AttendeeCount]  DEFAULT ((0)) FOR [StatAttendees]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_StatAddlAttendees]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_StatAddlAttendees]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_StatAddlAttendees]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_StatAddlAttendees]  DEFAULT ((0)) FOR [StatAddlAttendees]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_StatCMEHours]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_StatCMEHours]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_StatCMEHours]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_StatCMEHours]  DEFAULT ((0)) FOR [StatCMEHours]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_MDCount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_MDCount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_MDCount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_MDCount]  DEFAULT ((0)) FOR [StatMD]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_NonMDCount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_NonMDCount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_NonMDCount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_NonMDCount]  DEFAULT ((0)) FOR [StatNonMD]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_StatSupporters]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_StatSupporters]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_StatSupporters]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_StatSupporters]  DEFAULT ((0)) FOR [StatSupporters]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_StatSuppAmount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_StatSuppAmount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_StatSuppAmount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_StatSuppAmount]  DEFAULT ((0)) FOR [StatSuppAmount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_refreshFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_refreshFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_refreshFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Activity_refreshFlag]  DEFAULT ((1)) FOR [refreshFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Course_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Course_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Course_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Course_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Course_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Course_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Course_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity] ADD  CONSTRAINT [DF_ce_Course_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_ReceivedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_ReceivedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_ReceivedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_ReceivedFlag]  DEFAULT (N'N') FOR [ReceivedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_SentFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_SentFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_SentFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_SentFlag]  DEFAULT (N'N') FOR [SentFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_ApprovedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_ApprovedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_ApprovedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_ApprovedFlag]  DEFAULT (N'N') FOR [ApprovedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_NeedsFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_NeedsFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_NeedsFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_NeedsFlag]  DEFAULT (N'N') FOR [NeedsFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_ObjFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_ObjFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_ObjFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_ObjFlag]  DEFAULT (N'N') FOR [ObjFlag]
	END
	
	
	End");
	
	
	announce("Object:  Default [DF_ce_Activity_Application_SuppFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_SuppFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_SuppFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_SuppFlag]  DEFAULT (N'N') FOR [SuppFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_AttendFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_AttendFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_AttendFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_AttendFlag]  DEFAULT (N'N') FOR [AttendFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_CVFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_CVFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_CVFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_CVFlag]  DEFAULT (N'N') FOR [CVFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_BrochFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_BrochFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_BrochFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_BrochFlag]  DEFAULT (N'N') FOR [BrochFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_MembApprFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_MembApprFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_MembApprFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_MembApprFlag]  DEFAULT (N'N') FOR [MembApprFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_ConflictFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_ConflictFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_ConflictFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_ConflictFlag]  DEFAULT (N'N') FOR [ConflictFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Application_EvalFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Application_EvalFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Application]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Application_EvalFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Application] ADD  CONSTRAINT [DF_ce_Activity_Application_EvalFlag]  DEFAULT (N'N') FOR [EvalFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Category_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Category_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Category]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Category_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Category] ADD  CONSTRAINT [DF_ce_Activity_Category_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Category_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Category_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Category]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Category_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Category] ADD  CONSTRAINT [DF_ce_Activity_Category_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_LMS_Category_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_LMS_Category_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_CategoryLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_LMS_Category_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_CategoryLMS] ADD  CONSTRAINT [DF_ce_Activity_LMS_Category_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_LMS_Category_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_LMS_Category_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_CategoryLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_LMS_Category_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_CategoryLMS] ADD  CONSTRAINT [DF_ce_Activity_LMS_Category_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Comment_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Comment_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Comment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Comment_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Comment] ADD  CONSTRAINT [DF_ce_Activity_Comment_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Comment_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Comment_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Comment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Comment_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Comment] ADD  CONSTRAINT [DF_ce_Activity_Comment_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCommittee_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCommittee_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Committee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCommittee_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Committee] ADD  CONSTRAINT [DF_ce_CourseCommittee_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCommittee_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCommittee_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Committee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCommittee_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Committee] ADD  CONSTRAINT [DF_ce_CourseCommittee_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Credit_Amount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Credit_Amount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Credit_Amount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Credit] ADD  CONSTRAINT [DF_ce_Activity_Credit_Amount]  DEFAULT ((0)) FOR [Amount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCredit_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCredit_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCredit_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Credit] ADD  CONSTRAINT [DF_ce_CourseCredit_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCredit_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCredit_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Credit]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCredit_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Credit] ADD  CONSTRAINT [DF_ce_CourseCredit_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Faculty_]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Faculty_]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Faculty]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Faculty_]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Faculty] ADD  CONSTRAINT [DF_ce_Activity_Faculty_]  DEFAULT ('n') FOR [CVApproveFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Faculty_DisclosureApproveFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Faculty_DisclosureApproveFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Faculty]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Faculty_DisclosureApproveFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Faculty] ADD  CONSTRAINT [DF_ce_Activity_Faculty_DisclosureApproveFlag]  DEFAULT ('N') FOR [DisclosureApproveFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Faculty_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Faculty_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Faculty]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Faculty_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Faculty] ADD  CONSTRAINT [DF_ce_Activity_Faculty_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Faculty_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Faculty_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Faculty]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Faculty_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Faculty] ADD  CONSTRAINT [DF_ce_Activity_Faculty_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinBudget_Amount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinBudget_Amount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinBudget]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinBudget_Amount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinBudget] ADD  CONSTRAINT [DF_ce_Activity_FinBudget_Amount]  DEFAULT ((0)) FOR [Amount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinBudget_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinBudget_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinBudget]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinBudget_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinBudget] ADD  CONSTRAINT [DF_ce_Activity_FinBudget_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinBudget_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinBudget_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinBudget]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinBudget_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinBudget] ADD  CONSTRAINT [DF_ce_Activity_FinBudget_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinFee_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinFee_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinFee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinFee_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinFee] ADD  CONSTRAINT [DF_ce_Activity_FinFee_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinFee_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinFee_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinFee]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinFee_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinFee] ADD  CONSTRAINT [DF_ce_Activity_FinFee_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinLedger_Amount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinLedger_Amount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinLedger]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinLedger_Amount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinLedger] ADD  CONSTRAINT [DF_ce_Activity_FinLedger_Amount]  DEFAULT ((0)) FOR [Amount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinLedger_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinLedger_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinLedger]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinLedger_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinLedger] ADD  CONSTRAINT [DF_ce_Activity_FinLedger_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_FinLedger_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_FinLedger_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinLedger]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_FinLedger_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinLedger] ADD  CONSTRAINT [DF_ce_Activity_FinLedger_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseContrib_Amount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseContrib_Amount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinSupport]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseContrib_Amount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinSupport] ADD  CONSTRAINT [DF_ce_CourseContrib_Amount]  DEFAULT ((0)) FOR [Amount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseContrib_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseContrib_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinSupport]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseContrib_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinSupport] ADD  CONSTRAINT [DF_ce_CourseContrib_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseContrib_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseContrib_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_FinSupport]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseContrib_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_FinSupport] ADD  CONSTRAINT [DF_ce_CourseContrib_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseNote_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseNote_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Note]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseNote_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Note] ADD  CONSTRAINT [DF_ce_CourseNote_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseNote_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseNote_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Note]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseNote_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Note] ADD  CONSTRAINT [DF_ce_CourseNote_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_DidacticHrs]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_DidacticHrs]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_DidacticHrs]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_DidacticHrs]  DEFAULT ((0)) FOR [DidacticHrs]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_ExperimentalHrs]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_ExperimentalHrs]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_ExperimentalHrs]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_ExperimentalHrs]  DEFAULT ((0)) FOR [ExperimentalHrs]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCDC_SecClinSiteFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCDC_SecClinSiteFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCDC_SecClinSiteFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_CourseCDC_SecClinSiteFlag]  DEFAULT (N'N') FOR [SecClinSiteFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCDC_CollabPTCFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCDC_CollabPTCFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCDC_CollabPTCFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_CourseCDC_CollabPTCFlag]  DEFAULT (N'N') FOR [CollabPTCFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_CourseCDC_CollabAgencyFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_CourseCDC_CollabAgencyFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_CourseCDC_CollabAgencyFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_CourseCDC_CollabAgencyFlag]  DEFAULT (N'N') FOR [CollabAgencyFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_competenceDesign]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_competenceDesign]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_competenceDesign]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_competenceDesign]  DEFAULT ((0)) FOR [competenceDesign]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_performanceDesign]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_performanceDesign]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_performanceDesign]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_performanceDesign]  DEFAULT ((0)) FOR [performanceDesign]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_outcomesDesign]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_outcomesDesign]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_outcomesDesign]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_outcomesDesign]  DEFAULT ((0)) FOR [outcomesDesign]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_competenceEval]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_competenceEval]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_competenceEval]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_competenceEval]  DEFAULT ((0)) FOR [competenceEval]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_performanceEval]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_performanceEval]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_performanceEval]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_performanceEval]  DEFAULT ((0)) FOR [performanceEval]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Other_outcomesEval]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Other_outcomesEval]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Other]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Other_outcomesEval]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Other] ADD  CONSTRAINT [DF_ce_Activity_Other_outcomesEval]  DEFAULT ((0)) FOR [outcomesEval]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubComponent_RequiredFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubComponent_RequiredFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubComponent]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubComponent_RequiredFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubComponent] ADD  CONSTRAINT [DF_ce_Activity_PubComponent_RequiredFlag]  DEFAULT (N'N') FOR [RequiredFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubComponent_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubComponent_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubComponent]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubComponent_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubComponent] ADD  CONSTRAINT [DF_ce_Activity_PubComponent_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubComponent_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubComponent_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubComponent]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubComponent_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubComponent] ADD  CONSTRAINT [DF_ce_Activity_PubComponent_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_PublishFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_PublishFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_PublishFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_PublishFlag]  DEFAULT (N'N') FOR [PublishFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_RequirePayment]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_RequirePayment]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_RequirePayment]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_RequirePayment]  DEFAULT (N'N') FOR [PaymentFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_PaymentFee]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_PaymentFee]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_PaymentFee]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_PaymentFee]  DEFAULT ((0)) FOR [PaymentFee]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_TermsFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_TermsFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_TermsFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_TermsFlag]  DEFAULT (N'N') FOR [TermsFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_AllowFeedback]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_AllowFeedback]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_AllowFeedback]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_AllowFeedback]  DEFAULT (N'Y') FOR [AllowFeedback]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_AllowCommentFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_AllowCommentFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_AllowCommentFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_AllowCommentFlag]  DEFAULT (N'Y') FOR [AllowCommentFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_CommentApproveFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_CommentApproveFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_CommentApproveFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_CommentApproveFlag]  DEFAULT (N'N') FOR [CommentApproveFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_StatViews]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_StatViews]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_StatViews]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_StatViews]  DEFAULT ((0)) FOR [StatViews]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_StatVoteCount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_StatVoteCount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_StatVoteCount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_StatVoteCount]  DEFAULT ((0)) FOR [StatVoteCount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_StatVoteValue]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_StatVoteValue]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_StatVoteValue]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_StatVoteValue]  DEFAULT ((0)) FOR [StatVoteValue]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_FeaturedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_FeaturedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_FeaturedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_FeaturedFlag]  DEFAULT (N'N') FOR [FeaturedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_extHostFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_extHostFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_extHostFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_extHostFlag]  DEFAULT (N'N') FOR [extHostFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_PubGeneral_RestrictedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_PubGeneral_RestrictedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_PubGeneral]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_PubGeneral_RestrictedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_PubGeneral] ADD  CONSTRAINT [DF_ce_Activity_PubGeneral_RestrictedFlag]  DEFAULT (N'N') FOR [RestrictedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Site_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Site_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Site]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Site_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Site] ADD  CONSTRAINT [DF_ce_Activity_Site_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Site_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Site_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Site]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Site_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Site] ADD  CONSTRAINT [DF_ce_Activity_Site_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_SpecialtyLMS_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_SpecialtyLMS_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_SpecialtyLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_SpecialtyLMS_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_SpecialtyLMS] ADD  CONSTRAINT [DF_ce_Activity_SpecialtyLMS_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_SpecialtyLMS_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_SpecialtyLMS_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_SpecialtyLMS]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_SpecialtyLMS_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_SpecialtyLMS] ADD  CONSTRAINT [DF_ce_Activity_SpecialtyLMS_DeletedFlag]  DEFAULT ('N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Step_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Step_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_activity_step]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Step_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_activity_step] ADD  CONSTRAINT [DF_ce_Activity_Step_created]  DEFAULT (getdate()) FOR [created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Step_deletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Step_deletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_activity_step]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Step_deletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_activity_step] ADD  CONSTRAINT [DF_ce_Activity_Step_deletedFlag]  DEFAULT (N'N') FOR [deletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_activity_tag_tagcount]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_activity_tag_tagcount]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_activity_tags]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_activity_tag_tagcount]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_activity_tags] ADD  CONSTRAINT [DF_ce_activity_tag_tagcount]  DEFAULT ((1)) FOR [tagcount]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_activity_tags_hideflag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_activity_tags_hideflag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_activity_tags]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_activity_tags_hideflag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_activity_tags] ADD  CONSTRAINT [DF_ce_activity_tags_hideflag]  DEFAULT ((0)) FOR [hideflag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_User_is_approved]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_User_is_approved]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_activity_user]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_User_is_approved]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_activity_user] ADD  CONSTRAINT [DF_ce_Activity_User_is_approved]  DEFAULT ((0)) FOR [is_approved]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_User_created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_User_created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_activity_user]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_User_created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_activity_user] ADD  CONSTRAINT [DF_ce_Activity_User_created]  DEFAULT (getdate()) FOR [requested_date]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Activity_Vote_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Activity_Vote_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Activity_Vote]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Activity_Vote_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Activity_Vote] ADD  CONSTRAINT [DF_ce_Activity_Vote_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Agenda_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Agenda_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Agenda]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Agenda_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Agenda] ADD  CONSTRAINT [DF_ce_Agenda_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_AssessAnswer_CorrectFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_AssessAnswer_CorrectFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_AssessAnswer_CorrectFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessAnswer] ADD  CONSTRAINT [DF_ce_AssessAnswer_CorrectFlag]  DEFAULT (N'N') FOR [CorrectFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestAnswer_Created]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestAnswer_Created]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestAnswer_Created]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessAnswer] ADD  CONSTRAINT [DF_ce_TestAnswer_Created]  DEFAULT (getdate()) FOR [Created]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_TestAnswer_DeletedFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_TestAnswer_DeletedFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_AssessAnswer]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_TestAnswer_DeletedFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_AssessAnswer] ADD  CONSTRAINT [DF_ce_TestAnswer_DeletedFlag]  DEFAULT (N'N') FOR [DeletedFlag]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Test_MaxAttempts]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Test_MaxAttempts]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Test_MaxAttempts]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Assessment] ADD  CONSTRAINT [DF_ce_Test_MaxAttempts]  DEFAULT ((0)) FOR [MaxAttempts]
	END
	
	
	End");
	
	announce("Object:  Default [DF_ce_Test_RequiredFlag]    Script Date: 05/31/2012 10:19:07");
	execute("IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[ceschema].[DF_ce_Test_RequiredFlag]') AND parent_object_id = OBJECT_ID(N'[ceschema].[ce_Assessment]'))
	Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ce_Test_RequiredFlag]') AND type = 'D')
	BEGIN
	ALTER TABLE [ceschema].[ce_Assessment] ADD  CONSTRAINT [DF_ce_Test_RequiredFlag]  DEFAULT (N'N') FOR [RequiredFlag]
	END
	
	
	End");
	*/
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>

<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB 6">
  <cffunction name="up">
    <cfscript>
   /* announce("Object:  View [ceschema].[View_PreferredPif]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_PreferredPif]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_PreferredPif]
	AS
	SELECT     TOP (100) PERCENT Att.AttendeeID, Att.PersonID, MAX(PIF.AttendeeCDCID) AS MaxPIFid, MAX(CASE PrinEmpId WHEN 15 THEN 0 ELSE 1 END) AS PrinEmpBit, 
				  MAX(PIF.Created) AS MaxCreated
	FROM         ceschema.ce_AttendeeCDC AS PIF INNER JOIN
				  ceschema.ce_Attendee AS Att ON PIF.AttendeeID = Att.AttendeeID
	GROUP BY Att.AttendeeID, Att.PersonID
	ORDER BY PrinEmpBit DESC, MaxCreated DESC
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PreferredPif', NULL,NULL))
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
		   Left = 38
		   Bottom = 114
		   Right = 222
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Att''
		Begin Extent = 
		   Top = 6
		   Left = 260
		   Bottom = 114
		   Right = 435
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
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PreferredPif'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PreferredPif', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PreferredPif'");
	
	announce("Object:  UserDefinedFunction [ceschema].[getActivityTypeByID]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[getActivityTypeByID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'
	
	-- =============================================
	-- Author:		<Author,,Name>
	-- Create date: <Create Date, ,>
	-- Description:	<Description, ,>
	-- =============================================
	CREATE FUNCTION [ceschema].[getActivityTypeByID] 
	(
	@ActivityTypeID int
	)
	RETURNS nvarchar(255) WITH SCHEMABINDING
	AS
	BEGIN
	-- Declare the return variable here
	DECLARE @ActivityTypeName nvarchar(255)
	
	-- Add the T-SQL statements to compute the return value here
	SET @ActivityTypeName = (SELECT Name
	FROM ceschema.ce_Sys_ActivityType
	WHERE ActivityTypeID=@ActivityTypeID)
	
	-- Return the result of the function
	RETURN @ActivityTypeName
	
	END
	
	
	' 
	END");
	
	announce("Object:  View [ceschema].[View_TotalAttendedSTDByPerson]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_TotalAttendedSTDByPerson]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_TotalAttendedSTDByPerson]
	AS
	SELECT     Att.PersonID, COUNT(Att.AttendeeID) AS TotalAttended
	FROM         ceschema.ce_Attendee AS Att INNER JOIN
				  ceschema.ce_Activity_Category AS AC ON Att.ActivityID = AC.ActivityID
	WHERE     (Att.DeletedFlag = ''N'') AND (AC.CategoryID IN (31, 162, 196))
	GROUP BY Att.PersonID, Att.AttendeeID
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_TotalAttendedSTDByPerson', NULL,NULL))
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
		   Bottom = 296
		   Right = 197
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''AC''
		Begin Extent = 
		   Top = 197
		   Left = 271
		   Bottom = 305
		   Right = 449
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
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_TotalAttendedSTDByPerson'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_TotalAttendedSTDByPerson', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_TotalAttendedSTDByPerson'");
	
	announce("Object:  UserDefinedFunction [ceschema].[getGroupingByID]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[getGroupingByID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'
	-- =============================================
	-- Author:		<Author,,Name>
	-- Create date: <Create Date, ,>
	-- Description:	<Description, ,>
	-- =============================================
	CREATE FUNCTION [ceschema].[getGroupingByID] 
	(
	@GroupingID int
	)
	RETURNS nvarchar(255) WITH SCHEMABINDING
	AS
	BEGIN
	-- Declare the return variable here
	DECLARE @GroupingName nvarchar(255)
	
	-- Add the T-SQL statements to compute the return value here
	SET @GroupingName = (SELECT Name
	FROM ceschema.ce_Sys_Grouping
	WHERE GroupingID=@GroupingID)
	
	-- Return the result of the function
	RETURN @GroupingName
	
	END
	
	' 
	END");
	
	announce("Object:  View [ceschema].[View_CdcPifAudit]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_CdcPifAudit]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_CdcPifAudit]
	AS
	SELECT     TOP (100) PERCENT Att.AttendeeID, MAX(AllPeople.PIFCount) AS NewerPifs, MAX(ISNULL(OldPifs.PifCount, 0)) AS OlderPifs, 
				  MAX(AllPeople.PIFCount + ISNULL(OldPifs.PifCount, 0)) AS TotalPifs, MAX(AttendedCounts.TotalAttended) AS TotalAttended, 
				  MAX(AttendedCounts.TotalAttended - (AllPeople.PIFCount + ISNULL(OldPifs.PifCount, 0))) AS TotalMissing
	FROM         ceschema.View_AttendeePifCount AS AllPeople LEFT OUTER JOIN
				  ceschema.View_OldCDCPeople AS OldPifs ON AllPeople.PersonID = OldPifs.PersonID INNER JOIN
				  ceschema.ce_Attendee AS Att ON Att.PersonID = AllPeople.PersonID INNER JOIN
				  ceschema.ce_Activity_Category AS Ac ON Ac.ActivityID = Att.ActivityID INNER JOIN
				  ceschema.ce_Activity AS Act ON Att.ActivityID = Act.ActivityID LEFT OUTER JOIN
				  ceschema.View_TotalAttendedSTDByPerson AS AttendedCounts ON AllPeople.PersonID = AttendedCounts.PersonID LEFT OUTER JOIN
				  ceschema.ce_Person AS P ON AllPeople.PersonID = P.PersonID
	WHERE     (Ac.CategoryID IN (31, 162, 196)) AND (Att.DeletedFlag = ''N'') AND (Act.DeletedFlag = ''N'') AND (Act.StatusID IN (1, 2, 3)) AND (P.DeletedFlag = ''N'')
	GROUP BY Att.AttendeeID
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_CdcPifAudit', NULL,NULL))
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
	 Begin Table = ''AllPeople''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 265
		   Right = 189
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''OldPifs''
		Begin Extent = 
		   Top = 6
		   Left = 227
		   Bottom = 286
		   Right = 378
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Att''
		Begin Extent = 
		   Top = 6
		   Left = 416
		   Bottom = 291
		   Right = 575
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Ac''
		Begin Extent = 
		   Top = 12
		   Left = 802
		   Bottom = 334
		   Right = 980
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''Act''
		Begin Extent = 
		   Top = 146
		   Left = 822
		   Bottom = 254
		   Right = 997
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''P''
		Begin Extent = 
		   Top = 257
		   Left = 17
		   Bottom = 365
		   Right = 183
		End
		DisplayFlags = 280
		TopColumn = 0
	 End
	 Begin Table = ''AttendedCounts''
		Begin Extent = 
		   Top = 240
		   Left = 596
		   Bottom = 318
		   Right = 747
		End
		DisplayFlags = 280
	   ' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_CdcPifAudit'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'ceschema', N'VIEW',N'View_CdcPifAudit', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' TopColumn = 0
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
	 Width = 2355
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
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_CdcPifAudit'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_CdcPifAudit', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_CdcPifAudit'");
	
	announce("Object:  View [ceschema].[View_PersonEmailHostStats]    Script Date: 05/31/2012 10:19:08");
	execute("SET ANSI_NULLS ON");
	
	execute("SET QUOTED_IDENTIFIER ON");
	
	execute("IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ceschema].[View_PersonEmailHostStats]'))
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ceschema].[View_PersonEmailHostStats]
	AS
	SELECT     TOP (100) PERCENT EmailHost, COUNT(Email) AS EmailCount
	FROM         ceschema.View_PersonEmailHosts
	GROUP BY EmailHost
	ORDER BY EmailCount DESC, EmailHost
	'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PersonEmailHostStats', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
	Begin DesignProperties = 
	Begin PaneConfigurations = 
	Begin PaneConfiguration = 0
	 NumPanes = 4
	 Configuration = ''(H (1[21] 4[23] 2[11] 3) )''
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
	 Begin Table = ''View_PersonEmailHosts (ceschema)''
		Begin Extent = 
		   Top = 6
		   Left = 38
		   Bottom = 162
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
	 Filter = 1350
	 Or = 1350
	 Or = 1350
	 Or = 1350
	End
	End
	End
	' , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PersonEmailHostStats'");
	
	execute("IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'ceschema', N'VIEW',N'View_PersonEmailHostStats', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'ceschema', @level1type=N'VIEW',@level1name=N'View_PersonEmailHostStats'");
	*/
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>

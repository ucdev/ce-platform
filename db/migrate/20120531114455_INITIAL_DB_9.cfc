<cfcomponent extends="plugins.dbmigrate.Migration" hint="INITIAL DB 9">
  <cffunction name="up">
    <cfscript>
  	/*execute("IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ceschema].[mergeToContent]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	execute dbo.sp_executesql @statement = N'
	
	CREATE FUNCTION [ceschema].[mergeToContent] 
	(
	@Type nchar(1),
	@TypeID int,
	@StyleID int,
	@MinHistoryID int,
	@MaxHistoryID int
	)
	RETURNS nvarchar(max)
	AS
	BEGIN
		-- Declare the return variable here
		DECLARE @Output nvarchar(max) 
		SET @Output = ''<div class=''''history-subbox-title''''>Related Details</div>'';
		IF @Type = ''A''
		BEGIN
			SELECT TOP 10 @Output = COALESCE(@Output + '' '','''') + 
			''<div class=''''([a-zA-Z0-9\_\-]+)''''>'' +
			''	<div class=''''([a-zA-Z0-9\_\-]+)''''>'' +
			''	<span class=''''([a-zA-Z0-9\_\-]+)'''' title=''' + 
					LEFT(CONVERT(varchar, Created, 126),LEN(CONVERT(varchar, Created, 126))-4) + 
			'''>'' + 
					LEFT(CONVERT(varchar, Created, 126),LEN(CONVERT(varchar, Created, 126))-4) + 
			''	</span>'' +
			''	</div>'' +
			''	<div class=''''([a-zA-Z0-9\_\-]+)''''>'' + 
				Replace(Replace(ToContent,''<br>'','' / ''),''<br />'','' / '') + 
			''	</div>'' +
			''</div>''
			FROM [ceschema].[View_History]
			WHERE HistoryID BETWEEN @MinHistoryID AND @MaxHistoryID AND ToActivityID=@TypeID
			AND HistoryStyleID=@StyleID
			ORDER BY Created DESC
		END
		
		IF @Type = ''P''
		BEGIN
			SELECT TOP 10 @Output = COALESCE(@Output + '' '','''') + ''<div class=''''([a-zA-Z0-9\_\-]+)''''><span class=''''([a-zA-Z0-9\_\-]+)'''' title=''' + LEFT(CONVERT(varchar, Created, 126),LEN(CONVERT(varchar, Created, 126))-4) + '''>'' + LEFT(CONVERT(varchar, Created, 126),LEN(CONVERT(varchar, Created, 126))-4) + ''</span> '' + Replace(Replace(ToContent,''<br>'','' / ''),''<br />'','' / '') + ''</div>''
			FROM [ceschema].[View_History]
			WHERE HistoryID BETWEEN @MinHistoryID AND @MaxHistoryID AND ToPersonID=@TypeID AND HistoryStyleID=@StyleID
			ORDER BY Created DESC
		END
		-- Return the result of the function
		RETURN @Output
		
	END
	' 
	END");*/
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    
    </cfscript>
  </cffunction>
</cfcomponent>

<cfcomponent displayname="Page" hint="All things pages..." output="no">
	<cfinclude template="/_com/_UDF/HTMLSafe.cfm" />
	<cffunction name="ParseCrumbs" access="public" returntype="string" displayname="ParseCrumb" hint="Parses Breadcrumbs in format 'PageName|FuseAction,PageName|FuseAction,PageName|Fuseaction'">
		<cfargument name="Crumbs" type="string" required="yes">
		
		<cfset Variables.FormattedCrumbs = "">
		<cfset CrumbCount = ListLen(Arguments.Crumbs,",")>
		<cfset CrumbCurrent = 1>
		<cfloop list="#Arguments.Crumbs#" index="crumb" delimiters=",">
			<cfset Variables.Crumby.Name = GetToken(crumb,1,"|")>
			<cfset Variables.Crumby.Fuseaction = GetToken(crumb,2,"|")>
			<cfif Variables.Crumby.Fuseaction EQ "None" OR Variables.Crumby.Fuseaction EQ Variables.Crumby.Name>
			<cfset Variables.FormattedCrumbs = ListAppend(Variables.FormattedCrumbs,"#Variables.Crumby.Name#","|")>
			<cfelse>
			<cfif CrumbCurrent EQ CrumbCount>
				<cfset Variables.FormattedCrumbs = ListAppend(Variables.FormattedCrumbs,"<a href=""#request.myself##Variables.Crumby.Fuseaction#"" title=""#HTMLSafe(Variables.Crumby.Name)#"" class=""Crumb"">#Variables.Crumby.Name#&nbsp;<img src=""/_images/bullet_go.gif"" align=""absmiddle"" /></a>","|")>
			<cfelse>
				<cfset Variables.FormattedCrumbs = ListAppend(Variables.FormattedCrumbs,"<a href=""#request.myself##Variables.Crumby.Fuseaction#"" title=""#HTMLSafe(Variables.Crumby.Name)#"" class=""Crumb"">#Variables.Crumby.Name#&nbsp;<img src=""/_images/bullet_go.gif"" align=""absmiddle"" /></a>","|")>
			</cfif>
			<cfset CrumbCurrent = CrumbCurrent + 1>
			</cfif>
		</cfloop>
		
		<cfset Variables.FormattedCrumbs = Replace(Variables.FormattedCrumbs,"|","","ALL")>
		<!--- QUERY STRING PROCESSOR --->
		<cfset Variables.FormattedCrumbs = Replace(Variables.FormattedCrumbs,"+","&amp;","ALL")>
		<cfreturn Variables.FormattedCrumbs>
	</cffunction>
	
	<cffunction name="Get" Displayname="Get" hint="Retrieves Page Info based on FuseAction or PageID passed." access="public" output="no" returntype="struct">
		<cfargument name="Identifier"  displayname="PageID or FuseAction" type="string" required="yes">

		<cfset Variables.Page = StructNew()>
		<cfset Variables.Page.ID = 0>
		<cfset Variables.Page.Title = "">
		<cfset Variables.Page.Description = "">
		<cfset Variables.Page.Filename = "">
		<cfset Variables.Page.Created = "">
		<cfset Variables.Page.Updated = "">
		<cfset Variables.Page.Deleted = "">
		<cfset Variables.Page.DeletedFlag = "">

		<cfquery name="qGetPage" datasource="#Application.Settings.DSN#">
			SELECT 
				 PageID
				,Title
				,Description
                ,Filename
				,Created
				,Updated
				,Deleted
				,DeletedFlag
			FROM ce_Page
			<cfif isNumeric(Arguments.Identifier)>
			WHERE PageID=<cfqueryparam value="#Arguments.Identifier#" cfsqltype="cf_sql_integer" />
			<cfelse>
			WHERE Filename=<cfqueryparam value="#Arguments.Identifier#" cfsqltype="cf_sql_varchar" />
			</cfif>
		</cfquery>
		
		<cfif qGetPage.RecordCount EQ 1>
			<cfset Variables.Page.ID = qGetPage.PageID>
			<cfset Variables.Page.Title = qGetPage.Title>
			<cfset Variables.Page.Description = qGetPage.Description>
			<cfset Variables.Page.Filename = qGetPage.Filename>
			<cfset Variables.Page.Created = qGetPage.Created>
			<cfset Variables.Page.Updated = qGetPage.Updated>
			<cfset Variables.Page.Deleted = qGetPage.Deleted>
			<cfset Variables.Page.DeletedFlag = qGetPage.DeletedFlag>
		</cfif>
		
		<cfreturn Variables.Page />
	</cffunction>
</cfcomponent>
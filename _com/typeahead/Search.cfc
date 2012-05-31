<cfcomponent displayname="" output="no">
	<cfset variables.searches = "activity,person,entities" />
	<cfset variables.usrImagePath = "/_com/image.cfc?method=view&size=i&image=" />
	<cfset variables.noPhotoImages = "/static/images/no-photo/" />
	
	<cffunction name="init" access="public" output="no" returntype="_com.typeAhead.search">
		<cfargument name="dsn" type="string" required="yes" />
		
		<cfset variables.dsn = arguments.dsn />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="activity" hint="returns activity list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.activityId,
				text = obj.title + isNull((CASE WHEN isNull(obj.startDate,'') <> '' THEN ' - ' + isNull(CONVERT(char(10), obj.startdate, 101),'') END),''),
				subtext1 = 'Start Date: ' + isNull(CONVERT(char(10), obj.startdate, 101),''),
				subtext2 = isNull(obj.ActivityType,'') + ' / ' + isNull(obj.Grouping,''),
				image = CASE
					WHEN isNull(actProf.primary_image_id,0) <= 0 THEN '/static/images/no-photo/activity_i.png'
					ELSE '/_com/image.cfc?method=view&image=' + CAST(actProf.primary_image_id As nvarchar(10)) + '&size=i'
					END,
				fts.[rank],
				link = '/admin/index.cfm?event=activity.detail&activityId=' + CAST(obj.activityId As nvarchar(12)),
				type = 'activity'
			FROM 
			ceschema.view_Activities AS obj
			LEFT JOIN ceschema.ce_activity_profile As actProf ON actProf.activity_Id = obj.activityid
			INNER JOIN
			CONTAINSTABLE(ceschema.view_Activities, (searchAll), @search) AS fts ON obj.activityId = fts.[KEY] 
			ORDER BY fts.[RANK] DESC,obj.startDate DESC,obj.activityId DESC
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="all" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var aResults = "" />
		<cfset var count = 0 />
		<cfset var types = [] />
		<cfset var query = queryNew("item_id,text,subtext1,subtext2,image,rank,link,type") />
		
		<cfloop list="#variables.searches#" delimiters="," index="i">
			<cfset search = evaluate(i & '("' & arguments.q & '","' & arguments.max & '")') />
			<cfif search.recordcount>
				<cfset search = application.udf.queryAppend(query,search) />
			</cfif>
		</cfloop>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="city" hint="returns folders list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.geonameid,
				text = obj.name + isNull((CASE WHEN isNull(admin1_code,'') <> '' THEN ', ' + admin1_code END),''),
				subtext1 = '',
				subtext2 = '',
				image = '/static/images/no-photo/map_i.png',
				fts.[rank],
				link = '',
				type = 'city'
			FROM 
			ceschema.View_geonameCities AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.View_geonameCities, (searchText), @search) AS fts ON obj.geonameid = fts.[KEY] 
			ORDER BY fts.[RANK] DESC
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="country" hint="returns country list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.id,
				text = obj.name,
				subtext1 = '',
				subtext2 = '',
				image = '/static/images/no-photo/map_i.png',
				fts.[rank],
				link = '',
				type = 'country'
			FROM 
			ceschema.ce_Sys_Country AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_Sys_Country, (name), @search) AS fts ON obj.id = fts.[KEY] 
			ORDER BY fts.[RANK] DESC
		</cfquery>

		<cfreturn query />
	</cffunction>
	
	<cffunction name="credits" hint="returns credits list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- Ensure browser reads this as raw javascript --->
		<cfcontent type="text/javascript" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT
				TOP (@maxrows)
				item_id = obj.id,
				text = obj.creditName,
				subtext1 = obj.bodyName,
				subtext2 = provider.name,
				image = '/static/images/no-photo/none_i.png',
				fts.[rank],
				link = '',
				type = 'credit',
				payload = '{ providerId:' + CAST(provider.id As nvarchar(15)) + ', bodyId:' + CAST(obj.body_entity_id As nvarchar(15)) + ',creditId:' + CAST(obj.credit_Id As nvarchar(15)) + ' }'
			FROM 
			ceschema.View_accreditedProviders AS obj
			INNER JOIN
				ceschema.ce_entity As provider ON provider.id = obj.entity_id
			INNER JOIN
			CONTAINSTABLE(ceschema.View_accreditedProviders, (searchable), @search) AS fts ON obj.id = fts.[KEY] 
			ORDER BY fts.[RANK] DESC
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="degrees" hint="returns degree types for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT TOP (@maxrows) 
				item_id = obj.id,
				text = obj.abbrv,
				subtext1 = obj.name,
				subtext2 = '',
				image = '/static/images/no-photo/degree_i.png',
				fts.[rank],
				link = '',
				type = 'degree'
				
			FROM 
			ceschema.ce_degree AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_degree, (name,abbrv), @search) AS fts ON obj.id = fts.[KEY] 
		</cfquery>

		<cfreturn query />
	</cffunction>
	
	<cffunction name="entities" hint="returns entities for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfreturn query />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			DECLARE @staticPath nvarchar(100); /* domain or absolute path to static content like images, scripts, etc. */
			DECLARE @userImgPath nvarchar(100); /* image uploads */
			SET @staticPath = '/static/';
			SET @userImgPath = '/_uploads/images/';
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT TOP (@maxrows) 
				item_id = obj.id,
				text = obj.name,
				subtext1 = '',
				subtext2 = '',
				image = 
					CASE 
						WHEN isNull(obj.primary_image_id,0) > 0 THEN
							@userImgPath + CAST(obj.primary_image_id As nvarchar) + '_i.jpg'
						ELSE
							@staticPath + 'images/no-photo/entity_i.png'
					END,
				fts.[rank],
				link = '/admin/index.cfm?event=entity.general&entityId=' + CAST(obj.id As nvarchar(12)),
				type = 'entity'
			FROM 
			ceschema.ce_entity AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_entity, (name), @search) AS fts ON obj.id = fts.[KEY]
			ORDER BY fts.[rank]
		</cfquery>
		
		<cfreturn query />
	</cffunction>
		
	<cffunction name="folders" hint="returns folders list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- Ensure browser reads this as raw javascript --->
		<cfcontent type="text/javascript" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.categoryid,
				text = obj.name,
				subtext1 = '',
				subtext2 = '',
				image = '/static/images/no-photo/folder_i.png',
				fts.[rank],
				link = '/admin/index.cfm?event=main.search&type=activity&folder=' + CAST(obj.categoryid As nvarchar(12)),
				type = 'folder'
			FROM 
			ceschema.ce_category AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_category, (name), @search) AS fts ON obj.categoryid = fts.[KEY] 
			ORDER BY fts.[RANK] DESC
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="occupation" hint="returns occupation list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />

		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.id,
				text = obj.name,
				subtext1 = '',
				subtext2 = '',
				image = '/static/images/no-photo/occupation_i.png',
				fts.[rank],
				link = '',
				type = 'occupation'
			FROM 
			ceschema.ce_occupation AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_occupation, (name), @search) AS fts ON obj.id = fts.[KEY] 
			ORDER BY fts.[RANK] DESC
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="person" hint="returns person list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.personId,
				text = obj.displayName,
				subtext1 = isNull((CASE WHEN isNull(obj.email,'') <> '' THEN ISNULL(obj.email,'') END),''),
				subtext2 = 
				isNull((CASE WHEN isNull(obj.birthdate,'') <> '' THEN 'DOB: ' + ISNULL(CONVERT(char(10), obj.birthdate, 101),'') END),'') + ' ' + 
				isNull((CASE WHEN isNull(obj.SSN,'') <> '' THEN 'PIN: ' + obj.SSN END),''),
				image = CASE
					WHEN isNull(usr.primary_image_id,0) <= 0 THEN '/static/images/no-photo/person_i.png'
					ELSE '/_com/image.cfc?method=view&image=' + CAST(usr.primary_image_id As nvarchar(10)) + '&size=i'
					END,
				fts.[rank],
				link = '/admin/index.cfm?event=person.detail&personId=' + CAST(obj.personId As nvarchar(12)),
				type = 'person'
			FROM 
			ceschema.view_people AS obj
			LEFT JOIN 
			ceschema.ce_Person_User As usr ON usr.person_id=obj.personid
			INNER JOIN
			CONTAINSTABLE(ceschema.view_people, (searchAll), @search) AS fts ON obj.personId = fts.[KEY] 
			ORDER BY fts.[RANK] DESC,obj.personId DESC
		</cfquery>
        
		<cfreturn query />
	</cffunction>
	
	<cffunction name="searchFormatter" hint="formats search query string for full-text methods" access="private" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes" />
		
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset arguments.q = removeSQLStops(arguments.q," ") />
		<cfset aKeywords = listToArray(arguments.q,' ') />
		<!--- PARTIAL --->
		<cfset searchStr = searchStr & "(">
		<cfloop from="1" to="#arrayLen(aKeywords)#" index="i">
				<cfset searchStr = searchStr & '"#aKeywords[i]#*"'>	
				
				<cfif arrayLen(aKeywords) NEQ i>					
					<cfset searchStr = searchStr & " AND ">	
				</cfif>
		</cfloop>
		<cfset searchStr = searchStr & ") OR (" />
		<cfset searchStr = searchStr & '"#arguments.q#*"'>	
		<cfset searchStr = searchStr & ")">
		<cfset searchExact = searchStr />
		
		<cfset searchStr = searchStr & " OR ">
		
		<!--- INFLECTIONAL --->
		<cfset searchStr = searchStr & "(FORMSOF(INFLECTIONAL,""">
		<cfloop from="1" to="#arrayLen(aKeywords)#" index="i">
				<cfset searchStr = searchStr & "#aKeywords[i]#">	
				
				<cfif arrayLen(aKeywords) NEQ i>					
					<cfset searchStr = searchStr & " ">	
				</cfif>
		</cfloop>
		<cfset searchStr = searchStr & """))">
		
		<cfset searchStr = searchStr & " OR ">
		
		<!--- THESAURUS --->
		<cfset searchStr = searchStr & "(FORMSOF(THESAURUS,""">
		<cfloop from="1" to="#arrayLen(aKeywords)#" index="i">
				<cfset searchStr = searchStr & "#aKeywords[i]#">	
				
				<cfif arrayLen(aKeywords) NEQ i>					
					<cfset searchStr = searchStr & " ">	
				</cfif>
		</cfloop>
		<cfset searchStr = searchStr & """))">
		
		<cfreturn searchStr />
	</cffunction>
	
	<cffunction name="specialties" hint="returns specialties for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT TOP (@maxrows) 
				item_id = obj.specialtyId,
				text = obj.name,
				subtext1 = '',
				subtext2 = '',
				image = '/static/images/no-photo/specialty_i.png',
				fts.[rank],
				link = '',
				type = 'specialty'
			FROM
			ceschema.ce_sys_specialtyLMS AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_sys_specialtyLMS, name, @search) AS fts ON obj.specialtyid = fts.[KEY] 
		</cfquery>

		<cfreturn query />
	</cffunction>
	
	<cffunction name="state" hint="returns state list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			
			SELECT 
				TOP (@maxrows)
				item_id = obj.stateId,
				text = obj.name,
				subtext1 = '',
				subtext2 = '',
				image = '/static/images/no-photo/map_i.png',
				fts.[rank],
				link = '',
				type = 'state'
			FROM 
			ceschema.ce_Sys_State AS obj
			INNER JOIN
			CONTAINSTABLE(ceschema.ce_Sys_State, (name), @search) AS fts ON obj.stateId = fts.[KEY] 
			ORDER BY fts.[RANK] DESC
		</cfquery>

		<cfreturn query />
	</cffunction>
	
	<cffunction name="user_activity" hint="returns activity list for typeahead" access="public" returntype="query" output="no">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		<cfargument name="user_id" type="numeric" required="yes" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var returnVar = "" />
		
		<!--- fail out if no query passed --->
		<cfif len(arguments.q) LTE 0>
			<cfset returnVar = [] />
			<cfreturn returnVar />
			<cfabort>
		</cfif>
		
		<!--- prepares raw search string for full-text FORMSOF Inflectional, Partial, Thesaurus, etc.
		searchFormatter() is a private function at the bottom --->
		<cfset searchStr = searchFormatter(arguments.q) />
		
		<cfquery name="query" datasource="#variables.dsn#">
			DECLARE @search nvarchar(500);
			DECLARE @maxrows int;
			DECLARE @user_id int;
			
			SET @search = <cfqueryparam value="#searchStr#" cfsqltype="cf_sql_varchar" />;
			SET @maxrows = <cfqueryparam value="#arguments.max#" cfsqltype="cf_sql_integer" />;
			SET @user_id = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer" />;
			
			WITH CTE_Grouped AS (
				SELECT 
					TOP 10
					activity_id,
					user_id,
					role_id,
					max(history.created) As last_touch
				FROM 
					ceschema.ce_activity_user act_user
				LEFT JOIN
					ceschema.ce_History As history ON history.ToActivityID=act_user.activity_id AND history.FromPersonID=act_user.user_id
				INNER JOIN 
					CONTAINSTABLE(ceschema.view_activities, (searchAll), @search) AS fts ON act_user.activity_id = fts.[KEY]
				WHERE
					(user_id = @user_id)
				GROUP BY activity_id,user_id,role_id,fts.[rank]
				ORDER BY fts.[rank] DESC,max(history.created) DESC
			)
			SELECT 
				CTE.activity_id,
				title,
				startDate As [start_date],
				activityType As [type],
				[grouping],
				[sessionType] As session_type,
				[image] = (CASE 
								WHEN isNull(act_prof.primary_image_id,0) > 0 THEN
									'/_com/image.cfc?method=view&size=i&image=' + CAST(act_prof.primary_image_id As nvarchar(25))
								ELSE
									'/static/images/no-photo/activity_i.png'
							END)
			FROM 
				CTE_Grouped As CTE
			INNER JOIN 
				ceschema.View_Activities As activity ON activity.activityid = CTE.activity_id
			LEFT JOIN 
				ceschema.ce_activity_profile As act_prof ON act_prof.activity_id = activity.activityid
			ORDER BY last_touch DESC;
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="wikipedia" hint="returns wikipedia list for typeahead" access="remote" output="no" returnformat="plain">
		<cfargument name="q" type="string" required="no" default="" />
		<cfargument name="max" type="numeric" required="no" default="10" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var aResult = arrayNew(1) />
		<cfset var resultItem = "" />
		<cfset var returnVar = "" />
		
		<!--- Ensure browser reads this as raw javascript --->
		<cfcontent type="text/javascript" />
		<cfhttp method="get" result="objGet" url="http://en.wikipedia.org/w/api.php">
			<cfhttpparam name="apfrom" type="url" value="#arguments.q#" />
			<cfhttpparam name="apfilterredir" type="url" value="nonredirects" />
			<cfhttpparam name="list" type="url" value="allpages" />
			<cfhttpparam name="action" type="url" value="query" />
			<cfhttpparam name="aplimit" type="url" value="#arguments.max#" />
			<cfhttpparam name="format" type="url" value="json" />

		</cfhttp>
		
		<cfset data = deserializeJSON(objGet.fileContent) />
		<cfset pages = data.query.allpages />
		
		<cfloop from="1" to="#arrayLen(pages)#" index="i">
			<cfset item = pages[i] />
			<cfset resultItem = structNew() />
			<cfset resultItem.item_id = item.pageid />
			<cfset resultItem.text = item.title />
			<cfset resultItem.subtext1 = '' />
			<cfset resultItem.subtext2 = '' />
			<cfset resultItem.image = '/static/images/no-photo/none_i.png' />
			<cfset resultItem.rank = 0 />
			
			<cfset arrayAppend(aResult,resultItem) />
		</cfloop>
		
		<cfif arrayLen(aResults) GT 0>
			<cfset returnVar.setStatus(true) />
			<cfset returnVar.setStatusMsg('Search completed successfully.') />
			<cfset returnVar.setPayload(aResults) />
		</cfif>
		
		<cfreturn returnVar />
	</cffunction>
    
	<cffunction name="wikipedia_image" hint="returns wikipedia image for selection" access="remote" output="no" returnformat="plain">
		<cfargument name="q" type="string" required="no" default="" />
		
		<cfset var query = "" />
		<cfset var searchStr = "" />
		<cfset var aResults= [] />
		<cfset var aResult = arrayNew(1) />
		<cfset var resultItem = "" />
		
		<!--- Ensure browser reads this as raw javascript --->
		<cfcontent type="text/javascript" />
		
		<cfhttp method="get" result="objGet" url="http://en.wikipedia.org/w/api.php">
			<cfhttpparam name="apfrom" type="url" value="#arguments.q#" />
			<cfhttpparam name="apfilterredir" type="url" value="nonredirects" />
			<cfhttpparam name="list" type="url" value="allpages" />
			<cfhttpparam name="action" type="url" value="query" />
			<cfhttpparam name="aplimit" type="url" value="1" />
			<cfhttpparam name="format" type="url" value="json" />
		</cfhttp>
		
		<cfset wikiApi = deserializeJson(objGet.fileContent) />
		<cfset title = wikiApi.query.allpages[1].title />
		
		<cfset wikiImageSrc = application.extUrlHandler.httpParse('http://en.wikipedia.org/wiki/#title#','images').images[1].src />
		
		<cfreturn wikiImageSrc />
	</cffunction>
	
	<cfscript>
	/**
	 * Removes ms sql freetext stop words from a sting.
	 * 
	 * @param TheList 	 List of items to check. (Required)
	 * @param delims 	 List of delimiters. Defaults to a comma. (Optional)
	 * @return Returns a string. 
	 * @author Joe Graves (&#106;&#111;&#101;&#64;&#115;&#116;&#97;&#103;&#105;&#110;&#103;&#114;&#111;&#111;&#109;&#46;&#99;&#111;&#109;) 
	 * @version 1, August 10, 2007 
	 */
	/**
	 * Remove Stop words from list for SQL FreeText Search.
	 * 
	 * @function:  RemoveSQLStops
	 * @param required: TheList
	 * @param dilims optional: The delimiters add as the second argument
	 * @return a string with stop words removed.
	 * @syntax default: RemoveSQLStops("The,stuff,to,remove")
	 * @syntax optional delimiter: RemoveSQLStops("The stuff to remove", " ")
	 * @author Joe Graves StagingRoom.com (joe@stagingroom.com) 
	 * @version 1, 12/08/2006 
	 */
	function removeSQLStops(TheList){
	// list of stop words 
	var TheStopList="a,about,1,after,2,all,also,3,an,4,and,5,another,6,any,7,are,8,as,9,at,0,be,$,because,been,before,being,between,both,but,by,came,can,come,could,did,do,each,for,from,get,got,has,had,he,have,her,here,him,himself,his,how,if,in,into,is,it,like,make,many,me,might,more,most,much,must,my,never,now,of,on,only,or,other,our,out,over,said,same,see,should,since,some,still,such,take,than,that,the,their,them,then,there,these,they,this,those,through,to,too,under,up,very,was,way,we,well,were,what,where,which,while,who,with,would,you,your";
	
	var delims = ",";
	var i=1;
	var OriginalSize=0;
	var results="";
	
	//check for declared delimiter
	if(arrayLen(arguments) gt 1) delims = arguments[2];
	
	// get the size of the list
	OriginalSize=listlen(TheList,delims);
	
	// loop over the list and search for stop words
		for(; i lte OriginalSize; i=i+1){
		//if the word is not in the stop word list add it to the results
			if(ListFindNoCase(TheStopList, ListGetAt(TheList,i,delims),"," ) EQ 0) {
		// word a are added to new list (list is returned with the same delimiter passed in to the function) 
					results=ListAppend(results,(ListGetAt(TheList,i,delims)),delims);
				}
			}
			return results;
	}
	</cfscript>
</cfcomponent>
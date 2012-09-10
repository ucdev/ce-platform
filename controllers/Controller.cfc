<cfcomponent extends="Wheels">
	<cffunction name="init">
		<cfset filters(through="autoSetup") />
		<cfset filters(through="autoLayout",type="after",except="sprites") />
		<cfset filters(through="pagelet",type="before") />
		<cfset filters(through="setUserInfo",type="before") />
		<cfset filters(through="loadTmpls",type="before") />
	</cffunction>
	
	<cffunction name="loadTmpls">
		<cfparam name="params.controller" type="string" default="">
		
		<!--- <cfset var tmpls = "" />
		<cfset var tmplContent = {} />
		<cfif len(trim(params.controller)) GT 0>
			<cfset tmplDir = expandPath("/views/#params.controller#/templates/") />
			
			<cfif NOT directoryExists(tmplDir)>
				<cfdirectory action="create" directory="#tmplDir#">
			</cfif>
		
			<cfdirectory action="list" directory="#tmplDir#" filter="*.cfm" name="tmpls">
			<cfloop query="tmpls">
				<cfset partialName = replace(replace(tmpls.name,"_",""),".cfm","") />
				<cfset tmplKey = trim(params.controller) & "-" & trim(partialName) />
				<cfset tmplContent[lcase(tmplKey)] = renderPartial(partial="templates/#partialName#",returnAs="string") />
			</cfloop>
		</cfif>
		
		<cfset ejsTemplates = tmplContent /> --->
	</cffunction>
	
	<cffunction name="setUserInfo">
		<cfif structKeyExists(session,'currentUser') AND isObject(session.currentuser)>
			<cfset userInfo = duplicate(session.currentUser.properties()) />
			<cfset structDelete(userInfo,'password') />
			<cfset userInfo['loggedIn'] = true />
			<cfset userInfo['account'] = duplicate(session.account.properties()) />
		<cfelse>
			<cfset userInfo = {
				'loggedIn':false,
				'id':0,
				'name':'Anonymous Amos',
				'account':{}
			} />
		</cfif>
	</cffunction>
	
	<cffunction name="pagelet">
		<cfparam name="params.controller" default="" />
		<cfparam name="params.action" default="" />
		
		<cfparam name="params.pagelet" default="#lcase("#params.controller#_#params.action#")#" />
		<cfparam name="params.pagelet_token" default="#lcase(left(HASH(params.pagelet,'MD5'),6))#" />
		<cfparam name="params.version_token" default="#application.version_token#" />
	</cffunction>
	
	<cffunction name="autoSetup">
		<cfparam name="params.controller" default="" />
		
		<cfif params.controller CONTAINS "activity_" AND listFindNoCase("edit,index,new,create,update",params.action,',')>
			<cfset $setActivity() />
		<cfelseif params.controller CONTAINS "person_" AND listFindNoCase("edit,index,new,create,update",params.action,',')>
			<cfset $setPerson() />
		<cfelseif params.controller EQ "activities" AND listFindNoCase("edit",params.action)>
			<cfset $setActivity() />
		</cfif>
	</cffunction>
	
	<cffunction name="autoLayout">
		<cfparam name="params.controller" default="" />
		<cfparam name="params.showInfoBar" default="true" />
		<cfparam name="params.layout" default="" />
        
        <cfset var settings = {
        	"subLayout":"/layout_basic",
        	"rootLayout":"/layout"
        } />
        <cfif len(trim(params.layout)) EQ 0>
			<cfif params.controller CONTAINS "activity_" AND listFindNoCase("edit,index,new,create,loaddata,update,requests",params.action,',')>
                <cfset settings.subLayout = "/layout_adm_activity" />
            <cfelseif params.controller CONTAINS "person_" AND listFindNoCase("edit,index,new,create,update",params.action,',')>
                <cfset settings.subLayout = "/layout_adm_person" />
            <cfelseif params.controller EQ "activities" AND listFindNoCase("edit",params.action)>
                <cfset settings.subLayout = "/layout_adm_activity" />
			<cfelseif params.controller EQ "activities" AND listFindNoCase("show",params.action)>
				<cfset settings.subLayout = "/layout_pub_activity" />
			<cfelseif params.controller EQ "messages" AND listFindNoCase("inbox,sent,trash",params.action)>
				<cfset settings.subLayout = "/layout_user" />
			<cfelseif listFindNoCase("sessions,people",params.controller) AND listFindNoCase("new,register",params.action)>
				<cfset settings.rootLayout = "/layout_auth" />
				<cfset settings.subLayout = "" />
			<cfelseif params.controller EQ "creditinator">
				<cfset settings.rootLayout = "/creditinator/layout" />
				<cfset settings.subLayout = "" />
			<cfelse>
					<cfset settings.rootLayout = "/layout" />
					<cfif isLoggedIn()>
						<cfset settings.subLayout = "/layout_user" />
					<cfelse>
						<cfset settings.subLayout = "/layout_guest" />
					</cfif>
            </cfif>

            <cfset configLayouts(argumentCollection=settings) />
        <cfelse>
        	<cfset settings.subLayout = "/layout_#params.layout#" />
        	<cfset configLayouts(argumentCollection=settings) />
        </cfif>
	</cffunction>
	
	<cffunction name="showInfoBar">
		<cfargument name="infoBar" type="boolean" required="no" default="true" />
		
		<cfset params.showInfoBar = arguments.infobar />
	</cffunction>

	<cffunction name="subLayout">
		<cfset var args = duplicate(arguments) />
		<cfif args[1] DOES NOT CONTAIN "layout_">
			<cfset args[1] = "/layout_" & args[1] />
		</cfif>
		<cfset configLayouts(argumentCollection=args) />
	</cffunction>
	
	<cffunction name="configLayouts">
		<cfargument name="subLayout" type="string" required="no" default="/layout_basic" />
		<cfargument name="template" type="string" required="no" default="" />
		<cfparam name="params.controller" default="" />
		<cfparam name="params.action" default="" />
		<cfparam name="params.key" default="0" />
		<cfparam name="params._pjax" default="0" />
		<cfargument name="rootLayout" type="string" required="no" default="/layout" />
		
		<cfset var layout = "" />
		<cfset var headers = GetHttpRequestData().Headers />
		
		<cfif structKeyExists(headers,'X-PJAX') OR (structKeyExists(headers,'X-Requested-With') AND headers['X-Requested-With'] EQ "XMLHttpRequest")>
			<cfif params._pjax EQ "##page">
				<cfset renderText(
						$renderLayout(
							$layout=arguments.subLayout,
							$type='template',
							$content=$renderLayout(
									$layout='/layout_pjax',
									$type='template',
									$content=$renderPage(
										$template="#arguments.template#",
										$controller=params.controller,
										$action=params.action,
										$key=params.key,
										$layout=false
									)
								)
							)
						) />
			<cfelse>
				<cfset renderText(
						$renderLayout(
								$layout='/layout_pjax',
								$type='template',
								$content=$renderPage(
									$template="#arguments.template#",
									$controller=params.controller,
									$action=params.action,
									$key=params.key,
									$layout=false
								)
							)
						) />
			</cfif>
		<cfelse>
			<cfscript>
			renderText(
					$renderLayout(
						$layout=arguments.rootLayout,
						$type='template',
						$content=$renderLayout(
							$layout=arguments.subLayout,
							$type='template',
							$content=$renderPage(
								$template="#arguments.template#",
								$controller=params.controller,
								$action=params.action,
								$key=params.key,
								$layout="/layout_pjax"
							)
						)
					)
				)
			</cfscript>
		</cfif>
	</cffunction>
	
	
	<cffunction name="pageTitle">
		<cfargument name="titleText" type="string" required="no" default="" />
		
		<cfset contentFor(pageTitle=arguments.titleText) />
	</cffunction>
	
	<cffunction name="pageSubTitle">
		<cfargument name="titleText" type="string" required="no" default="" />
		
		<cfset contentFor(pageSubTitle=arguments.titleText) />
	</cffunction>
	
	<cffunction name="$setActivity" access="public">
    	<cfparam name="params.submitted" type="integer" default="0" />
        <cfparam name="params.key" type="integer" default="0" />
        <cfparam name="params.activityId" type="integer" default="0" />
		
		<cfset params.activityId = (params.activityId GT 0) ? params.activityId : params.key />
		
		<!--- LEGACY FIX --->
		<cfset attributes = {} />
		<cfset attributes['activityid'] = params.activityId />
		<cfset attributes['submitted'] = params.submitted />
		
		<cfset activity = model("activity").findByKey(params.activityId) />
		<cfset pageTitle("#activity.title#") />
	</cffunction>
	
	<cffunction name="$setPerson" access="public">
    	<cfparam name="params.submitted" type="integer" default="0" />
        <cfparam name="params.key" type="integer" default="0" />
        <cfparam name="params.personId" type="integer" default="0" />
		
		<cfset params.personId = (params.personId GT 0) ? params.personId : params.key />
		
		<!--- LEGACY FIX --->
		<cfset attributes = {} />
		<cfset attributes['personid'] = params.personId />
		<cfset attributes['submitted'] = params.submitted />
		
		<cfset person = model("person").findByKey(params.personId) />
		<cfset pageTitle("#person.displayname#") />
	</cffunction>
</cfcomponent>
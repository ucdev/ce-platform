<cfcomponent extends="Wheels">
	<cffunction name="init">
		<cfset filters(through="autoSetup") />
		<cfset filters(through="autoLayout",type="after") />
		<cfset filters(through="pagelet",type="before") />
		<cfset filters(through="createAssets",type="before") />
		<cfset filters(through="setUserInfo",type="before") />
	</cffunction>
	
	<cffunction name="setUserInfo">
		<cfif structKeyExists(session,'currentUser') AND isObject(session.currentuser)>
			<cfset userInfo = duplicate(session.currentUser.properties()) />
			<cfset structDelete(userInfo,'password') />
			<cfset userInfo['loggedIn'] = true />
		<cfelse>
			<cfset userInfo = {
				'loggedIn':false,
				'id':0,
				'name':'Anonymous Amos'
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
        
        <cfif len(trim(params.layout)) EQ 0>
			<cfif params.controller CONTAINS "activity_" AND listFindNoCase("edit,index,new,create,update,requests",params.action,',')>
                <cfset subLayout('adm_activity') />
            <cfelseif params.controller CONTAINS "person_" AND listFindNoCase("edit,index,new,create,update",params.action,',')>
                <cfset subLayout('adm_person') />
            <cfelseif params.controller EQ "activities" AND listFindNoCase("edit",params.action)>
                <cfset subLayout("adm_activity") />
			<cfelseif params.controller EQ "activities" AND listFindNoCase("show",params.action)>
				<cfset subLayout("pub_activity") />
			<cfelse>
				<cfset subLayout("basic") />
            </cfif>
        <cfelse>
        	<cfset subLayout("#params.layout#") />
        </cfif>
	</cffunction>
	
	<cffunction name="showInfoBar">
		<cfargument name="infoBar" type="boolean" required="no" default="true" />
		
		<cfset params.showInfoBar = arguments.infobar />
	</cffunction>
	
	<cffunction name="subLayout">
		<cfargument name="layoutFile" type="string" required="no" default="" />
		<cfparam name="params.controller" default="" />
		<cfparam name="params.action" default="" />
		<cfparam name="params.key" default="0" />
		<cfparam name="params._pjax" default="0" />
		
		<cfset var layout = "" />
		<cfset var headers = GetHttpRequestData().Headers />
		
		<cfif structKeyExists(headers,'X-PJAX') OR (structKeyExists(headers,'X-Requested-With') AND headers['X-Requested-With'] EQ "XMLHttpRequest")>
			<cfif params._pjax EQ "##page">
				<cfset renderText(
						$renderLayout(
							$layout='/layout_#arguments.layoutFile#',
							$type='template',
							$content=$renderLayout(
									$layout='/layout_pjax',
									$type='template',
									$content=$renderPage(
										$template="",
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
									$template="",
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
						$layout='/layout',
						$type='template',
						$content=$renderLayout(
							$layout='/layout_#arguments.layoutFile#',
							$type='template',
							$content=$renderPage(
								$template="",
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
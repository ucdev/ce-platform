<cfcomponent extends="controller">
	<cffunction name="setActListPos">
		<cfparam name="params.Position" type="string" />
		
		<cfcookie name="user_ActListPos" value="#params.Position#" />
		
		<cfset renderText(cookie.user_ActListPos) />
	</cffunction>
	
	<cffunction name="setActListOpen">
		<cfparam name="params.IsOpen" type="boolean" />
		
		<cfcookie name="user_ActListOpen" value="#params.IsOpen#" />
		
		<cfset renderText(cookie.user_ActListOpen) />
	</cffunction>
	
	<cffunction name="setActListSize">
		<cfparam name="params.Size" type="string" />
		
		<cfcookie name="user_ActListSize" value="#params.Size#" />
		
		<cfset renderText(cookie.user_ActListSize) />
	</cffunction>
	
	<cffunction name="setActNotesPos">
		<cfparam name="params.Position" type="string" />
		
		<cfcookie name="user_ActNotesPos" value="#params.Position#" />
		
		<cfset renderText(cookie.user_ActNotesPos) />
	</cffunction>
	
	<cffunction name="setActNotesOpen">
		<cfparam name="params.IsOpen" type="boolean" />
		
		<cfcookie name="user_ActNotesOpen" value="#params.IsOpen#" />
		
		<cfset renderText(cookie.user_ActNotesOpen) />
	</cffunction>
	
	<cffunction name="setActNotesSize">
		<cfparam name="params.Size" type="string" />
		
		<cfcookie name="user_ActNotesSize" value="#params.Size#" />
		
		<cfset renderText(cookie.user_ActNotesSize) />
	</cffunction>
	
	<cffunction name="setPersonQuickMode">
		<cfparam name="params.IsEnabled" type="boolean" />
		
		<cfcookie name="user_PersonQuickMode" value="#params.IsEnabled#" />
		
		<cfset renderText(cookie.user_PersonQuickMode) />
	</cffunction>
	
	<cffunction name="setAttendeePage">
		<cfparam name="params.ActivityID" type="string" />
		<cfparam name="params.Page" type="string" />
		
		<cfcookie name="user_AttendeePage" value="#params.ActivityID#|#params.Page#" />
		
		<cfset renderText(cookie.user_AttendeePage) />
	</cffunction>
	
	<cffunction name="setAttendeeStatus">
		<cfparam name="params.ActivityID" type="string" />
		<cfparam name="params.Status" type="string" />
		
		<cfcookie name="user_AttendeeStatus" value="#params.ActivityID#|#params.Status#" />
		
		<cfset renderText(cookie.user_AttendeeStatus) />
	</cffunction>
	
	<cffunction name="setPersonFinderOpen">
		<cfparam name="params.KeepOpen" type="string" />
		
		<cfcookie name="user_PersonFinderOpen" value="#params.KeepOpen#" />
		
		<cfset renderText(cookie.user_PersonFinderOpen) />
	</cffunction>
</cfcomponent>
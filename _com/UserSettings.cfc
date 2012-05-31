<cfcomponent displayname="User Settings">
	<cffunction name="setActListPos" access="remote" output="no">
		<cfargument name="Position" type="string" required="yes" />
		
		<cfcookie name="user_ActListPos" value="#Arguments.Position#" />
		
		<cfreturn cookie.user_ActListPos />
	</cffunction>
	
	<cffunction name="setActListOpen" access="remote" output="no">
		<cfargument name="IsOpen" type="boolean" required="yes" />
		
		<cfcookie name="user_ActListOpen" value="#Arguments.IsOpen#" />
		
		<cfreturn cookie.user_ActListOpen />
	</cffunction>
	
	<cffunction name="setActListSize" access="remote" output="no">
		<cfargument name="Size" type="string" required="yes" />
		
		<cfcookie name="user_ActListSize" value="#Arguments.Size#" />
		
		<cfreturn cookie.user_ActListSize />
	</cffunction>
	
	<cffunction name="setActNotesPos" access="remote" output="no">
		<cfargument name="Position" type="string" required="yes" />
		
		<cfcookie name="user_ActNotesPos" value="#Arguments.Position#" />
		
		<cfreturn cookie.user_ActNotesPos />
	</cffunction>
	
	<cffunction name="setActNotesOpen" access="remote" output="no">
		<cfargument name="IsOpen" type="boolean" required="yes" />
		
		<cfcookie name="user_ActNotesOpen" value="#Arguments.IsOpen#" />
		
		<cfreturn cookie.user_ActNotesOpen />
	</cffunction>
	
	<cffunction name="setActNotesSize" access="remote" output="no">
		<cfargument name="Size" type="string" required="yes" />
		
		<cfcookie name="user_ActNotesSize" value="#Arguments.Size#" />
		
		<cfreturn cookie.user_ActNotesSize />
	</cffunction>
	
	<cffunction name="setPersonQuickMode" access="remote" output="no">
		<cfargument name="IsEnabled" type="boolean" required="yes" />
		
		<cfcookie name="user_PersonQuickMode" value="#Arguments.IsEnabled#" />
		
		<cfreturn cookie.user_PersonQuickMode />
	</cffunction>
	
	<cffunction name="setAttendeePage" access="remote" output="no">
		<cfargument name="ActivityID" type="string" required="yes" />
		<cfargument name="Page" type="string" required="yes" />
		
		<cfcookie name="user_AttendeePage" value="#Arguments.ActivityID#|#Arguments.Page#" />
		
		<cfreturn cookie.user_AttendeePage />
	</cffunction>
	
	<cffunction name="setAttendeeStatus" access="remote" output="no">
		<cfargument name="ActivityID" type="string" required="yes" />
		<cfargument name="Status" type="string" required="yes" />
		
		<cfcookie name="user_AttendeeStatus" value="#Arguments.ActivityID#|#Arguments.Status#" />
		
		<cfreturn cookie.user_AttendeeStatus />
	</cffunction>
	
	<cffunction name="setPersonFinderOpen" access="remote" output="no">
		<cfargument name="KeepOpen" type="string" required="yes" />
		
		<cfcookie name="user_PersonFinderOpen" value="#Arguments.KeepOpen#" />
		
		<cfreturn cookie.user_PersonFinderOpen />
	</cffunction>
</cfcomponent>
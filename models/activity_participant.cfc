<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Attendee")>
        <cfset property(name="id", column="AttendeeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="findByMobile">
		<cfargument name="phonenumber" type="string" required="yes">
		
		<cfset var attendee = model("activity_participant").findOne(where="'#arguments.phonenumber#' IN (phone1,phone2)") />
		
		<cfif isObject(attendee)>
			<cfreturn attendee />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
</cfcomponent>

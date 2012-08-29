<cfcomponent extends="controllers.api.Controller" displayname="api">
	<cffunction name="init">
		<cfset provides("json") />
	</cffunction>
	
	<cffunction name="create">
		<cfcontent type="text/javascript" />

		<cfset object = model("Activity_participant").new(include="AttendeeStatus", returnAs="query")>

		<cfreturn renderText(serializeJSON(queryToStruct(object))) />
	</cffunction>

	<cffunction name="delete">
		<cfcontent type="text/javascript" />

		<cfset $cleanupParams() />

		<cfset object = model("Activity_participant").findByKey(key=params.key, include="AttendeeStatus") />

		<cfif object.delete()>
			<cfset object = model("Activity_participant").findByKey(key=params.key, include="AttendeeStatus", returnAs="query") />
			<cfreturn renderText(serializeJSON(queryToStruct(object))) />
		<cfelse>
			<cfreturn renderText(params) />
		</cfif>
	</cffunction>

	<cffunction name="index">
		<cfcontent type="text/javascript" />

		<cfset models = model("Activity_participant").findAllByActivityId(key=params.key, include="AttendeeStatus") />

		<cfset renderText(serializeJSON(queryToStruct(models))) />
	</cffunction>

	<cffunction name="show">
		<cfcontent type="text/javascript" />

		<cfset $cleanupParams() />

		<cfset object = model("Activity_participant").findByKey(key=params.key, include="AttendeeStatus", returnAs="query") />

		<cfreturn renderText(serializeJSON(queryToStruct(object))) />
	</cffunction>

	<cffunction name="update">
		<cfcontent type="text/javascript" />

		<cfset $cleanupParams() />

		<cfset object = model("Activity_participant").findByKey(params.key)>

		<cfif isObject(object) AND object.update(params)>
			<cfset object = model("Activity_participant").findByKey(key=params.key, include="AttendeeStatus", returnAs="query") />
			<cfreturn renderText(serializeJSON(queryToStruct(object))) />
		<cfelse>
			<cfreturn renderText(params) />
		</cfif>
	</cffunction>
</cfcomponent>
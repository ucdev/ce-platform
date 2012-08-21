<cfcomponent extends="controllers.api.Controller" displayname="api">
	<cffunction name="init">
		<cfset provides("json") />
	</cffunction>
	
	<cffunction name="create">
	</cffunction>

	<cffunction name="delete">
		<cfset renderText("DELETE IN") />
	</cffunction>

	<cffunction name="index">
		<cfcontent type="text/javascript" />

		<cfset models = model("Activity_participant").findAllByActivityId(key=params.key, include="AttendeeStatus") />

		<cfset renderText(serializeJSON(queryToStruct(models))) />
	</cffunction>

	<cffunction name="show">
		<cfset $cleanupParams() />

		<cfset model = model("Activity_participant").findOneById(params.key)>

		<cfreturn renderText(serializeJSON(model.properties())) />
	</cffunction>

	<cffunction name="update">
		<cfset $cleanupParams() />

		<cfset modelTemp = model("Activity_participant").findOneById(params.key)>

		<cfset modelTemp.save()>

		<cfreturn renderText(model.properties()) />
	</cffunction>
</cfcomponent>
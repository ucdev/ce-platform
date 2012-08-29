<cfcomponent extends="controllers.Controller">
	<cffunction name="$cleanupParams">
		<cfif structKeyExists(params, "model")>
			<cfset structAppend(params, deserializeJSON(params.model))>
			<cfset structDelete(params, "model")>
		</cfif>
	</cffunction>
</cfcomponent>
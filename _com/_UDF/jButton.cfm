<cffunction name="jButton" access="public" output="yes" returntype="string">
	
	<cfargument name="ButtonText" type="string" required="yes">
	<cfargument name="ButtonLink" type="string" required="yes">
	<cfargument name="LinkType" type="string" required="no" default="help">
	<cfargument name="OnClick" type="string" required="no" default="">
	<cfargument name="Target" type="string" required="no" default="">
	<cfargument name="ButtonID" type="string" required="no" default="">
	
	<cfsavecontent variable="ButtonImage">
		<cfif ButtonLink NEQ "" AND OnClick EQ "">
		<a <cfif Arguments.ButtonID NEQ "">id="#Arguments.ButtonID#" </cfif> href="#Arguments.ButtonLink#" <cfif Arguments.Target NEQ ""> target="#Arguments.Target#"</cfif>>#Arguments.ButtonText#</a>
		<cfelse>
		<noscript><a <cfif Arguments.ButtonID NEQ "">id="#Arguments.ButtonID#" </cfif>class="button #Arguments.LinkType#" href="#Arguments.ButtonLink#" <cfif Arguments.Target NEQ ""> target="#Arguments.Target#"</cfif>>#Arguments.ButtonText#</a></noscript>
		<button onClick="#OnClick#" id="#Arguments.ButtonID#">#Arguments.ButtonText#</button>
		</cfif>
	</cfsavecontent>
	<cfreturn ButtonImage>
</cffunction>
<cffunction name="sluggify" output="false" returnType="string">
    <cfargument name="str">
    <cfargument name="spacer" default="-">
    
    <cfset var ret = "" />
    
    <cfset str = lCase(trim(str)) />
    <cfset str = reReplace(str, "[^a-z0-9-]", "#spacer#", "all") />
    <cfset ret = reReplace(str, "#spacer#+", "#spacer#", "all") />
    
    <cfif left(ret, 1) eq "#spacer#">
        <cfset ret = right(ret, len(ret)-1) />
    </cfif>
    <cfif right(ret, 1) eq "#spacer#">
        <cfset ret = left(ret, len(ret)-1) />
    </cfif>
    
    <cfreturn ret />
</cffunction>
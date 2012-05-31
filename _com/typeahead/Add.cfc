<cfcomponent>
	<cffunction name="init" access="public" output="no" returntype="_com.typeAhead.add">
		<cfargument name="dsn" type="string" required="yes" />
		
		<cfset variables.dsn = arguments.dsn />
		
		<cfreturn this />
	</cffunction>
    
    <cffunction name="degrees" access="public" output="false" returntype="struct">
    	<cfargument name="text" type="string" default="" />
        
        <cfquery name="qAdd" datasource="#variables.dsn#" result="qResult">
            INSERT INTO ce_degree
            (
                name,
                abbrv,
                verifyFlag
            ) 
            VALUES
            (
                <cfqueryparam value="#arguments.text#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.text#" cfsqltype="cf_sql_varchar" />,
                'Y'
            )
        </cfquery>
        
        <cfset tempData = {
                            item_id = qResult.IDENTITYCOL,
                            text = arguments.text
                            } />
        
        <cfreturn tempData />
    </cffunction>
    
    <cffunction name="entities" access="public" output="false" returntype="struct">
    	<cfargument name="text" type="string" default="" />
        
        <cfquery name="qAdd" datasource="#variables.dsn#" result="qResult">
            INSERT INTO ce_entity
            (
                name,
                stub,
                verifyFlag
            ) 
            VALUES
            (
                <cfqueryparam value="#arguments.text#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.text#" cfsqltype="cf_sql_varchar" />,
                'Y'
            )
        </cfquery>
        
        <cfset tempData = {
                            item_id = qResult.IDENTITYCOL,
                            text = arguments.text
                            } />
        
        <cfreturn tempData />
    </cffunction>
    
    <cffunction name="occupation" access="public" output="false" returntype="struct">
    	<cfargument name="text" type="string" default="" />
        
        <cfquery name="qAdd" datasource="#variables.dsn#" result="qResult">
            INSERT INTO ce_occupation
            (
                name,
                verifyFlag
            ) 
            VALUES
            (
                <cfqueryparam value="#arguments.text#" cfsqltype="cf_sql_varchar" />,
                'Y'
            )
        </cfquery>
        
        <cfset tempData = {
                            item_id = qResult.IDENTITYCOL,
                            text = arguments.text
                            } />
        
        <cfreturn tempData />
    </cffunction>
    
    <cffunction name="specialties" access="public" output="false" returntype="struct">
    	<cfargument name="text" type="string" default="" />
        
        <cfquery name="qAdd" datasource="#variables.dsn#" result="qResult">
            INSERT INTO ce_sys_specialtyLMS
            (
                name,
                verifyFlag
            ) 
            VALUES
            (
                <cfqueryparam value="#arguments.text#" cfsqltype="cf_sql_varchar" />,
                'Y'
            )
        </cfquery>
        
        <cfset tempData = {
                            item_id = qResult.IDENTITYCOL,
                            text = arguments.text
                            } />
        
        <cfreturn tempData />
    </cffunction>
    
    <cffunction name="resetReturnVar" hint="Resets values for the return data struct." access="private" output="false" returntype="void">
    	<cfset variables.returnVar.setStatus(false) />
        <cfset variables.returnVar.setStatusMsg("Unable to access Type Ahead functionality.") />
        <cfset variables.returnVar.setPayload("[]") />
    </cffunction>
</cfcomponent>
<cfcomponent>
	<cfset variables.instance = StructNew() />
    
	<cffunction name="init" returntype="_com.returnData.buildStruct" access="public" output="no">
        <cfargument name="data" type="struct" required="false" default="#structNew()#" />
        <cfargument name="errors" type="string" required="false" default="" />
		<cfargument name="rep" type="struct" required="false" default="#structNew()#" />
		<cfargument name="status" type="string" required="false" default="" />
        <cfargument name="" type="string" required="false" default="" />
        
		<cfset setData(arguments.data)>
		<cfset setErrors()>
		<cfset setRep({"gain":0,"loss":0,"title":"","description":"","message":""})>
		<cfset setStatus(arguments.status)>
		<cfset setStatusMsg(arguments.statusMsg)>
		
		<cfreturn this />
	</cffunction>
    
    <!--- DUMP FUNCTION --->
	<cffunction name="dump" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
    
	<cffunction name="getData" access="public" returntype="string" output="false">
		<cfreturn variables.instance.data />
	</cffunction>
	
	<cffunction name="setData" access="public" returntype="void" output="false">
		<cfargument name="data" type="struct" required="true" />
		<cfset variables.instance.data = arguments.data />
	</cffunction>
    
    <cffunction name="addError" access="public" returntype="void" output="false">
    	<cfargument name="fieldName" type="string" required="true" />
        <cfargument name="message" type="string" required="true" />
		<cfset var thisError = structNew() />
        <cfset thisError.fieldName = arguments.fieldName>
        <cfset thisError.message = arguments.message>
		<cfset arrayAppend(variables.instance.errors,duplicate(thisError))>
    </cffunction>
	
	<cffunction name="getErrors" access="public" returntype="array" output="false">
		<cfreturn variables.instance.errors />
	</cffunction>
	<cffunction name="setErrors" access="public" returntype="void" output="false">
		<cfset variables.instance.errors = arrayNew(1) />
        <!---
		ARRAY FORMAT:
		aErrors.fieldName
		aErrors.message
		--->
	</cffunction>
    
	<cffunction name="getRep" access="public" returntype="struct" output="false">
		<cfreturn variables.instance.rep />
	</cffunction>
	
	<cffunction name="setRep" access="public" returntype="void" output="false">
		<cfargument name="rep" type="struct" required="true" />
		<cfset this.setRepGain(arguments.rep.gain)>
		<cfset this.setRepLoss(arguments.rep.loss)>
		<cfset this.setRepTitle(arguments.rep.title)>
		<cfset this.setRepDescription(arguments.rep.description)>
		<cfset this.setRepMessage(arguments.rep.message)>
	</cffunction>
	
	<cffunction name="getRepGain" access="public" returntype="string" output="false">
		<cfreturn variables.instance.rep.gain />
	</cffunction>
	
	<cffunction name="setRepGain" access="public" returntype="void" output="false">
		<cfargument name="rep" type="string" required="true" />
		<cfset variables.instance.rep.gain = arguments.rep />
	</cffunction>
	
	<cffunction name="getRepLoss" access="public" returntype="string" output="false">
		<cfreturn variables.instance.rep.loss />
	</cffunction>
	
	<cffunction name="setRepLoss" access="public" returntype="void" output="false">
		<cfargument name="rep" type="string" required="true" />
		<cfset variables.instance.rep.loss = arguments.rep />
	</cffunction>
	
	<cffunction name="getRepTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.rep.title />
	</cffunction>
	
	<cffunction name="setRepTitle" access="public" returntype="void" output="false">
		<cfargument name="rep" type="string" required="true" />
		<cfset variables.instance.rep.title = arguments.rep />
	</cffunction>
	
	<cffunction name="getRepDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.rep.description />
	</cffunction>
	
	<cffunction name="setRepDescription" access="public" returntype="void" output="false">
		<cfargument name="rep" type="string" required="true" />
		<cfset variables.instance.rep.description = arguments.rep />
	</cffunction>
	
	<cffunction name="getRepMessage" access="public" returntype="string" output="false">
		<cfreturn variables.instance.rep.message />
	</cffunction>
	
	<cffunction name="setRepMessage" access="public" returntype="void" output="false">
		<cfargument name="rep" type="string" required="true" />
		<cfset variables.instance.rep.message = arguments.rep />
	</cffunction>
    
	<cffunction name="getStatus" access="public" returntype="string" output="false">
		<cfreturn variables.instance.status />
	</cffunction>
	<cffunction name="setStatus" access="public" returntype="void" output="false">
		<cfargument name="status" type="string" required="true" />
		<cfset variables.instance.status = arguments.status />
	</cffunction>
    
	<cffunction name="getStatusMsg" access="public" returntype="string" output="false">
		<cfreturn variables.instance.statusMsg />
	</cffunction>
	<cffunction name="setStatusMsg" access="public" returntype="void" output="false">
		<cfargument name="statusMsg" type="string" required="true" />
		<cfset variables.instance.statusMsg = arguments.statusMsg />
	</cffunction>
    
   <!--- <cffunction name="parseReturnVar" hint="Parses the status and statusMsg from provided variable." access="public" output="false">
    	<cfargument name="returnVar" type="string" required="true" />
        
		<cfset this.setStatus(getToken(returnVar, 1, "|"))>
        <cfset this.setStatusMsg(getToken(returnVar, 2, "|"))>
        <cfset this.setRep(getToken(returnVar, 3, "|"))>
        <cfset this.setData(getToken(returnVar, 4, "|"))>
    </cffunction>--->
</cfcomponent>
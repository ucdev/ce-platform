<cfcomponent>
	<cffunction name="AutoComplete" access="Remote" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes">
		<cfargument name="limit" type="string" required="yes">
        
        <cfset var Status = Application.Activity.AutoCompleteLMS(Arguments.Q,Arguments.Limit)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="cancelActivity" hint="Removes Attendee Record from Activity" access="Remote" output="true" returntype="string">
    	<cfargument name="ActivityID" required="true" type="string" />
    	<cfargument name="PersonID" required="true" type="string" />
        
        <cfset var Status = "False|Cannot access the cancel function for activities.">
        
        <cfset Status = Application.Activity.cancelActivity(Arguments.ActivityID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="deleteComment" hint="LMS Function // Deletes comment by provided CommentID." access="Remote" output="false" returntype="string">
    	<cfargument name="CommentID" type="numeric" required="yes">
        
        <cfset var Status = "Fail|Cannot access delete functionality for comments.">
        
        <cfset Status = Application.ActivityPublish.deleteComment(Arguments.CommentID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="markComplete" access="remote" output="true" returntype="string">
		<cfargument name="PersonID" type="string" required="yes">
        <cfargument name="ActivityID" type="string" required="yes">
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access mark complete function for activities.")>
        
        <cfset status = Application.activityattendee.markComplete(Arguments.PersonID,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveComment" hint="LMS Function // Deletes comment by provided CommentID." access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" type="string" required="true">
		<cfargument name="PersonID" type="string" required="true">
		<cfargument name="CommentBody" type="string" required="true">
        
        <cfset var Status = "Fail|Cannot access save functionality for comments.">
        
        <cfset Status = Application.ActivityPublish.saveComment(Arguments.ActivityID,Arguments.PersonID,Arguments.CommentBody)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="startActivity" hint="Creates Attendee Record in Activity" access="Remote" output="true" returntype="string">
    	<cfargument name="ActivityID" type="string" required="true" />
    	<cfargument name="PersonID" type="string" required="true" />
		<cfargument name="Mode" type="string" required="false" default="" />      
		<cfargument name="DegreeID" type="string" required="false" default="" /> 
		<cfargument name="BillPhone" type="string" required="false" default="" />
		<cfargument name="BillAddr1" type="string" required="false" default="" />
		<cfargument name="BillAddr2" type="string" required="false" default="" />
		<cfargument name="BillCity" type="string" required="false" default="" />
		<cfargument name="BillState" type="string" required="false" default="" />
		<cfargument name="BillZipCode" type="string" required="false" default="" />
		<cfargument name="CardName" type="string" required="false" default="" />
		<cfargument name="CardNumber" type="string" required="false" default="" />
		<cfargument name="CardType" type="string" required="false" default="" />
		<cfargument name="CardExpireMonth" type="string" required="false" default="" />
		<cfargument name="CardExpireYear" type="string" required="false" default="" />
        
        <cfset var Status = "Fail|Cannot access the start activity function.">
        
        <cfset Status = Application.Activity.startActivity(
							Arguments.ActivityID,
							Arguments.PersonID,
							Arguments.Mode,
							Arguments.DegreeID,
							Arguments.BillPhone,
							Arguments.BillAddr1,
							Arguments.BillAddr2,
							Arguments.BillCity,
							Arguments.BillState,
							Arguments.BillZipCode,
							Arguments.CardName,
							Arguments.CardNumber,
							Arguments.CardType,
							Arguments.CardExpireMonth,
							Arguments.CardExpireYear)>
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>
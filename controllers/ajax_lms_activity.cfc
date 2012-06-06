<cfcomponent extends="controller">
	<cffunction name="AutoComplete"  output="no" returntype="string">
		<cfparam name="params.q" type="string" required="yes">
		<cfparam name="params.limit" type="string" required="yes">
        
        <cfset var Status = Application.Activity.AutoCompleteLMS(Arguments.Q,Arguments.Limit)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="cancelActivity" hint="Removes Attendee Record from Activity"  output="true" returntype="string">
    	<cfparam name="params.ActivityID" type="string" />
    	<cfparam name="params.PersonID" type="string" />
        
        <cfset var Status = "False|Cannot access the cancel function for activities.">
        
        <cfset Status = Application.Activity.cancelActivity(Arguments.ActivityID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="deleteComment" hint="LMS Function // Deletes comment by provided CommentID."  output="false" returntype="string">
    	<cfparam name="params.CommentID" type="numeric" required="yes">
        
        <cfset var Status = "Fail|Cannot access delete functionality for comments.">
        
        <cfset Status = Application.ActivityPublish.deleteComment(Arguments.CommentID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="markComplete"  output="true" returntype="string">
		<cfparam name="params.PersonID" type="string" required="yes">
        <cfparam name="params.ActivityID" type="string" required="yes">
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access mark complete function for activities.")>
        
        <cfset status = Application.activityattendee.markComplete(Arguments.PersonID,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveComment" hint="LMS Function // Deletes comment by provided CommentID."  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.PersonID" type="string">
		<cfparam name="params.CommentBody" type="string">
        
        <cfset var Status = "Fail|Cannot access save functionality for comments.">
        
        <cfset Status = Application.ActivityPublish.saveComment(Arguments.ActivityID,Arguments.PersonID,Arguments.CommentBody)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="startActivity" hint="Creates Attendee Record in Activity"  output="true" returntype="string">
    	<cfparam name="params.ActivityID" type="string" />
    	<cfparam name="params.PersonID" type="string" />
		<cfparam name="params.Mode" type="string" required="false" default="" />      
		<cfparam name="params.DegreeID" type="string" required="false" default="" /> 
		<cfparam name="params.BillPhone" type="string" required="false" default="" />
		<cfparam name="params.BillAddr1" type="string" required="false" default="" />
		<cfparam name="params.BillAddr2" type="string" required="false" default="" />
		<cfparam name="params.BillCity" type="string" required="false" default="" />
		<cfparam name="params.BillState" type="string" required="false" default="" />
		<cfparam name="params.BillZipCode" type="string" required="false" default="" />
		<cfparam name="params.CardName" type="string" required="false" default="" />
		<cfparam name="params.CardNumber" type="string" required="false" default="" />
		<cfparam name="params.CardType" type="string" required="false" default="" />
		<cfparam name="params.CardExpireMonth" type="string" required="false" default="" />
		<cfparam name="params.CardExpireYear" type="string" required="false" default="" />
        
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
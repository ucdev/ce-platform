<cfcomponent extends="controller">
	<cffunction name="AutoComplete"  output="no">
		<cfparam name="params.q" type="string" >
		<cfparam name="params.limit" type="string" >
        
        <cfset var Status = Application.Activity.AutoCompleteLMS(params.Q,params.Limit)>
        
        <cfset renderText(Status) />
    </cffunction>
    
    <cffunction name="cancelActivity" hint="Removes Attendee Record from Activity"  output="true">
    	<cfparam name="params.ActivityID" type="string" />
    	<cfparam name="params.PersonID" type="string" />
        
        <cfset var Status = "False|Cannot access the cancel function for activities.">
        
        <cfset Status = Application.Activity.cancelActivity(params.ActivityID,params.PersonID)>
        
        <cfset renderText(Status) />
    </cffunction>
    
    <cffunction name="deleteComment" hint="LMS Function // Deletes comment by provided CommentID."  output="false">
    	<cfparam name="params.CommentID" type="numeric" >
        
        <cfset var Status = "Fail|Cannot access delete functionality for comments.">
        
        <cfset Status = Application.ActivityPublish.deleteComment(params.CommentID)>
        
        <cfset renderText(Status) />
    </cffunction>
    
    <cffunction name="markComplete"  output="true">
		<cfparam name="params.PersonID" type="string" >
        <cfparam name="params.ActivityID" type="string" >
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access mark complete function for activities.")>
        
        <cfset status = Application.activityattendee.markComplete(params.PersonID,params.ActivityID)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
    <cffunction name="saveComment" hint="LMS Function // Deletes comment by provided CommentID."  output="false">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.PersonID" type="string">
		<cfparam name="params.CommentBody" type="string">
        
        <cfset var Status = "Fail|Cannot access save functionality for comments.">
        
        <cfset Status = Application.ActivityPublish.saveComment(params.ActivityID,params.PersonID,params.CommentBody)>
        
        <cfset renderText(Status) />
    </cffunction>
    
    <cffunction name="startActivity" hint="Creates Attendee Record in Activity"  output="true">
    	<cfparam name="params.ActivityID" type="string" />
    	<cfparam name="params.PersonID" type="string" />
		<cfparam name="params.Mode" type="string"  default="" />      
		<cfparam name="params.DegreeID" type="string"  default="" /> 
		<cfparam name="params.BillPhone" type="string"  default="" />
		<cfparam name="params.BillAddr1" type="string"  default="" />
		<cfparam name="params.BillAddr2" type="string"  default="" />
		<cfparam name="params.BillCity" type="string"  default="" />
		<cfparam name="params.BillState" type="string"  default="" />
		<cfparam name="params.BillZipCode" type="string"  default="" />
		<cfparam name="params.CardName" type="string"  default="" />
		<cfparam name="params.CardNumber" type="string"  default="" />
		<cfparam name="params.CardType" type="string"  default="" />
		<cfparam name="params.CardExpireMonth" type="string"  default="" />
		<cfparam name="params.CardExpireYear" type="string"  default="" />
        
        <cfset var Status = "Fail|Cannot access the start activity function.">
        
        <cfset Status = Application.Activity.startActivity(
							params.ActivityID,
							params.PersonID,
							params.Mode,
							params.DegreeID,
							params.BillPhone,
							params.BillAddr1,
							params.BillAddr2,
							params.BillCity,
							params.BillState,
							params.BillZipCode,
							params.CardName,
							params.CardNumber,
							params.CardType,
							params.CardExpireMonth,
							params.CardExpireYear)>
        
        <cfset renderText(Status) />
    </cffunction>
</cfcomponent>
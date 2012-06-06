<cfcomponent extends="controller">
	<cffunction name="getResult"  output="true">
		<cfparam name="params.AssessmentID" type="string" >
		<cfparam name="params.PersonID" type="string" >
		<cfparam name="params.EvalType" type="string" >
        
        <cfset var Status = Application.Assessment.getResult(params.AssessmentID,params.PersonID,params.EvalType)>
        
        <cfset renderText(Status) />
    </cffunction>
    
    <cffunction name="markComplete"  output="no">
		<cfparam name="params.AssessmentID" type="string" >
		<cfparam name="params.PersonID" type="string" >
        <cfparam name="params.ActivityID" type="string" >
		<cfparam name="params.ResultID" type="string" >
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the functionality to complete this assessment.")>
        
        <cfset status = Application.Assessment.markComplete(params.AssessmentID,params.PersonID,params.ActivityID,params.ResultID)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
                 
	<cffunction name="saveAnswer"  output="true">
		<cfparam name="params.QuestionID" type="string" >
		<cfparam name="params.AssessmentID" type="string" >
		<cfparam name="params.ResultID" type="string" >
		<cfparam name="params.Answer" type="string" >
		<cfparam name="params.FieldType" type="string" >
        
        <cfset var Status = "false">
        
        <cfset Status = Application.Assessment.saveAnswer(
														QuestionID=params.QuestionID,
														AssessmentID=params.AssessmentID,
														ResultID=params.ResultID,
														Answer=params.Answer,
														FieldType=params.FieldType)>
        
        <cfset renderText(Status) />
    </cffunction>
</cfcomponent>
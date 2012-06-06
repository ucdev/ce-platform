<cfcomponent extends="controller">
	<cffunction name="getResult"  output="true" returntype="string">
		<cfparam name="params.AssessmentID" type="string" required="yes">
		<cfparam name="params.PersonID" type="string" required="yes">
		<cfparam name="params.EvalType" type="string" required="yes">
        
        <cfset var Status = Application.Assessment.getResult(Arguments.AssessmentID,Arguments.PersonID,Arguments.EvalType)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="markComplete"  output="no" returntype="string">
		<cfparam name="params.AssessmentID" type="string" required="yes">
		<cfparam name="params.PersonID" type="string" required="yes">
        <cfparam name="params.ActivityID" type="string" required="yes">
		<cfparam name="params.ResultID" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the functionality to complete this assessment.")>
        
        <cfset status = Application.Assessment.markComplete(Arguments.AssessmentID,Arguments.PersonID,Arguments.ActivityID,Arguments.ResultID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
                 
	<cffunction name="saveAnswer"  output="true" returntype="string">
		<cfparam name="params.QuestionID" type="string" required="yes">
		<cfparam name="params.AssessmentID" type="string" required="yes">
		<cfparam name="params.ResultID" type="string" required="yes">
		<cfparam name="params.Answer" type="string" required="yes">
		<cfparam name="params.FieldType" type="string" required="yes">
        
        <cfset var Status = "false">
        
        <cfset Status = Application.Assessment.saveAnswer(
														QuestionID=Arguments.QuestionID,
														AssessmentID=Arguments.AssessmentID,
														ResultID=Arguments.ResultID,
														Answer=Arguments.Answer,
														FieldType=Arguments.FieldType)>
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>
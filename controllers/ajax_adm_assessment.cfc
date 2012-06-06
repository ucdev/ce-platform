<cfcomponent extends="controller">
<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
    <cffunction name="isAssessFailed" hint="Determine if the user passed or failed the assessment"  output="true">
		<cfparam name="params.AssessmentID" type="string" >
		<cfparam name="params.PersonID" type="string" >
        
        <cfset var Status = "0|100">
        
        <cfset Status = Application.Assessment.isAssessFailed(params.AssessmentID,params.PersonID)>
        
        <cfset renderText(Status) />
    </cffunction>
        
    <cffunction name="markComplete"  output="true">
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
        
        <cfset var Status = False>
        
        <cfset Status = Application.Assessment.saveAnswer(
													QuestionID=params.QuestionID,
													AssessmentID=params.AssessmentID,
													ResultID=params.ResultID,
													Answer=params.Answer,
													FieldType=params.fieldType)>
        
        <cfset renderText(Status) />
    </cffunction>
</cfcomponent>
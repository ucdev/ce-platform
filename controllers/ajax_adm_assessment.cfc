<cfcomponent>
    <cffunction name="isAssessFailed" hint="Determine if the user passed or failed the assessment" access="Remote" output="true" returntype="string">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        
        <cfset var Status = "0|100">
        
        <cfset Status = Application.Assessment.isAssessFailed(Arguments.AssessmentID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>
        
    <cffunction name="markComplete" access="Remote" output="true" returntype="string">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        <cfargument name="ActivityID" type="string" required="yes">
        <cfargument name="ResultID" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the functionality to complete this assessment.")>
        
        <cfset status = Application.Assessment.markComplete(Arguments.AssessmentID,Arguments.PersonID,Arguments.ActivityID,Arguments.ResultID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
        
	<cffunction name="saveAnswer" access="Remote" output="true" returntype="string">
		<cfargument name="QuestionID" type="string" required="yes">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="ResultID" type="string" required="yes">
		<cfargument name="Answer" type="string" required="yes">
		<cfargument name="FieldType" type="string" required="yes">
        
        <cfset var Status = False>
        
        <cfset Status = Application.Assessment.saveAnswer(
													QuestionID=Arguments.QuestionID,
													AssessmentID=Arguments.AssessmentID,
													ResultID=Arguments.ResultID,
													Answer=Arguments.Answer,
													FieldType=arguments.fieldType)>
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>
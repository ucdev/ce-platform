<cfcomponent extends="controller">
        
	<cffunction name="copyAssessTmpl" hint="Creates a copy of an assessment from a provided template."  returntype="string">
        <cfparam name="params.ActivityID" type="numeric" required="yes">
		<cfparam name="params.AssessTmplID" type="numeric" required="yes">
        
        <cfset var Status = Application.Builder.copyAssessTmpl(Arguments.ActivityID,Arguments.AssessTmplID)>
        
        <cfreturn Status />
    </cffunction>
        
    <cffunction name="deleteAssessTmpl" hint="Deletes template for provided component."  returntype="string">
		<cfparam name="params.PubComponentID" type="numeric" required="yes">
      	
        <cfset var Status = "Fail|Cannot access assessment template delete functionality.">
        
        <cfset Status = Application.Builder.deleteAssessTmpl(Arguments.PubComponentID)>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="removeComponent" displayname="Remove Component"  output="no">
		<cfparam name="params.PubComponentID" type="string" required="no" default="0" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.removeComponent(Arguments.PubComponentID)>
      	
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="removeQuestion" displayname="Remove Question"  output="no">
		<cfparam name="params.QuestionID" type="string" required="yes" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.removeQuestion(Arguments.QuestionID)>
      	
        <cfreturn Status />
    </cffunction>
        
	<cffunction name="saveAssessTmpl" hint="Creates a template of a provided assessment."  returntype="string">
		<cfparam name="params.PubComponentID" type="numeric" required="yes">
        <cfparam name="params.Name" type="string" required="yes">
      	
        <cfset var Status = "Fail|Cannot access assessment template save functionality.">
        
        <cfset Status = Application.Builder.saveAssessTmpl(Arguments.PubComponentID,Arguments.Name)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveComponent" displayname="Save Component"  output="no">
		<cfparam name="params.PubComponentID" type="string" required="no" default="0" />
		<cfparam name="params.ComponentID" type="string" required="yes" />
		<cfparam name="params.ActivityID" type="string" required="yes" />
		<cfparam name="params.DisplayName" type="string" required="yeS" />
		<cfparam name="params.Description" type="string" required="no" default="" />
		<cfparam name="params.ExternalURL" type="string" required="no" default="" />
		<cfparam name="params.AssessmentID" type="string" required="no" default="0" />
		<cfparam name="params.RequiredFlag" type="string" required="no" default="N" />
		<cfparam name="params.PassingScore" type="string" required="no" default="0" />
		<cfparam name="params.MaxAttempts" type="string" required="no" default="0" />
		<cfparam name="params.FileID" type="string" required="no" default="0" />
        <cfparam name="params.AssessTmplID" type="numeric" required="no" default="0" />
		
		<cfset var Status = "failed|Cannot access component save functionality." />
        
        <cfset Status = Application.Builder.saveComponent(
							Arguments.PubComponentID,
							Arguments.ComponentID,
							Arguments.ActivityID,
							Arguments.DisplayName,
							Arguments.Description,
							Arguments.ExternalURL,
							Arguments.AssessmentID,
							Arguments.RequiredFlag,
							Arguments.PassingScore,
							Arguments.MaxAttempts,
							Arguments.FileID,
							Arguments.AssessTmplID)>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="saveQuestion" displayname="Save Question"  output="no">
		<cfparam name="params.AssessmentID" type="string" required="yes" />
		<cfparam name="params.QuestionID" type="string" required="yes" />
		<cfparam name="params.QuestionTypeID" required="yes" default="0" />
		<cfparam name="params.LabelText" required="yes" type="string" default="" />
		<cfparam name="params.DetailText" type="string" default="" />
		<cfparam name="params.VC1" type="string" default="" />
		<cfparam name="params.VC2" type="string" default="" />
		<cfparam name="params.VC3" type="string" default="" />
		<cfparam name="params.VC4" type="string" default="" />
		<cfparam name="params.VC5" type="string" default="" />
		<cfparam name="params.VC6" type="string" default="" />
		<cfparam name="params.VC7" type="string" default="" />
		<cfparam name="params.VC8" type="string" default="" />
		<cfparam name="params.VC9" type="string" default="" />
		<cfparam name="params.VC10" type="string" default="" />
		<cfparam name="params.RequiredFlag" type="string" default="N" />
		<cfparam name="params.CorrectField" type="string" default="" />
        <cfparam name="params.insertFlag" type="string" required="no" default="N" />
        <cfparam name="params.sort" type="string" required="no" default="0" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveQuestion(
							AssessmentId=Arguments.AssessmentID,
							QuestionID=Arguments.QuestionID,
							QuestionTypeID=Arguments.QuestionTypeID,
							LabelText=Arguments.LabelText,
							DetailText=Arguments.DetailText,
							vc1=Arguments.VC1,
							vc2=Arguments.VC2,
							vc3=Arguments.VC3,
							vc4=Arguments.VC4,
							vc5=Arguments.VC5,
							vc6=Arguments.VC6,
							vc7=Arguments.VC7,
							vc8=Arguments.VC8,
							vc9=Arguments.VC9,
							vc10=Arguments.VC10,
							RequiredFlag=Arguments.RequiredFlag,
							CorrectField=Arguments.CorrectField,
							insertFlag=arguments.insertFlag,
							sort=arguments.sort)>
                            
		<cfreturn Status />
    </cffunction>
	
	<cffunction name="saveComponentSort" displayname="Sort Components"  output="no">
    	<cfparam name="params.Comp" required="yes">
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveComponentSort(Arguments.Comp)>
      	
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="saveQuestionSort" displayname="Sort Components"  output="no">
    	<cfparam name="params.Questions" required="yes">
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveQuestionSort(Questions=Arguments.Questions)>
      	
        <cfreturn Status />
    </cffunction>
</cfcomponent>
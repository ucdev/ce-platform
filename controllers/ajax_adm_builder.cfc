<cfcomponent extends="controller">
        
	<cffunction name="copyAssessTmpl" hint="Creates a copy of an assessment from a provided template." access="Remote" returntype="string">
        <cfargument name="ActivityID" type="numeric" required="yes">
		<cfargument name="AssessTmplID" type="numeric" required="yes">
        
        <cfset var Status = Application.Builder.copyAssessTmpl(Arguments.ActivityID,Arguments.AssessTmplID)>
        
        <cfreturn Status />
    </cffunction>
        
    <cffunction name="deleteAssessTmpl" hint="Deletes template for provided component." access="Remote" returntype="string">
		<cfargument name="PubComponentID" type="numeric" required="yes">
      	
        <cfset var Status = "Fail|Cannot access assessment template delete functionality.">
        
        <cfset Status = Application.Builder.deleteAssessTmpl(Arguments.PubComponentID)>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="removeComponent" displayname="Remove Component" access="Remote" output="no">
		<cfargument name="PubComponentID" type="string" required="no" default="0" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.removeComponent(Arguments.PubComponentID)>
      	
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="removeQuestion" displayname="Remove Question" access="remote" output="no">
		<cfargument name="QuestionID" type="string" required="yes" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.removeQuestion(Arguments.QuestionID)>
      	
        <cfreturn Status />
    </cffunction>
        
	<cffunction name="saveAssessTmpl" hint="Creates a template of a provided assessment." access="Remote" returntype="string">
		<cfargument name="PubComponentID" type="numeric" required="yes">
        <cfargument name="Name" type="string" required="yes">
      	
        <cfset var Status = "Fail|Cannot access assessment template save functionality.">
        
        <cfset Status = Application.Builder.saveAssessTmpl(Arguments.PubComponentID,Arguments.Name)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveComponent" displayname="Save Component" access="Remote" output="no">
		<cfargument name="PubComponentID" type="string" required="no" default="0" />
		<cfargument name="ComponentID" type="string" required="yes" />
		<cfargument name="ActivityID" type="string" required="yes" />
		<cfargument name="DisplayName" type="string" required="yeS" />
		<cfargument name="Description" type="string" required="no" default="" />
		<cfargument name="ExternalURL" type="string" required="no" default="" />
		<cfargument name="AssessmentID" type="string" required="no" default="0" />
		<cfargument name="RequiredFlag" type="string" required="no" default="N" />
		<cfargument name="PassingScore" type="string" required="no" default="0" />
		<cfargument name="MaxAttempts" type="string" required="no" default="0" />
		<cfargument name="FileID" type="string" required="no" default="0" />
        <cfargument name="AssessTmplID" type="numeric" required="no" default="0" />
		
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
	
	<cffunction name="saveQuestion" displayname="Save Question" access="remote" output="no">
		<cfargument name="AssessmentID" type="string" required="yes" />
		<cfargument name="QuestionID" type="string" required="yes" />
		<cfargument name="QuestionTypeID" required="yes" default="0" />
		<cfargument name="LabelText" required="yes" type="string" default="" />
		<cfargument name="DetailText" type="string" default="" />
		<cfargument name="VC1" type="string" default="" />
		<cfargument name="VC2" type="string" default="" />
		<cfargument name="VC3" type="string" default="" />
		<cfargument name="VC4" type="string" default="" />
		<cfargument name="VC5" type="string" default="" />
		<cfargument name="VC6" type="string" default="" />
		<cfargument name="VC7" type="string" default="" />
		<cfargument name="VC8" type="string" default="" />
		<cfargument name="VC9" type="string" default="" />
		<cfargument name="VC10" type="string" default="" />
		<cfargument name="RequiredFlag" type="string" default="N" />
		<cfargument name="CorrectField" type="string" default="" />
        <cfargument name="insertFlag" type="string" required="no" default="N" />
        <cfargument name="sort" type="string" required="no" default="0" />
        
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
	
	<cffunction name="saveComponentSort" displayname="Sort Components" access="Remote" output="no">
    	<cfargument name="Comp" required="yes">
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveComponentSort(Arguments.Comp)>
      	
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="saveQuestionSort" displayname="Sort Components" access="Remote" output="no">
    	<cfargument name="Questions" required="yes">
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveQuestionSort(Questions=Arguments.Questions)>
      	
        <cfreturn Status />
    </cffunction>
</cfcomponent>
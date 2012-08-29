<cfcomponent extends="controller">

<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
        
	<cffunction name="copyAssessTmpl" hint="Creates a copy of an assessment from a provided template." >
        <cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.AssessTmplID" type="numeric" >
        
        <cfset var Status = Application.Builder.copyAssessTmpl(params.ActivityID,params.AssessTmplID)>
        
        <cfset renderText(Status) />
    </cffunction>
        
    <cffunction name="deleteAssessTmpl" hint="Deletes template for provided component." >
		<cfparam name="params.PubComponentID" type="numeric" >
      	
        <cfset var Status = "Fail|Cannot access assessment template delete functionality.">
        
        <cfset Status = Application.Builder.deleteAssessTmpl(params.PubComponentID)>
        
        <cfset renderText(Status) />
    </cffunction>
	
	<cffunction name="removeComponent" displayname="Remove Component"  output="no">
		<cfparam name="params.PubComponentID" type="string"  default="0" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.removeComponent(params.PubComponentID)>
      	
        <cfset renderText(Status) />
    </cffunction>
	
	<cffunction name="removeQuestion" displayname="Remove Question"  output="no">
		<cfparam name="params.QuestionID" type="string"  />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.removeQuestion(params.QuestionID)>
      	
        <cfset renderText(Status) />
    </cffunction>
        
	<cffunction name="saveAssessTmpl" hint="Creates a template of a provided assessment." >
		<cfparam name="params.PubComponentID" type="numeric" >
        <cfparam name="params.Name" type="string" >
      	
        <cfset var Status = "Fail|Cannot access assessment template save functionality.">
        
        <cfset Status = Application.Builder.saveAssessTmpl(params.PubComponentID,params.Name)>
        
        <cfset renderText(Status) />
    </cffunction>
    
	<cffunction name="saveComponent" displayname="Save Component"  output="no">
		<cfparam name="params.PubComponentID" type="string"  default="0" />
		<cfparam name="params.ComponentID" type="string"  />
		<cfparam name="params.ActivityID" type="string"  />
		<cfparam name="params.DisplayName" type="string"  />
		<cfparam name="params.Description" type="string"  default="" />
		<cfparam name="params.ExternalURL" type="string"  default="" />
		<cfparam name="params.AssessmentID" type="string"  default="0" />
		<cfparam name="params.RequiredFlag" type="string"  default="N" />
		<cfparam name="params.PassingScore" type="string"  default="0" />
		<cfparam name="params.MaxAttempts" type="string"  default="0" />
		<cfparam name="params.FileID" type="string"  default="0" />
        <cfparam name="params.AssessTmplID" type="numeric"  default="0" />
		
		<cfset var Status = "failed|Cannot access component save functionality." />
        
        <cfset Status = Application.Builder.saveComponent(
							params.PubComponentID,
							params.ComponentID,
							params.ActivityID,
							params.DisplayName,
							params.Description,
							params.ExternalURL,
							params.AssessmentID,
							params.RequiredFlag,
							params.PassingScore,
							params.MaxAttempts,
							params.FileID,
							params.AssessTmplID)>
        
        <cfset renderText(Status) />
    </cffunction>
	
	<cffunction name="saveQuestion" displayname="Save Question"  output="no">
		<cfparam name="params.AssessmentID" type="string"  />
		<cfparam name="params.QuestionID" type="string"  />
		<cfparam name="params.QuestionTypeID"  default="0" />
		<cfparam name="params.LabelText"  type="string" default="" />
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
        <cfparam name="params.insertFlag" type="string"  default="N" />
        <cfparam name="params.sort" type="string"  default="0" />
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveQuestion(
							AssessmentId=params.AssessmentID,
							QuestionID=params.QuestionID,
							QuestionTypeID=params.QuestionTypeID,
							LabelText=params.LabelText,
							DetailText=params.DetailText,
							vc1=params.VC1,
							vc2=params.VC2,
							vc3=params.VC3,
							vc4=params.VC4,
							vc5=params.VC5,
							vc6=params.VC6,
							vc7=params.VC7,
							vc8=params.VC8,
							vc9=params.VC9,
							vc10=params.VC10,
							RequiredFlag=params.RequiredFlag,
							CorrectField=params.CorrectField,
							insertFlag=params.insertFlag,
							sort=params.sort)>
                            
		<cfset renderText(Status) />
    </cffunction>
	
	<cffunction name="saveComponentSort" displayname="Sort Components"  output="no">
    	<cfparam name="params.Comp" >
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveComponentSort(params.Comp)>
      	
        <cfset renderText(Status) />
    </cffunction>
	
	<cffunction name="saveQuestionSort" displayname="Sort Components"  output="no">
    	<cfparam name="params.Questions" >
        
        <cfset var Status = "failed">
        
        <cfset Status = Application.Builder.saveQuestionSort(Questions=params.Questions)>
      	
        <cfset renderText(Status) />
    </cffunction>
</cfcomponent>
<cfcomponent displayname="AssessAnswer" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.AssessAnswer.AssessAnswer" output="false">
		<cfargument name="AnswerID" type="string" required="false" default="" />
		<cfargument name="ResultID" type="string" required="false" default="" />
		<cfargument name="AssessmentID" type="string" required="false" default="" />
		<cfargument name="QuestionID" type="string" required="false" default="" />
		<cfargument name="I1" type="string" required="false" default="" />
		<cfargument name="I2" type="string" required="false" default="" />
		<cfargument name="VC1" type="string" required="false" default="" />
		<cfargument name="VC2" type="string" required="false" default="" />
		<cfargument name="DT1" type="string" required="false" default="" />
		<cfargument name="DT2" type="string" required="false" default="" />
		<cfargument name="TXT1" type="string" required="false" default="" />
		<cfargument name="TXT2" type="string" required="false" default="" />
		<cfargument name="CorrectFlag" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setAnswerID(arguments.AnswerID) />
		<cfset setResultID(arguments.ResultID) />
		<cfset setAssessmentID(arguments.AssessmentID) />
		<cfset setQuestionID(arguments.QuestionID) />
		<cfset setI1(arguments.I1) />
		<cfset setI2(arguments.I2) />
		<cfset setVC1(arguments.VC1) />
		<cfset setVC2(arguments.VC2) />
		<cfset setDT1(arguments.DT1) />
		<cfset setDT2(arguments.DT2) />
		<cfset setTXT1(arguments.TXT1) />
		<cfset setTXT2(arguments.TXT2) />
		<cfset setCorrectFlag(arguments.CorrectFlag) />
		<cfset setCreated(arguments.Created) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.AssessAnswer.AssessAnswer" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- AnswerID --->
		<cfif (len(trim(getAnswerID())) AND NOT isNumeric(trim(getAnswerID())))>
			<cfset thisError.field = "AnswerID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AnswerID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ResultID --->
		<cfif (len(trim(getResultID())) AND NOT isNumeric(trim(getResultID())))>
			<cfset thisError.field = "ResultID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ResultID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AssessmentID --->
		<cfif (len(trim(getAssessmentID())) AND NOT isNumeric(trim(getAssessmentID())))>
			<cfset thisError.field = "AssessmentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- QuestionID --->
		<cfif (len(trim(getQuestionID())) AND NOT isNumeric(trim(getQuestionID())))>
			<cfset thisError.field = "QuestionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "QuestionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- I1 --->
		<cfif (len(trim(getI1())) AND NOT isNumeric(trim(getI1())))>
			<cfset thisError.field = "I1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "I1 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- I2 --->
		<cfif (len(trim(getI2())) AND NOT isNumeric(trim(getI2())))>
			<cfset thisError.field = "I2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "I2 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- VC1 --->
		<cfif (len(trim(getVC1())) AND NOT IsSimpleValue(trim(getVC1())))>
			<cfset thisError.field = "VC1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "VC1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getVC1())) GT 500)>
			<cfset thisError.field = "VC1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "VC1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- VC2 --->
		<cfif (len(trim(getVC2())) AND NOT IsSimpleValue(trim(getVC2())))>
			<cfset thisError.field = "VC2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "VC2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getVC2())) GT 500)>
			<cfset thisError.field = "VC2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "VC2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DT1 --->
		<cfif (len(trim(getDT1())) AND NOT isDate(trim(getDT1())))>
			<cfset thisError.field = "DT1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DT1 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DT2 --->
		<cfif (len(trim(getDT2())) AND NOT isDate(trim(getDT2())))>
			<cfset thisError.field = "DT2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DT2 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TXT1 --->
		<cfif (len(trim(getTXT1())) AND NOT IsSimpleValue(trim(getTXT1())))>
			<cfset thisError.field = "TXT1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TXT1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTXT1())) GT 63000)>
			<cfset thisError.field = "TXT1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TXT1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TXT2 --->
		<cfif (len(trim(getTXT2())) AND NOT IsSimpleValue(trim(getTXT2())))>
			<cfset thisError.field = "TXT2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TXT2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTXT2())) GT 63000)>
			<cfset thisError.field = "TXT2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TXT2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CorrectFlag --->
		<cfif (len(trim(getCorrectFlag())) AND NOT IsSimpleValue(trim(getCorrectFlag())))>
			<cfset thisError.field = "CorrectFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CorrectFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCorrectFlag())) GT 1)>
			<cfset thisError.field = "CorrectFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CorrectFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Updated --->
		<cfif (len(trim(getUpdated())) AND NOT isDate(trim(getUpdated())))>
			<cfset thisError.field = "Updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Deleted --->
		<cfif (len(trim(getDeleted())) AND NOT isDate(trim(getDeleted())))>
			<cfset thisError.field = "Deleted" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Deleted is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeletedFlag --->
		<cfif (len(trim(getDeletedFlag())) AND NOT IsSimpleValue(trim(getDeletedFlag())))>
			<cfset thisError.field = "DeletedFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeletedFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeletedFlag())) GT 1)>
			<cfset thisError.field = "DeletedFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeletedFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setAnswerID" access="public" returntype="void" output="false">
		<cfargument name="AnswerID" type="string" required="true" />
		<cfset variables.instance.AnswerID = arguments.AnswerID />
	</cffunction>
	<cffunction name="getAnswerID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AnswerID />
	</cffunction>

	<cffunction name="setResultID" access="public" returntype="void" output="false">
		<cfargument name="ResultID" type="string" required="true" />
		<cfset variables.instance.ResultID = arguments.ResultID />
	</cffunction>
	<cffunction name="getResultID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ResultID />
	</cffunction>

	<cffunction name="setAssessmentID" access="public" returntype="void" output="false">
		<cfargument name="AssessmentID" type="string" required="true" />
		<cfset variables.instance.AssessmentID = arguments.AssessmentID />
	</cffunction>
	<cffunction name="getAssessmentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentID />
	</cffunction>

	<cffunction name="setQuestionID" access="public" returntype="void" output="false">
		<cfargument name="QuestionID" type="string" required="true" />
		<cfset variables.instance.QuestionID = arguments.QuestionID />
	</cffunction>
	<cffunction name="getQuestionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.QuestionID />
	</cffunction>

	<cffunction name="setI1" access="public" returntype="void" output="false">
		<cfargument name="I1" type="string" required="true" />
		<cfset variables.instance.I1 = arguments.I1 />
	</cffunction>
	<cffunction name="getI1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.I1 />
	</cffunction>

	<cffunction name="setI2" access="public" returntype="void" output="false">
		<cfargument name="I2" type="string" required="true" />
		<cfset variables.instance.I2 = arguments.I2 />
	</cffunction>
	<cffunction name="getI2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.I2 />
	</cffunction>

	<cffunction name="setVC1" access="public" returntype="void" output="false">
		<cfargument name="VC1" type="string" required="true" />
		<cfset variables.instance.VC1 = arguments.VC1 />
	</cffunction>
	<cffunction name="getVC1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.VC1 />
	</cffunction>

	<cffunction name="setVC2" access="public" returntype="void" output="false">
		<cfargument name="VC2" type="string" required="true" />
		<cfset variables.instance.VC2 = arguments.VC2 />
	</cffunction>
	<cffunction name="getVC2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.VC2 />
	</cffunction>

	<cffunction name="setDT1" access="public" returntype="void" output="false">
		<cfargument name="DT1" type="string" required="true" />
		<cfset variables.instance.DT1 = arguments.DT1 />
	</cffunction>
	<cffunction name="getDT1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DT1 />
	</cffunction>

	<cffunction name="setDT2" access="public" returntype="void" output="false">
		<cfargument name="DT2" type="string" required="true" />
		<cfset variables.instance.DT2 = arguments.DT2 />
	</cffunction>
	<cffunction name="getDT2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DT2 />
	</cffunction>

	<cffunction name="setTXT1" access="public" returntype="void" output="false">
		<cfargument name="TXT1" type="string" required="true" />
		<cfset variables.instance.TXT1 = arguments.TXT1 />
	</cffunction>
	<cffunction name="getTXT1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TXT1 />
	</cffunction>

	<cffunction name="setTXT2" access="public" returntype="void" output="false">
		<cfargument name="TXT2" type="string" required="true" />
		<cfset variables.instance.TXT2 = arguments.TXT2 />
	</cffunction>
	<cffunction name="getTXT2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TXT2 />
	</cffunction>

	<cffunction name="setCorrectFlag" access="public" returntype="void" output="false">
		<cfargument name="CorrectFlag" type="string" required="true" />
		<cfset variables.instance.CorrectFlag = arguments.CorrectFlag />
	</cffunction>
	<cffunction name="getCorrectFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CorrectFlag />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
	</cffunction>

	<cffunction name="setUpdated" access="public" returntype="void" output="false">
		<cfargument name="Updated" type="string" required="true" />
		<cfset variables.instance.Updated = arguments.Updated />
	</cffunction>
	<cffunction name="getUpdated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Updated />
	</cffunction>

	<cffunction name="setDeleted" access="public" returntype="void" output="false">
		<cfargument name="Deleted" type="string" required="true" />
		<cfset variables.instance.Deleted = arguments.Deleted />
	</cffunction>
	<cffunction name="getDeleted" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Deleted />
	</cffunction>

	<cffunction name="setDeletedFlag" access="public" returntype="void" output="false">
		<cfargument name="DeletedFlag" type="string" required="true" />
		<cfset variables.instance.DeletedFlag = arguments.DeletedFlag />
	</cffunction>
	<cffunction name="getDeletedFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeletedFlag />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>

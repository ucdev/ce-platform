<cfcomponent displayname="AssessQuestion" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.AssessQuestion.AssessQuestion" output="false">
		<cfargument name="QuestionID" type="string" required="false" default="" />
		<cfargument name="QuestionTypeID" type="string" required="false" default="" />
		<cfargument name="AssessmentID" type="string" required="false" default="" />
		<cfargument name="LabelText" type="string" required="false" default="" />
		<cfargument name="DetailText" type="string" required="false" default="" />
		<cfargument name="RequiredFlag" type="string" required="false" default="" />
		<cfargument name="CorrectField" type="string" required="false" default="" />
		<cfargument name="SectionID" type="string" required="false" default="" />
		<cfargument name="Sort" type="string" required="false" default="" />
		<cfargument name="i1" type="string" required="false" default="" />
		<cfargument name="i2" type="string" required="false" default="" />
		<cfargument name="i3" type="string" required="false" default="" />
		<cfargument name="i4" type="string" required="false" default="" />
		<cfargument name="i5" type="string" required="false" default="" />
		<cfargument name="i6" type="string" required="false" default="" />
		<cfargument name="i7" type="string" required="false" default="" />
		<cfargument name="i8" type="string" required="false" default="" />
		<cfargument name="i9" type="string" required="false" default="" />
		<cfargument name="i10" type="string" required="false" default="" />
		<cfargument name="vc1" type="string" required="false" default="" />
		<cfargument name="vc2" type="string" required="false" default="" />
		<cfargument name="vc3" type="string" required="false" default="" />
		<cfargument name="vc4" type="string" required="false" default="" />
		<cfargument name="vc5" type="string" required="false" default="" />
		<cfargument name="vc6" type="string" required="false" default="" />
		<cfargument name="vc7" type="string" required="false" default="" />
		<cfargument name="vc8" type="string" required="false" default="" />
		<cfargument name="vc9" type="string" required="false" default="" />
		<cfargument name="vc10" type="string" required="false" default="" />
		<cfargument name="dt1" type="string" required="false" default="" />
		<cfargument name="dt2" type="string" required="false" default="" />
		<cfargument name="dt3" type="string" required="false" default="" />
		<cfargument name="dt4" type="string" required="false" default="" />
		<cfargument name="dt5" type="string" required="false" default="" />
		<cfargument name="txt1" type="string" required="false" default="" />
		<cfargument name="txt2" type="string" required="false" default="" />
		<cfargument name="txt3" type="string" required="false" default="" />
		<cfargument name="txt4" type="string" required="false" default="" />
		<cfargument name="txt5" type="string" required="false" default="" />
		<cfargument name="ExternalID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setQuestionID(arguments.QuestionID) />
		<cfset setQuestionTypeID(arguments.QuestionTypeID) />
		<cfset setAssessmentID(arguments.AssessmentID) />
		<cfset setLabelText(arguments.LabelText) />
		<cfset setDetailText(arguments.DetailText) />
		<cfset setRequiredFlag(arguments.RequiredFlag) />
		<cfset setCorrectField(arguments.CorrectField) />
		<cfset setSectionID(arguments.SectionID) />
		<cfset setSort(arguments.Sort) />
		<cfset seti1(arguments.i1) />
		<cfset seti2(arguments.i2) />
		<cfset seti3(arguments.i3) />
		<cfset seti4(arguments.i4) />
		<cfset seti5(arguments.i5) />
		<cfset seti6(arguments.i6) />
		<cfset seti7(arguments.i7) />
		<cfset seti8(arguments.i8) />
		<cfset seti9(arguments.i9) />
		<cfset seti10(arguments.i10) />
		<cfset setvc1(arguments.vc1) />
		<cfset setvc2(arguments.vc2) />
		<cfset setvc3(arguments.vc3) />
		<cfset setvc4(arguments.vc4) />
		<cfset setvc5(arguments.vc5) />
		<cfset setvc6(arguments.vc6) />
		<cfset setvc7(arguments.vc7) />
		<cfset setvc8(arguments.vc8) />
		<cfset setvc9(arguments.vc9) />
		<cfset setvc10(arguments.vc10) />
		<cfset setdt1(arguments.dt1) />
		<cfset setdt2(arguments.dt2) />
		<cfset setdt3(arguments.dt3) />
		<cfset setdt4(arguments.dt4) />
		<cfset setdt5(arguments.dt5) />
		<cfset settxt1(arguments.txt1) />
		<cfset settxt2(arguments.txt2) />
		<cfset settxt3(arguments.txt3) />
		<cfset settxt4(arguments.txt4) />
		<cfset settxt5(arguments.txt5) />
		<cfset setExternalID(arguments.ExternalID) />
		<cfset setCreated(arguments.Created) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.AssessQuestion.AssessQuestion" output="false">
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
		
		<!--- QuestionID --->
		<cfif (len(trim(getQuestionID())) AND NOT isNumeric(trim(getQuestionID())))>
			<cfset thisError.field = "QuestionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "QuestionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- QuestionTypeID --->
		<cfif (NOT len(trim(getQuestionTypeID())))>
			<cfset thisError.field = "QuestionTypeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "QuestionTypeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getQuestionTypeID())) AND NOT isNumeric(trim(getQuestionTypeID())))>
			<cfset thisError.field = "QuestionTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "QuestionTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AssessmentID --->
		<cfif (NOT len(trim(getAssessmentID())))>
			<cfset thisError.field = "AssessmentID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "AssessmentID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAssessmentID())) AND NOT isNumeric(trim(getAssessmentID())))>
			<cfset thisError.field = "AssessmentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- LabelText --->
		<cfif (NOT len(trim(getLabelText())))>
			<cfset thisError.field = "LabelText" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "LabelText is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLabelText())) AND NOT IsSimpleValue(trim(getLabelText())))>
			<cfset thisError.field = "LabelText" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "LabelText is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLabelText())) GT 1000)>
			<cfset thisError.field = "LabelText" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "LabelText is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DetailText --->
		<cfif (len(trim(getDetailText())) AND NOT IsSimpleValue(trim(getDetailText())))>
			<cfset thisError.field = "DetailText" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DetailText is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDetailText())) GT 63000)>
			<cfset thisError.field = "DetailText" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DetailText is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RequiredFlag --->
		<cfif (len(trim(getRequiredFlag())) AND NOT IsSimpleValue(trim(getRequiredFlag())))>
			<cfset thisError.field = "RequiredFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RequiredFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRequiredFlag())) GT 1)>
			<cfset thisError.field = "RequiredFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "RequiredFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CorrectField --->
		<cfif (len(trim(getCorrectField())) AND NOT IsSimpleValue(trim(getCorrectField())))>
			<cfset thisError.field = "CorrectField" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CorrectField is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCorrectField())) GT 3)>
			<cfset thisError.field = "CorrectField" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CorrectField is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SectionID --->
		<cfif (len(trim(getSectionID())) AND NOT isNumeric(trim(getSectionID())))>
			<cfset thisError.field = "SectionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SectionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Sort --->
		<cfif (len(trim(getSort())) AND NOT isNumeric(trim(getSort())))>
			<cfset thisError.field = "Sort" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sort is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i1 --->
		<cfif (len(trim(geti1())) AND NOT isNumeric(trim(geti1())))>
			<cfset thisError.field = "i1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i1 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i2 --->
		<cfif (len(trim(geti2())) AND NOT isNumeric(trim(geti2())))>
			<cfset thisError.field = "i2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i2 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i3 --->
		<cfif (len(trim(geti3())) AND NOT isNumeric(trim(geti3())))>
			<cfset thisError.field = "i3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i3 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i4 --->
		<cfif (len(trim(geti4())) AND NOT isNumeric(trim(geti4())))>
			<cfset thisError.field = "i4" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i4 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i5 --->
		<cfif (len(trim(geti5())) AND NOT isNumeric(trim(geti5())))>
			<cfset thisError.field = "i5" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i5 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i6 --->
		<cfif (len(trim(geti6())) AND NOT isNumeric(trim(geti6())))>
			<cfset thisError.field = "i6" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i6 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i7 --->
		<cfif (len(trim(geti7())) AND NOT isNumeric(trim(geti7())))>
			<cfset thisError.field = "i7" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i7 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i8 --->
		<cfif (len(trim(geti8())) AND NOT isNumeric(trim(geti8())))>
			<cfset thisError.field = "i8" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i8 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i9 --->
		<cfif (len(trim(geti9())) AND NOT isNumeric(trim(geti9())))>
			<cfset thisError.field = "i9" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i9 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- i10 --->
		<cfif (len(trim(geti10())) AND NOT isNumeric(trim(geti10())))>
			<cfset thisError.field = "i10" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "i10 is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc1 --->
		<cfif (len(trim(getvc1())) AND NOT IsSimpleValue(trim(getvc1())))>
			<cfset thisError.field = "vc1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc1())) GT 1000)>
			<cfset thisError.field = "vc1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc2 --->
		<cfif (len(trim(getvc2())) AND NOT IsSimpleValue(trim(getvc2())))>
			<cfset thisError.field = "vc2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc2())) GT 1000)>
			<cfset thisError.field = "vc2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc3 --->
		<cfif (len(trim(getvc3())) AND NOT IsSimpleValue(trim(getvc3())))>
			<cfset thisError.field = "vc3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc3 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc3())) GT 1000)>
			<cfset thisError.field = "vc3" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc3 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc4 --->
		<cfif (len(trim(getvc4())) AND NOT IsSimpleValue(trim(getvc4())))>
			<cfset thisError.field = "vc4" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc4 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc4())) GT 1000)>
			<cfset thisError.field = "vc4" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc4 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc5 --->
		<cfif (len(trim(getvc5())) AND NOT IsSimpleValue(trim(getvc5())))>
			<cfset thisError.field = "vc5" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc5 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc5())) GT 1000)>
			<cfset thisError.field = "vc5" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc5 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc6 --->
		<cfif (len(trim(getvc6())) AND NOT IsSimpleValue(trim(getvc6())))>
			<cfset thisError.field = "vc6" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc6 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc6())) GT 1000)>
			<cfset thisError.field = "vc6" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc6 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc7 --->
		<cfif (len(trim(getvc7())) AND NOT IsSimpleValue(trim(getvc7())))>
			<cfset thisError.field = "vc7" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc7 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc7())) GT 1000)>
			<cfset thisError.field = "vc7" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc7 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc8 --->
		<cfif (len(trim(getvc8())) AND NOT IsSimpleValue(trim(getvc8())))>
			<cfset thisError.field = "vc8" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc8 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc8())) GT 1000)>
			<cfset thisError.field = "vc8" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc8 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc9 --->
		<cfif (len(trim(getvc9())) AND NOT IsSimpleValue(trim(getvc9())))>
			<cfset thisError.field = "vc9" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc9 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc9())) GT 1000)>
			<cfset thisError.field = "vc9" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc9 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- vc10 --->
		<cfif (len(trim(getvc10())) AND NOT IsSimpleValue(trim(getvc10())))>
			<cfset thisError.field = "vc10" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "vc10 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getvc10())) GT 1000)>
			<cfset thisError.field = "vc10" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "vc10 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- dt1 --->
		<cfif (len(trim(getdt1())) AND NOT isDate(trim(getdt1())))>
			<cfset thisError.field = "dt1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "dt1 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- dt2 --->
		<cfif (len(trim(getdt2())) AND NOT isDate(trim(getdt2())))>
			<cfset thisError.field = "dt2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "dt2 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- dt3 --->
		<cfif (len(trim(getdt3())) AND NOT isDate(trim(getdt3())))>
			<cfset thisError.field = "dt3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "dt3 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- dt4 --->
		<cfif (len(trim(getdt4())) AND NOT isDate(trim(getdt4())))>
			<cfset thisError.field = "dt4" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "dt4 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- dt5 --->
		<cfif (len(trim(getdt5())) AND NOT isDate(trim(getdt5())))>
			<cfset thisError.field = "dt5" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "dt5 is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- txt1 --->
		<cfif (len(trim(gettxt1())) AND NOT IsSimpleValue(trim(gettxt1())))>
			<cfset thisError.field = "txt1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "txt1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettxt1())) GT 63000)>
			<cfset thisError.field = "txt1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "txt1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- txt2 --->
		<cfif (len(trim(gettxt2())) AND NOT IsSimpleValue(trim(gettxt2())))>
			<cfset thisError.field = "txt2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "txt2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettxt2())) GT 63000)>
			<cfset thisError.field = "txt2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "txt2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- txt3 --->
		<cfif (len(trim(gettxt3())) AND NOT IsSimpleValue(trim(gettxt3())))>
			<cfset thisError.field = "txt3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "txt3 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettxt3())) GT 63000)>
			<cfset thisError.field = "txt3" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "txt3 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- txt4 --->
		<cfif (len(trim(gettxt4())) AND NOT IsSimpleValue(trim(gettxt4())))>
			<cfset thisError.field = "txt4" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "txt4 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettxt4())) GT 63000)>
			<cfset thisError.field = "txt4" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "txt4 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- txt5 --->
		<cfif (len(trim(gettxt5())) AND NOT IsSimpleValue(trim(gettxt5())))>
			<cfset thisError.field = "txt5" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "txt5 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettxt5())) GT 63000)>
			<cfset thisError.field = "txt5" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "txt5 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ExternalID --->
		<cfif (len(trim(getExternalID())) AND NOT IsSimpleValue(trim(getExternalID())))>
			<cfset thisError.field = "ExternalID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ExternalID is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getExternalID())) GT 50)>
			<cfset thisError.field = "ExternalID" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ExternalID is too long" />
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
	<cffunction name="setQuestionID" access="public" returntype="void" output="false">
		<cfargument name="QuestionID" type="string" required="true" />
		<cfset variables.instance.QuestionID = arguments.QuestionID />
	</cffunction>
	<cffunction name="getQuestionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.QuestionID />
	</cffunction>

	<cffunction name="setQuestionTypeID" access="public" returntype="void" output="false">
		<cfargument name="QuestionTypeID" type="string" required="true" />
		<cfset variables.instance.QuestionTypeID = arguments.QuestionTypeID />
	</cffunction>
	<cffunction name="getQuestionTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.QuestionTypeID />
	</cffunction>

	<cffunction name="setAssessmentID" access="public" returntype="void" output="false">
		<cfargument name="AssessmentID" type="string" required="true" />
		<cfset variables.instance.AssessmentID = arguments.AssessmentID />
	</cffunction>
	<cffunction name="getAssessmentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentID />
	</cffunction>

	<cffunction name="setLabelText" access="public" returntype="void" output="false">
		<cfargument name="LabelText" type="string" required="true" />
		<cfset variables.instance.LabelText = arguments.LabelText />
	</cffunction>
	<cffunction name="getLabelText" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LabelText />
	</cffunction>

	<cffunction name="setDetailText" access="public" returntype="void" output="false">
		<cfargument name="DetailText" type="string" required="true" />
		<cfset variables.instance.DetailText = arguments.DetailText />
	</cffunction>
	<cffunction name="getDetailText" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DetailText />
	</cffunction>

	<cffunction name="setRequiredFlag" access="public" returntype="void" output="false">
		<cfargument name="RequiredFlag" type="string" required="true" />
		<cfset variables.instance.RequiredFlag = arguments.RequiredFlag />
	</cffunction>
	<cffunction name="getRequiredFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RequiredFlag />
	</cffunction>

	<cffunction name="setCorrectField" access="public" returntype="void" output="false">
		<cfargument name="CorrectField" type="string" required="true" />
		<cfset variables.instance.CorrectField = arguments.CorrectField />
	</cffunction>
	<cffunction name="getCorrectField" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CorrectField />
	</cffunction>

	<cffunction name="setSectionID" access="public" returntype="void" output="false">
		<cfargument name="SectionID" type="string" required="true" />
		<cfset variables.instance.SectionID = arguments.SectionID />
	</cffunction>
	<cffunction name="getSectionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SectionID />
	</cffunction>

	<cffunction name="setSort" access="public" returntype="void" output="false">
		<cfargument name="Sort" type="string" required="true" />
		<cfset variables.instance.Sort = arguments.Sort />
	</cffunction>
	<cffunction name="getSort" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sort />
	</cffunction>

	<cffunction name="seti1" access="public" returntype="void" output="false">
		<cfargument name="i1" type="string" required="true" />
		<cfset variables.instance.i1 = arguments.i1 />
	</cffunction>
	<cffunction name="geti1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i1 />
	</cffunction>

	<cffunction name="seti2" access="public" returntype="void" output="false">
		<cfargument name="i2" type="string" required="true" />
		<cfset variables.instance.i2 = arguments.i2 />
	</cffunction>
	<cffunction name="geti2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i2 />
	</cffunction>

	<cffunction name="seti3" access="public" returntype="void" output="false">
		<cfargument name="i3" type="string" required="true" />
		<cfset variables.instance.i3 = arguments.i3 />
	</cffunction>
	<cffunction name="geti3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i3 />
	</cffunction>

	<cffunction name="seti4" access="public" returntype="void" output="false">
		<cfargument name="i4" type="string" required="true" />
		<cfset variables.instance.i4 = arguments.i4 />
	</cffunction>
	<cffunction name="geti4" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i4 />
	</cffunction>

	<cffunction name="seti5" access="public" returntype="void" output="false">
		<cfargument name="i5" type="string" required="true" />
		<cfset variables.instance.i5 = arguments.i5 />
	</cffunction>
	<cffunction name="geti5" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i5 />
	</cffunction>

	<cffunction name="seti6" access="public" returntype="void" output="false">
		<cfargument name="i6" type="string" required="true" />
		<cfset variables.instance.i6 = arguments.i6 />
	</cffunction>
	<cffunction name="geti6" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i6 />
	</cffunction>

	<cffunction name="seti7" access="public" returntype="void" output="false">
		<cfargument name="i7" type="string" required="true" />
		<cfset variables.instance.i7 = arguments.i7 />
	</cffunction>
	<cffunction name="geti7" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i7 />
	</cffunction>

	<cffunction name="seti8" access="public" returntype="void" output="false">
		<cfargument name="i8" type="string" required="true" />
		<cfset variables.instance.i8 = arguments.i8 />
	</cffunction>
	<cffunction name="geti8" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i8 />
	</cffunction>

	<cffunction name="seti9" access="public" returntype="void" output="false">
		<cfargument name="i9" type="string" required="true" />
		<cfset variables.instance.i9 = arguments.i9 />
	</cffunction>
	<cffunction name="geti9" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i9 />
	</cffunction>

	<cffunction name="seti10" access="public" returntype="void" output="false">
		<cfargument name="i10" type="string" required="true" />
		<cfset variables.instance.i10 = arguments.i10 />
	</cffunction>
	<cffunction name="geti10" access="public" returntype="string" output="false">
		<cfreturn variables.instance.i10 />
	</cffunction>

	<cffunction name="setvc1" access="public" returntype="void" output="false">
		<cfargument name="vc1" type="string" required="true" />
		<cfset variables.instance.vc1 = arguments.vc1 />
	</cffunction>
	<cffunction name="getvc1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc1 />
	</cffunction>

	<cffunction name="setvc2" access="public" returntype="void" output="false">
		<cfargument name="vc2" type="string" required="true" />
		<cfset variables.instance.vc2 = arguments.vc2 />
	</cffunction>
	<cffunction name="getvc2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc2 />
	</cffunction>

	<cffunction name="setvc3" access="public" returntype="void" output="false">
		<cfargument name="vc3" type="string" required="true" />
		<cfset variables.instance.vc3 = arguments.vc3 />
	</cffunction>
	<cffunction name="getvc3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc3 />
	</cffunction>

	<cffunction name="setvc4" access="public" returntype="void" output="false">
		<cfargument name="vc4" type="string" required="true" />
		<cfset variables.instance.vc4 = arguments.vc4 />
	</cffunction>
	<cffunction name="getvc4" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc4 />
	</cffunction>

	<cffunction name="setvc5" access="public" returntype="void" output="false">
		<cfargument name="vc5" type="string" required="true" />
		<cfset variables.instance.vc5 = arguments.vc5 />
	</cffunction>
	<cffunction name="getvc5" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc5 />
	</cffunction>

	<cffunction name="setvc6" access="public" returntype="void" output="false">
		<cfargument name="vc6" type="string" required="true" />
		<cfset variables.instance.vc6 = arguments.vc6 />
	</cffunction>
	<cffunction name="getvc6" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc6 />
	</cffunction>

	<cffunction name="setvc7" access="public" returntype="void" output="false">
		<cfargument name="vc7" type="string" required="true" />
		<cfset variables.instance.vc7 = arguments.vc7 />
	</cffunction>
	<cffunction name="getvc7" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc7 />
	</cffunction>

	<cffunction name="setvc8" access="public" returntype="void" output="false">
		<cfargument name="vc8" type="string" required="true" />
		<cfset variables.instance.vc8 = arguments.vc8 />
	</cffunction>
	<cffunction name="getvc8" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc8 />
	</cffunction>

	<cffunction name="setvc9" access="public" returntype="void" output="false">
		<cfargument name="vc9" type="string" required="true" />
		<cfset variables.instance.vc9 = arguments.vc9 />
	</cffunction>
	<cffunction name="getvc9" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc9 />
	</cffunction>

	<cffunction name="setvc10" access="public" returntype="void" output="false">
		<cfargument name="vc10" type="string" required="true" />
		<cfset variables.instance.vc10 = arguments.vc10 />
	</cffunction>
	<cffunction name="getvc10" access="public" returntype="string" output="false">
		<cfreturn variables.instance.vc10 />
	</cffunction>

	<cffunction name="setdt1" access="public" returntype="void" output="false">
		<cfargument name="dt1" type="string" required="true" />
		<cfset variables.instance.dt1 = arguments.dt1 />
	</cffunction>
	<cffunction name="getdt1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dt1 />
	</cffunction>

	<cffunction name="setdt2" access="public" returntype="void" output="false">
		<cfargument name="dt2" type="string" required="true" />
		<cfset variables.instance.dt2 = arguments.dt2 />
	</cffunction>
	<cffunction name="getdt2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dt2 />
	</cffunction>

	<cffunction name="setdt3" access="public" returntype="void" output="false">
		<cfargument name="dt3" type="string" required="true" />
		<cfset variables.instance.dt3 = arguments.dt3 />
	</cffunction>
	<cffunction name="getdt3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dt3 />
	</cffunction>

	<cffunction name="setdt4" access="public" returntype="void" output="false">
		<cfargument name="dt4" type="string" required="true" />
		<cfset variables.instance.dt4 = arguments.dt4 />
	</cffunction>
	<cffunction name="getdt4" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dt4 />
	</cffunction>

	<cffunction name="setdt5" access="public" returntype="void" output="false">
		<cfargument name="dt5" type="string" required="true" />
		<cfset variables.instance.dt5 = arguments.dt5 />
	</cffunction>
	<cffunction name="getdt5" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dt5 />
	</cffunction>

	<cffunction name="settxt1" access="public" returntype="void" output="false">
		<cfargument name="txt1" type="string" required="true" />
		<cfset variables.instance.txt1 = arguments.txt1 />
	</cffunction>
	<cffunction name="gettxt1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.txt1 />
	</cffunction>

	<cffunction name="settxt2" access="public" returntype="void" output="false">
		<cfargument name="txt2" type="string" required="true" />
		<cfset variables.instance.txt2 = arguments.txt2 />
	</cffunction>
	<cffunction name="gettxt2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.txt2 />
	</cffunction>

	<cffunction name="settxt3" access="public" returntype="void" output="false">
		<cfargument name="txt3" type="string" required="true" />
		<cfset variables.instance.txt3 = arguments.txt3 />
	</cffunction>
	<cffunction name="gettxt3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.txt3 />
	</cffunction>

	<cffunction name="settxt4" access="public" returntype="void" output="false">
		<cfargument name="txt4" type="string" required="true" />
		<cfset variables.instance.txt4 = arguments.txt4 />
	</cffunction>
	<cffunction name="gettxt4" access="public" returntype="string" output="false">
		<cfreturn variables.instance.txt4 />
	</cffunction>

	<cffunction name="settxt5" access="public" returntype="void" output="false">
		<cfargument name="txt5" type="string" required="true" />
		<cfset variables.instance.txt5 = arguments.txt5 />
	</cffunction>
	<cffunction name="gettxt5" access="public" returntype="string" output="false">
		<cfreturn variables.instance.txt5 />
	</cffunction>

	<cffunction name="setExternalID" access="public" returntype="void" output="false">
		<cfargument name="ExternalID" type="string" required="true" />
		<cfset variables.instance.ExternalID = arguments.ExternalID />
	</cffunction>
	<cffunction name="getExternalID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExternalID />
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

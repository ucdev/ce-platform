<cfcomponent displayname="AttendeeCDC" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Attendee.AttendeeCDC" output="false">
		<cfargument name="AttendeeCDCID" type="string" required="false" default="" />
		<cfargument name="AttendeeID" type="string" required="false" default="" />
		<cfargument name="CBAFundId" type="string" required="false" default="" />
		<cfargument name="CBACDC" type="string" required="false" default="" />
		<cfargument name="CBAOth" type="string" required="false" default="" />
		<cfargument name="CBOFundId" type="string" required="false" default="" />
		<cfargument name="CBOCDC" type="string" required="false" default="" />
		<cfargument name="CBOOth" type="string" required="false" default="" />
		<cfargument name="FunRCId" type="string" required="false" default="" />
		<cfargument name="FunRCSp" type="string" required="false" default="" />
		<cfargument name="FunRNId" type="string" required="false" default="" />
		<cfargument name="FunRNSp" type="string" required="false" default="" />
		<cfargument name="MarketId" type="string" required="false" default="" />
		<cfargument name="Mspecify" type="string" required="false" default="" />
		<cfargument name="OccClassId" type="string" required="false" default="" />
		<cfargument name="OrgTypeId" type="string" required="false" default="" />
		<cfargument name="Tspecify" type="string" required="false" default="" />
		<cfargument name="ProfCId" type="string" required="false" default="" />
		<cfargument name="ProfCSp" type="string" required="false" default="" />
		<cfargument name="ProfNId" type="string" required="false" default="" />
		<cfargument name="ProfNSp" type="string" required="false" default="" />
		<cfargument name="PrinEmpID" type="string" required="false" default="" />
		<cfargument name="PrinEmpSp" type="string" required="false" default="" />
		<cfargument name="WorkState" type="string" required="false" default="" />
		<cfargument name="WorkZip" type="string" required="false" default="" />
		<cfargument name="FocSTD" type="string" required="false" default="" />
		<cfargument name="FocHIV" type="string" required="false" default="" />
		<cfargument name="FocWRH" type="string" required="false" default="" />
		<cfargument name="FocGen" type="string" required="false" default="" />
		<cfargument name="FocAdol" type="string" required="false" default="" />
		<cfargument name="FocMH" type="string" required="false" default="" />
		<cfargument name="FocSub" type="string" required="false" default="" />
		<cfargument name="FocEm" type="string" required="false" default="" />
		<cfargument name="FocCor" type="string" required="false" default="" />
		<cfargument name="FocOth" type="string" required="false" default="" />
		<cfargument name="FocSpec" type="string" required="false" default="" />
		<cfargument name="PopGen" type="string" required="false" default="" />
		<cfargument name="PopAdol" type="string" required="false" default="" />
		<cfargument name="PopGLB" type="string" required="false" default="" />
		<cfargument name="PopTran" type="string" required="false" default="" />
		<cfargument name="PopHome" type="string" required="false" default="" />
		<cfargument name="PopCorr" type="string" required="false" default="" />
		<cfargument name="PopPreg" type="string" required="false" default="" />
		<cfargument name="PopSW" type="string" required="false" default="" />
		<cfargument name="PopAA" type="string" required="false" default="" />
		<cfargument name="PopAs" type="string" required="false" default="" />
		<cfargument name="PopNH" type="string" required="false" default="" />
		<cfargument name="PopAIAN" type="string" required="false" default="" />
		<cfargument name="PopHisp" type="string" required="false" default="" />
		<cfargument name="PopImm" type="string" required="false" default="" />
		<cfargument name="PopIDU" type="string" required="false" default="" />
		<cfargument name="PopSub" type="string" required="false" default="" />
		<cfargument name="PopHIV" type="string" required="false" default="" />
		<cfargument name="PopOth" type="string" required="false" default="" />
		<cfargument name="PopSpec" type="string" required="false" default="" />
		<cfargument name="Updates" type="string" required="false" default="" />
		<cfargument name="Eval" type="string" required="false" default="" />
		<cfargument name="TrainingAlert" type="string" required="false" default="" />
		<cfargument name="CurrentlyEnrolled" type="string" required="false" default="" />
		<cfargument name="RelevantTraining" type="string" required="false" default="" />
		<cfargument name="MotivationTraining" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setAttendeeCDCID(arguments.AttendeeCDCID) />
		<cfset setAttendeeID(arguments.AttendeeID) />
		<cfset setCBAFundId(arguments.CBAFundId) />
		<cfset setCBACDC(arguments.CBACDC) />
		<cfset setCBAOth(arguments.CBAOth) />
		<cfset setCBOFundId(arguments.CBOFundId) />
		<cfset setCBOCDC(arguments.CBOCDC) />
		<cfset setCBOOth(arguments.CBOOth) />
		<cfset setFunRCId(arguments.FunRCId) />
		<cfset setFunRCSp(arguments.FunRCSp) />
		<cfset setFunRNId(arguments.FunRNId) />
		<cfset setFunRNSp(arguments.FunRNSp) />
		<cfset setMarketId(arguments.MarketId) />
		<cfset setMspecify(arguments.Mspecify) />
		<cfset setOccClassId(arguments.OccClassId) />
		<cfset setOrgTypeId(arguments.OrgTypeId) />
		<cfset setTspecify(arguments.Tspecify) />
		<cfset setProfCId(arguments.ProfCId) />
		<cfset setProfCSp(arguments.ProfCSp) />
		<cfset setProfNId(arguments.ProfNId) />
		<cfset setProfNSp(arguments.ProfNSp) />
		<cfset setPrinEmpID(arguments.PrinEmpID) />
		<cfset setPrinEmpSp(arguments.PrinEmpSp) />
		<cfset setWorkState(arguments.WorkState) />
		<cfset setWorkZip(arguments.WorkZip) />
		<cfset setFocSTD(arguments.FocSTD) />
		<cfset setFocHIV(arguments.FocHIV) />
		<cfset setFocWRH(arguments.FocWRH) />
		<cfset setFocGen(arguments.FocGen) />
		<cfset setFocAdol(arguments.FocAdol) />
		<cfset setFocMH(arguments.FocMH) />
		<cfset setFocSub(arguments.FocSub) />
		<cfset setFocEm(arguments.FocEm) />
		<cfset setFocCor(arguments.FocCor) />
		<cfset setFocOth(arguments.FocOth) />
		<cfset setFocSpec(arguments.FocSpec) />
		<cfset setPopGen(arguments.PopGen) />
		<cfset setPopAdol(arguments.PopAdol) />
		<cfset setPopGLB(arguments.PopGLB) />
		<cfset setPopTran(arguments.PopTran) />
		<cfset setPopHome(arguments.PopHome) />
		<cfset setPopCorr(arguments.PopCorr) />
		<cfset setPopPreg(arguments.PopPreg) />
		<cfset setPopSW(arguments.PopSW) />
		<cfset setPopAA(arguments.PopAA) />
		<cfset setPopAs(arguments.PopAs) />
		<cfset setPopNH(arguments.PopNH) />
		<cfset setPopAIAN(arguments.PopAIAN) />
		<cfset setPopHisp(arguments.PopHisp) />
		<cfset setPopImm(arguments.PopImm) />
		<cfset setPopIDU(arguments.PopIDU) />
		<cfset setPopSub(arguments.PopSub) />
		<cfset setPopHIV(arguments.PopHIV) />
		<cfset setPopOth(arguments.PopOth) />
		<cfset setPopSpec(arguments.PopSpec) />
		<cfset setUpdates(arguments.Updates) />
		<cfset setEval(arguments.Eval) />
		<cfset setTrainingAlert(arguments.TrainingAlert) />
		<cfset setCurrentlyEnrolled(arguments.CurrentlyEnrolled) />
		<cfset setRelevantTraining(arguments.RelevantTraining) />
		<cfset setMotivationTraining(arguments.MotivationTraining) />
		<cfset setCreated(arguments.Created) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setUpdatedBy(arguments.UpdatedBy) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.Attendee.AttendeeCDC" output="false">
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
		
		<!--- AttendeeCDCID --->
		<cfif (len(trim(getAttendeeCDCID())) AND NOT isNumeric(trim(getAttendeeCDCID())))>
			<cfset thisError.field = "AttendeeCDCID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AttendeeCDCID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AttendeeID --->
		<cfif (NOT len(trim(getAttendeeID())))>
			<cfset thisError.field = "AttendeeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "AttendeeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAttendeeID())) AND NOT isNumeric(trim(getAttendeeID())))>
			<cfset thisError.field = "AttendeeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AttendeeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CBAFundId --->
		<cfif (len(trim(getCBAFundId())) AND NOT isNumeric(trim(getCBAFundId())))>
			<cfset thisError.field = "CBAFundId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CBAFundId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CBACDC --->
		<cfif (len(trim(getCBACDC())) AND NOT IsSimpleValue(trim(getCBACDC())))>
			<cfset thisError.field = "CBACDC" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CBACDC is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCBACDC())) GT 30)>
			<cfset thisError.field = "CBACDC" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CBACDC is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CBAOth --->
		<cfif (len(trim(getCBAOth())) AND NOT IsSimpleValue(trim(getCBAOth())))>
			<cfset thisError.field = "CBAOth" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CBAOth is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCBAOth())) GT 30)>
			<cfset thisError.field = "CBAOth" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CBAOth is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CBOFundId --->
		<cfif (len(trim(getCBOFundId())) AND NOT isNumeric(trim(getCBOFundId())))>
			<cfset thisError.field = "CBOFundId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CBOFundId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CBOCDC --->
		<cfif (len(trim(getCBOCDC())) AND NOT IsSimpleValue(trim(getCBOCDC())))>
			<cfset thisError.field = "CBOCDC" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CBOCDC is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCBOCDC())) GT 30)>
			<cfset thisError.field = "CBOCDC" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CBOCDC is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CBOOth --->
		<cfif (len(trim(getCBOOth())) AND NOT IsSimpleValue(trim(getCBOOth())))>
			<cfset thisError.field = "CBOOth" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CBOOth is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCBOOth())) GT 30)>
			<cfset thisError.field = "CBOOth" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CBOOth is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FunRCId --->
		<cfif (len(trim(getFunRCId())) AND NOT isNumeric(trim(getFunRCId())))>
			<cfset thisError.field = "FunRCId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FunRCId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FunRCSp --->
		<cfif (len(trim(getFunRCSp())) AND NOT IsSimpleValue(trim(getFunRCSp())))>
			<cfset thisError.field = "FunRCSp" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FunRCSp is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFunRCSp())) GT 30)>
			<cfset thisError.field = "FunRCSp" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FunRCSp is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FunRNId --->
		<cfif (len(trim(getFunRNId())) AND NOT isNumeric(trim(getFunRNId())))>
			<cfset thisError.field = "FunRNId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FunRNId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FunRNSp --->
		<cfif (len(trim(getFunRNSp())) AND NOT IsSimpleValue(trim(getFunRNSp())))>
			<cfset thisError.field = "FunRNSp" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FunRNSp is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFunRNSp())) GT 30)>
			<cfset thisError.field = "FunRNSp" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FunRNSp is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MarketId --->
		<cfif (len(trim(getMarketId())) AND NOT isNumeric(trim(getMarketId())))>
			<cfset thisError.field = "MarketId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MarketId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Mspecify --->
		<cfif (len(trim(getMspecify())) AND NOT IsSimpleValue(trim(getMspecify())))>
			<cfset thisError.field = "Mspecify" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Mspecify is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getMspecify())) GT 30)>
			<cfset thisError.field = "Mspecify" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Mspecify is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OccClassId --->
		<cfif (len(trim(getOccClassId())) AND NOT isNumeric(trim(getOccClassId())))>
			<cfset thisError.field = "OccClassId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OccClassId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OrgTypeId --->
		<cfif (len(trim(getOrgTypeId())) AND NOT isNumeric(trim(getOrgTypeId())))>
			<cfset thisError.field = "OrgTypeId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OrgTypeId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Tspecify --->
		<cfif (len(trim(getTspecify())) AND NOT IsSimpleValue(trim(getTspecify())))>
			<cfset thisError.field = "Tspecify" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Tspecify is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTspecify())) GT 30)>
			<cfset thisError.field = "Tspecify" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Tspecify is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProfCId --->
		<cfif (len(trim(getProfCId())) AND NOT isNumeric(trim(getProfCId())))>
			<cfset thisError.field = "ProfCId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProfCId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProfCSp --->
		<cfif (len(trim(getProfCSp())) AND NOT IsSimpleValue(trim(getProfCSp())))>
			<cfset thisError.field = "ProfCSp" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProfCSp is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getProfCSp())) GT 30)>
			<cfset thisError.field = "ProfCSp" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ProfCSp is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProfNId --->
		<cfif (len(trim(getProfNId())) AND NOT isNumeric(trim(getProfNId())))>
			<cfset thisError.field = "ProfNId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProfNId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProfNSp --->
		<cfif (len(trim(getProfNSp())) AND NOT IsSimpleValue(trim(getProfNSp())))>
			<cfset thisError.field = "ProfNSp" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProfNSp is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getProfNSp())) GT 30)>
			<cfset thisError.field = "ProfNSp" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ProfNSp is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PrinEmpID --->
		<cfif (len(trim(getPrinEmpID())) AND NOT isNumeric(trim(getPrinEmpID())))>
			<cfset thisError.field = "PrinEmpID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PrinEmpID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PrinEmpSp --->
		<cfif (len(trim(getPrinEmpSp())) AND NOT IsSimpleValue(trim(getPrinEmpSp())))>
			<cfset thisError.field = "PrinEmpSp" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PrinEmpSp is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPrinEmpSp())) GT 30)>
			<cfset thisError.field = "PrinEmpSp" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PrinEmpSp is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WorkState --->
		<cfif (len(trim(getWorkState())) AND NOT IsSimpleValue(trim(getWorkState())))>
			<cfset thisError.field = "WorkState" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Work State is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkState())) GT 15)>
			<cfset thisError.field = "WorkState" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Work State is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WorkZip --->
		<cfif (len(trim(getWorkZip())) AND NOT IsSimpleValue(trim(getWorkZip())))>
			<cfset thisError.field = "WorkZip" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Work Zip is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getWorkZip())) GT 10)>
			<cfset thisError.field = "WorkZip" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Work Zip is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocSTD --->
		<cfif (NOT len(trim(getFocSTD())))>
			<cfset thisError.field = "FocSTD" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocSTD is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocSTD())) AND NOT IsSimpleValue(trim(getFocSTD())))>
			<cfset thisError.field = "FocSTD" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocSTD is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocSTD())) GT 1)>
			<cfset thisError.field = "FocSTD" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocSTD is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocHIV --->
		<cfif (NOT len(trim(getFocHIV())))>
			<cfset thisError.field = "FocHIV" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocHIV is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocHIV())) AND NOT IsSimpleValue(trim(getFocHIV())))>
			<cfset thisError.field = "FocHIV" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocHIV is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocHIV())) GT 1)>
			<cfset thisError.field = "FocHIV" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocHIV is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocWRH --->
		<cfif (NOT len(trim(getFocWRH())))>
			<cfset thisError.field = "FocWRH" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocWRH is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocWRH())) AND NOT IsSimpleValue(trim(getFocWRH())))>
			<cfset thisError.field = "FocWRH" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocWRH is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocWRH())) GT 1)>
			<cfset thisError.field = "FocWRH" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocWRH is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocGen --->
		<cfif (NOT len(trim(getFocGen())))>
			<cfset thisError.field = "FocGen" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocGen is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocGen())) AND NOT IsSimpleValue(trim(getFocGen())))>
			<cfset thisError.field = "FocGen" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocGen is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocGen())) GT 1)>
			<cfset thisError.field = "FocGen" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocGen is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocAdol --->
		<cfif (NOT len(trim(getFocAdol())))>
			<cfset thisError.field = "FocAdol" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocAdol is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocAdol())) AND NOT IsSimpleValue(trim(getFocAdol())))>
			<cfset thisError.field = "FocAdol" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocAdol is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocAdol())) GT 1)>
			<cfset thisError.field = "FocAdol" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocAdol is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocMH --->
		<cfif (NOT len(trim(getFocMH())))>
			<cfset thisError.field = "FocMH" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocMH is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocMH())) AND NOT IsSimpleValue(trim(getFocMH())))>
			<cfset thisError.field = "FocMH" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocMH is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocMH())) GT 1)>
			<cfset thisError.field = "FocMH" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocMH is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocSub --->
		<cfif (NOT len(trim(getFocSub())))>
			<cfset thisError.field = "FocSub" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocSub is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocSub())) AND NOT IsSimpleValue(trim(getFocSub())))>
			<cfset thisError.field = "FocSub" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocSub is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocSub())) GT 1)>
			<cfset thisError.field = "FocSub" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocSub is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocEm --->
		<cfif (NOT len(trim(getFocEm())))>
			<cfset thisError.field = "FocEm" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocEm is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocEm())) AND NOT IsSimpleValue(trim(getFocEm())))>
			<cfset thisError.field = "FocEm" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocEm is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocEm())) GT 1)>
			<cfset thisError.field = "FocEm" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocEm is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocCor --->
		<cfif (NOT len(trim(getFocCor())))>
			<cfset thisError.field = "FocCor" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocCor is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocCor())) AND NOT IsSimpleValue(trim(getFocCor())))>
			<cfset thisError.field = "FocCor" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocCor is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocCor())) GT 1)>
			<cfset thisError.field = "FocCor" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocCor is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocOth --->
		<cfif (NOT len(trim(getFocOth())))>
			<cfset thisError.field = "FocOth" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FocOth is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocOth())) AND NOT IsSimpleValue(trim(getFocOth())))>
			<cfset thisError.field = "FocOth" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocOth is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocOth())) GT 1)>
			<cfset thisError.field = "FocOth" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocOth is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FocSpec --->
		<cfif (len(trim(getFocSpec())) AND NOT IsSimpleValue(trim(getFocSpec())))>
			<cfset thisError.field = "FocSpec" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FocSpec is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFocSpec())) GT 30)>
			<cfset thisError.field = "FocSpec" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FocSpec is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopGen --->
		<cfif (NOT len(trim(getPopGen())))>
			<cfset thisError.field = "PopGen" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopGen is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopGen())) AND NOT IsSimpleValue(trim(getPopGen())))>
			<cfset thisError.field = "PopGen" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopGen is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopGen())) GT 1)>
			<cfset thisError.field = "PopGen" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopGen is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopAdol --->
		<cfif (NOT len(trim(getPopAdol())))>
			<cfset thisError.field = "PopAdol" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopAdol is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAdol())) AND NOT IsSimpleValue(trim(getPopAdol())))>
			<cfset thisError.field = "PopAdol" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopAdol is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAdol())) GT 1)>
			<cfset thisError.field = "PopAdol" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopAdol is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopGLB --->
		<cfif (NOT len(trim(getPopGLB())))>
			<cfset thisError.field = "PopGLB" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopGLB is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopGLB())) AND NOT IsSimpleValue(trim(getPopGLB())))>
			<cfset thisError.field = "PopGLB" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopGLB is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopGLB())) GT 1)>
			<cfset thisError.field = "PopGLB" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopGLB is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopTran --->
		<cfif (NOT len(trim(getPopTran())))>
			<cfset thisError.field = "PopTran" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopTran is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopTran())) AND NOT IsSimpleValue(trim(getPopTran())))>
			<cfset thisError.field = "PopTran" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopTran is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopTran())) GT 1)>
			<cfset thisError.field = "PopTran" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopTran is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopHome --->
		<cfif (NOT len(trim(getPopHome())))>
			<cfset thisError.field = "PopHome" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopHome is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopHome())) AND NOT IsSimpleValue(trim(getPopHome())))>
			<cfset thisError.field = "PopHome" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopHome is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopHome())) GT 1)>
			<cfset thisError.field = "PopHome" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopHome is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopCorr --->
		<cfif (NOT len(trim(getPopCorr())))>
			<cfset thisError.field = "PopCorr" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopCorr is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopCorr())) AND NOT IsSimpleValue(trim(getPopCorr())))>
			<cfset thisError.field = "PopCorr" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopCorr is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopCorr())) GT 1)>
			<cfset thisError.field = "PopCorr" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopCorr is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopPreg --->
		<cfif (NOT len(trim(getPopPreg())))>
			<cfset thisError.field = "PopPreg" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopPreg is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopPreg())) AND NOT IsSimpleValue(trim(getPopPreg())))>
			<cfset thisError.field = "PopPreg" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopPreg is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopPreg())) GT 1)>
			<cfset thisError.field = "PopPreg" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopPreg is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopSW --->
		<cfif (NOT len(trim(getPopSW())))>
			<cfset thisError.field = "PopSW" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopSW is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopSW())) AND NOT IsSimpleValue(trim(getPopSW())))>
			<cfset thisError.field = "PopSW" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopSW is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopSW())) GT 1)>
			<cfset thisError.field = "PopSW" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopSW is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopAA --->
		<cfif (NOT len(trim(getPopAA())))>
			<cfset thisError.field = "PopAA" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopAA is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAA())) AND NOT IsSimpleValue(trim(getPopAA())))>
			<cfset thisError.field = "PopAA" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopAA is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAA())) GT 1)>
			<cfset thisError.field = "PopAA" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopAA is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopAs --->
		<cfif (NOT len(trim(getPopAs())))>
			<cfset thisError.field = "PopAs" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopAs is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAs())) AND NOT IsSimpleValue(trim(getPopAs())))>
			<cfset thisError.field = "PopAs" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopAs is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAs())) GT 1)>
			<cfset thisError.field = "PopAs" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopAs is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopNH --->
		<cfif (NOT len(trim(getPopNH())))>
			<cfset thisError.field = "PopNH" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopNH is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopNH())) AND NOT IsSimpleValue(trim(getPopNH())))>
			<cfset thisError.field = "PopNH" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopNH is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopNH())) GT 1)>
			<cfset thisError.field = "PopNH" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopNH is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopAIAN --->
		<cfif (NOT len(trim(getPopAIAN())))>
			<cfset thisError.field = "PopAIAN" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopAIAN is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAIAN())) AND NOT IsSimpleValue(trim(getPopAIAN())))>
			<cfset thisError.field = "PopAIAN" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopAIAN is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopAIAN())) GT 1)>
			<cfset thisError.field = "PopAIAN" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopAIAN is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopHisp --->
		<cfif (NOT len(trim(getPopHisp())))>
			<cfset thisError.field = "PopHisp" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopHisp is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopHisp())) AND NOT IsSimpleValue(trim(getPopHisp())))>
			<cfset thisError.field = "PopHisp" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopHisp is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopHisp())) GT 1)>
			<cfset thisError.field = "PopHisp" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopHisp is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopImm --->
		<cfif (NOT len(trim(getPopImm())))>
			<cfset thisError.field = "PopImm" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopImm is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopImm())) AND NOT IsSimpleValue(trim(getPopImm())))>
			<cfset thisError.field = "PopImm" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopImm is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopImm())) GT 1)>
			<cfset thisError.field = "PopImm" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopImm is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopIDU --->
		<cfif (NOT len(trim(getPopIDU())))>
			<cfset thisError.field = "PopIDU" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopIDU is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopIDU())) AND NOT IsSimpleValue(trim(getPopIDU())))>
			<cfset thisError.field = "PopIDU" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopIDU is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopIDU())) GT 1)>
			<cfset thisError.field = "PopIDU" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopIDU is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopSub --->
		<cfif (NOT len(trim(getPopSub())))>
			<cfset thisError.field = "PopSub" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopSub is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopSub())) AND NOT IsSimpleValue(trim(getPopSub())))>
			<cfset thisError.field = "PopSub" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopSub is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopSub())) GT 1)>
			<cfset thisError.field = "PopSub" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopSub is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopHIV --->
		<cfif (NOT len(trim(getPopHIV())))>
			<cfset thisError.field = "PopHIV" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopHIV is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopHIV())) AND NOT IsSimpleValue(trim(getPopHIV())))>
			<cfset thisError.field = "PopHIV" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopHIV is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopHIV())) GT 1)>
			<cfset thisError.field = "PopHIV" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopHIV is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopOth --->
		<cfif (NOT len(trim(getPopOth())))>
			<cfset thisError.field = "PopOth" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PopOth is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopOth())) AND NOT IsSimpleValue(trim(getPopOth())))>
			<cfset thisError.field = "PopOth" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopOth is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopOth())) GT 1)>
			<cfset thisError.field = "PopOth" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopOth is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PopSpec --->
		<cfif (len(trim(getPopSpec())) AND NOT IsSimpleValue(trim(getPopSpec())))>
			<cfset thisError.field = "PopSpec" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PopSpec is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPopSpec())) GT 30)>
			<cfset thisError.field = "PopSpec" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PopSpec is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Updates --->
		<cfif (len(trim(getUpdates())) AND NOT IsSimpleValue(trim(getUpdates())))>
			<cfset thisError.field = "Updates" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Updates is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUpdates())) GT 1)>
			<cfset thisError.field = "Updates" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Updates is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Eval --->
		<cfif (len(trim(getEval())) AND NOT IsSimpleValue(trim(getEval())))>
			<cfset thisError.field = "Eval" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Eval is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getEval())) GT 1)>
			<cfset thisError.field = "Eval" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Eval is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TrainingAlert --->
		<cfif (len(trim(getTrainingAlert())) AND NOT IsSimpleValue(trim(getTrainingAlert())))>
			<cfset thisError.field = "TrainingAlert" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TrainingAlert is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTrainingAlert())) GT 1)>
			<cfset thisError.field = "TrainingAlert" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TrainingAlert is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CurrentlyEnrolled --->
		<cfif (len(trim(getCurrentlyEnrolled())) AND NOT IsSimpleValue(trim(getCurrentlyEnrolled())))>
			<cfset thisError.field = "CurrentlyEnrolled" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CurrentlyEnrolled is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCurrentlyEnrolled())) GT 1)>
			<cfset thisError.field = "CurrentlyEnrolled" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CurrentlyEnrolled is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RelevantTraining --->
		<cfif (len(trim(getRelevantTraining())) AND NOT IsSimpleValue(trim(getRelevantTraining())))>
			<cfset thisError.field = "RelevantTraining" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RelevantTraining is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRelevantTraining())) GT 1)>
			<cfset thisError.field = "RelevantTraining" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "RelevantTraining is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MotivationTraining --->
		<cfif (len(trim(getMotivationTraining())) AND NOT IsSimpleValue(trim(getMotivationTraining())))>
			<cfset thisError.field = "MotivationTraining" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MotivationTraining is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getMotivationTraining())) GT 1)>
			<cfset thisError.field = "MotivationTraining" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "MotivationTraining is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreatedBy --->
		<cfif (NOT len(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CreatedBy is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCreatedBy())) AND NOT isNumeric(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Updated --->
		<cfif (len(trim(getUpdated())) AND NOT isDate(trim(getUpdated())))>
			<cfset thisError.field = "Updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UpdatedBy --->
		<cfif (len(trim(getUpdatedBy())) AND NOT isNumeric(trim(getUpdatedBy())))>
			<cfset thisError.field = "UpdatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UpdatedBy is not numeric" />
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
	<cffunction name="setAttendeeCDCID" access="public" returntype="void" output="false">
		<cfargument name="AttendeeCDCID" type="string" required="true" />
		<cfset variables.instance.AttendeeCDCID = arguments.AttendeeCDCID />
	</cffunction>
	<cffunction name="getAttendeeCDCID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AttendeeCDCID />
	</cffunction>

	<cffunction name="setAttendeeID" access="public" returntype="void" output="false">
		<cfargument name="AttendeeID" type="string" required="true" />
		<cfset variables.instance.AttendeeID = arguments.AttendeeID />
	</cffunction>
	<cffunction name="getAttendeeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AttendeeID />
	</cffunction>

	<cffunction name="setCBAFundId" access="public" returntype="void" output="false">
		<cfargument name="CBAFundId" type="string" required="true" />
		<cfset variables.instance.CBAFundId = arguments.CBAFundId />
	</cffunction>
	<cffunction name="getCBAFundId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CBAFundId />
	</cffunction>

	<cffunction name="setCBACDC" access="public" returntype="void" output="false">
		<cfargument name="CBACDC" type="string" required="true" />
		<cfset variables.instance.CBACDC = arguments.CBACDC />
	</cffunction>
	<cffunction name="getCBACDC" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CBACDC />
	</cffunction>

	<cffunction name="setCBAOth" access="public" returntype="void" output="false">
		<cfargument name="CBAOth" type="string" required="true" />
		<cfset variables.instance.CBAOth = arguments.CBAOth />
	</cffunction>
	<cffunction name="getCBAOth" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CBAOth />
	</cffunction>

	<cffunction name="setCBOFundId" access="public" returntype="void" output="false">
		<cfargument name="CBOFundId" type="string" required="true" />
		<cfset variables.instance.CBOFundId = arguments.CBOFundId />
	</cffunction>
	<cffunction name="getCBOFundId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CBOFundId />
	</cffunction>

	<cffunction name="setCBOCDC" access="public" returntype="void" output="false">
		<cfargument name="CBOCDC" type="string" required="true" />
		<cfset variables.instance.CBOCDC = arguments.CBOCDC />
	</cffunction>
	<cffunction name="getCBOCDC" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CBOCDC />
	</cffunction>

	<cffunction name="setCBOOth" access="public" returntype="void" output="false">
		<cfargument name="CBOOth" type="string" required="true" />
		<cfset variables.instance.CBOOth = arguments.CBOOth />
	</cffunction>
	<cffunction name="getCBOOth" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CBOOth />
	</cffunction>

	<cffunction name="setFunRCId" access="public" returntype="void" output="false">
		<cfargument name="FunRCId" type="string" required="true" />
		<cfset variables.instance.FunRCId = arguments.FunRCId />
	</cffunction>
	<cffunction name="getFunRCId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FunRCId />
	</cffunction>

	<cffunction name="setFunRCSp" access="public" returntype="void" output="false">
		<cfargument name="FunRCSp" type="string" required="true" />
		<cfset variables.instance.FunRCSp = arguments.FunRCSp />
	</cffunction>
	<cffunction name="getFunRCSp" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FunRCSp />
	</cffunction>

	<cffunction name="setFunRNId" access="public" returntype="void" output="false">
		<cfargument name="FunRNId" type="string" required="true" />
		<cfset variables.instance.FunRNId = arguments.FunRNId />
	</cffunction>
	<cffunction name="getFunRNId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FunRNId />
	</cffunction>

	<cffunction name="setFunRNSp" access="public" returntype="void" output="false">
		<cfargument name="FunRNSp" type="string" required="true" />
		<cfset variables.instance.FunRNSp = arguments.FunRNSp />
	</cffunction>
	<cffunction name="getFunRNSp" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FunRNSp />
	</cffunction>

	<cffunction name="setMarketId" access="public" returntype="void" output="false">
		<cfargument name="MarketId" type="string" required="true" />
		<cfset variables.instance.MarketId = arguments.MarketId />
	</cffunction>
	<cffunction name="getMarketId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MarketId />
	</cffunction>

	<cffunction name="setMspecify" access="public" returntype="void" output="false">
		<cfargument name="Mspecify" type="string" required="true" />
		<cfset variables.instance.Mspecify = arguments.Mspecify />
	</cffunction>
	<cffunction name="getMspecify" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Mspecify />
	</cffunction>

	<cffunction name="setOccClassId" access="public" returntype="void" output="false">
		<cfargument name="OccClassId" type="string" required="true" />
		<cfset variables.instance.OccClassId = arguments.OccClassId />
	</cffunction>
	<cffunction name="getOccClassId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OccClassId />
	</cffunction>

	<cffunction name="setOrgTypeId" access="public" returntype="void" output="false">
		<cfargument name="OrgTypeId" type="string" required="true" />
		<cfset variables.instance.OrgTypeId = arguments.OrgTypeId />
	</cffunction>
	<cffunction name="getOrgTypeId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OrgTypeId />
	</cffunction>

	<cffunction name="setTspecify" access="public" returntype="void" output="false">
		<cfargument name="Tspecify" type="string" required="true" />
		<cfset variables.instance.Tspecify = arguments.Tspecify />
	</cffunction>
	<cffunction name="getTspecify" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Tspecify />
	</cffunction>

	<cffunction name="setProfCId" access="public" returntype="void" output="false">
		<cfargument name="ProfCId" type="string" required="true" />
		<cfset variables.instance.ProfCId = arguments.ProfCId />
	</cffunction>
	<cffunction name="getProfCId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProfCId />
	</cffunction>

	<cffunction name="setProfCSp" access="public" returntype="void" output="false">
		<cfargument name="ProfCSp" type="string" required="true" />
		<cfset variables.instance.ProfCSp = arguments.ProfCSp />
	</cffunction>
	<cffunction name="getProfCSp" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProfCSp />
	</cffunction>

	<cffunction name="setProfNId" access="public" returntype="void" output="false">
		<cfargument name="ProfNId" type="string" required="true" />
		<cfset variables.instance.ProfNId = arguments.ProfNId />
	</cffunction>
	<cffunction name="getProfNId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProfNId />
	</cffunction>

	<cffunction name="setProfNSp" access="public" returntype="void" output="false">
		<cfargument name="ProfNSp" type="string" required="true" />
		<cfset variables.instance.ProfNSp = arguments.ProfNSp />
	</cffunction>
	<cffunction name="getProfNSp" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProfNSp />
	</cffunction>

	<cffunction name="setPrinEmpID" access="public" returntype="void" output="false">
		<cfargument name="PrinEmpID" type="string" required="true" />
		<cfset variables.instance.PrinEmpID = arguments.PrinEmpID />
	</cffunction>
	<cffunction name="getPrinEmpID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PrinEmpID />
	</cffunction>

	<cffunction name="setPrinEmpSp" access="public" returntype="void" output="false">
		<cfargument name="PrinEmpSp" type="string" required="true" />
		<cfset variables.instance.PrinEmpSp = arguments.PrinEmpSp />
	</cffunction>
	<cffunction name="getPrinEmpSp" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PrinEmpSp />
	</cffunction>

	<cffunction name="setWorkState" access="public" returntype="void" output="false">
		<cfargument name="WorkState" type="string" required="true" />
		<cfset variables.instance.WorkState = arguments.WorkState />
	</cffunction>
	<cffunction name="getWorkState" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WorkState />
	</cffunction>

	<cffunction name="setWorkZip" access="public" returntype="void" output="false">
		<cfargument name="WorkZip" type="string" required="true" />
		<cfset variables.instance.WorkZip = arguments.WorkZip />
	</cffunction>
	<cffunction name="getWorkZip" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WorkZip />
	</cffunction>

	<cffunction name="setFocSTD" access="public" returntype="void" output="false">
		<cfargument name="FocSTD" type="string" required="true" />
		<cfset variables.instance.FocSTD = arguments.FocSTD />
	</cffunction>
	<cffunction name="getFocSTD" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocSTD />
	</cffunction>

	<cffunction name="setFocHIV" access="public" returntype="void" output="false">
		<cfargument name="FocHIV" type="string" required="true" />
		<cfset variables.instance.FocHIV = arguments.FocHIV />
	</cffunction>
	<cffunction name="getFocHIV" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocHIV />
	</cffunction>

	<cffunction name="setFocWRH" access="public" returntype="void" output="false">
		<cfargument name="FocWRH" type="string" required="true" />
		<cfset variables.instance.FocWRH = arguments.FocWRH />
	</cffunction>
	<cffunction name="getFocWRH" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocWRH />
	</cffunction>

	<cffunction name="setFocGen" access="public" returntype="void" output="false">
		<cfargument name="FocGen" type="string" required="true" />
		<cfset variables.instance.FocGen = arguments.FocGen />
	</cffunction>
	<cffunction name="getFocGen" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocGen />
	</cffunction>

	<cffunction name="setFocAdol" access="public" returntype="void" output="false">
		<cfargument name="FocAdol" type="string" required="true" />
		<cfset variables.instance.FocAdol = arguments.FocAdol />
	</cffunction>
	<cffunction name="getFocAdol" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocAdol />
	</cffunction>

	<cffunction name="setFocMH" access="public" returntype="void" output="false">
		<cfargument name="FocMH" type="string" required="true" />
		<cfset variables.instance.FocMH = arguments.FocMH />
	</cffunction>
	<cffunction name="getFocMH" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocMH />
	</cffunction>

	<cffunction name="setFocSub" access="public" returntype="void" output="false">
		<cfargument name="FocSub" type="string" required="true" />
		<cfset variables.instance.FocSub = arguments.FocSub />
	</cffunction>
	<cffunction name="getFocSub" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocSub />
	</cffunction>

	<cffunction name="setFocEm" access="public" returntype="void" output="false">
		<cfargument name="FocEm" type="string" required="true" />
		<cfset variables.instance.FocEm = arguments.FocEm />
	</cffunction>
	<cffunction name="getFocEm" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocEm />
	</cffunction>

	<cffunction name="setFocCor" access="public" returntype="void" output="false">
		<cfargument name="FocCor" type="string" required="true" />
		<cfset variables.instance.FocCor = arguments.FocCor />
	</cffunction>
	<cffunction name="getFocCor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocCor />
	</cffunction>

	<cffunction name="setFocOth" access="public" returntype="void" output="false">
		<cfargument name="FocOth" type="string" required="true" />
		<cfset variables.instance.FocOth = arguments.FocOth />
	</cffunction>
	<cffunction name="getFocOth" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocOth />
	</cffunction>

	<cffunction name="setFocSpec" access="public" returntype="void" output="false">
		<cfargument name="FocSpec" type="string" required="true" />
		<cfset variables.instance.FocSpec = arguments.FocSpec />
	</cffunction>
	<cffunction name="getFocSpec" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FocSpec />
	</cffunction>

	<cffunction name="setPopGen" access="public" returntype="void" output="false">
		<cfargument name="PopGen" type="string" required="true" />
		<cfset variables.instance.PopGen = arguments.PopGen />
	</cffunction>
	<cffunction name="getPopGen" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopGen />
	</cffunction>

	<cffunction name="setPopAdol" access="public" returntype="void" output="false">
		<cfargument name="PopAdol" type="string" required="true" />
		<cfset variables.instance.PopAdol = arguments.PopAdol />
	</cffunction>
	<cffunction name="getPopAdol" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopAdol />
	</cffunction>

	<cffunction name="setPopGLB" access="public" returntype="void" output="false">
		<cfargument name="PopGLB" type="string" required="true" />
		<cfset variables.instance.PopGLB = arguments.PopGLB />
	</cffunction>
	<cffunction name="getPopGLB" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopGLB />
	</cffunction>

	<cffunction name="setPopTran" access="public" returntype="void" output="false">
		<cfargument name="PopTran" type="string" required="true" />
		<cfset variables.instance.PopTran = arguments.PopTran />
	</cffunction>
	<cffunction name="getPopTran" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopTran />
	</cffunction>

	<cffunction name="setPopHome" access="public" returntype="void" output="false">
		<cfargument name="PopHome" type="string" required="true" />
		<cfset variables.instance.PopHome = arguments.PopHome />
	</cffunction>
	<cffunction name="getPopHome" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopHome />
	</cffunction>

	<cffunction name="setPopCorr" access="public" returntype="void" output="false">
		<cfargument name="PopCorr" type="string" required="true" />
		<cfset variables.instance.PopCorr = arguments.PopCorr />
	</cffunction>
	<cffunction name="getPopCorr" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopCorr />
	</cffunction>

	<cffunction name="setPopPreg" access="public" returntype="void" output="false">
		<cfargument name="PopPreg" type="string" required="true" />
		<cfset variables.instance.PopPreg = arguments.PopPreg />
	</cffunction>
	<cffunction name="getPopPreg" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopPreg />
	</cffunction>

	<cffunction name="setPopSW" access="public" returntype="void" output="false">
		<cfargument name="PopSW" type="string" required="true" />
		<cfset variables.instance.PopSW = arguments.PopSW />
	</cffunction>
	<cffunction name="getPopSW" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopSW />
	</cffunction>

	<cffunction name="setPopAA" access="public" returntype="void" output="false">
		<cfargument name="PopAA" type="string" required="true" />
		<cfset variables.instance.PopAA = arguments.PopAA />
	</cffunction>
	<cffunction name="getPopAA" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopAA />
	</cffunction>

	<cffunction name="setPopAs" access="public" returntype="void" output="false">
		<cfargument name="PopAs" type="string" required="true" />
		<cfset variables.instance.PopAs = arguments.PopAs />
	</cffunction>
	<cffunction name="getPopAs" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopAs />
	</cffunction>

	<cffunction name="setPopNH" access="public" returntype="void" output="false">
		<cfargument name="PopNH" type="string" required="true" />
		<cfset variables.instance.PopNH = arguments.PopNH />
	</cffunction>
	<cffunction name="getPopNH" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopNH />
	</cffunction>

	<cffunction name="setPopAIAN" access="public" returntype="void" output="false">
		<cfargument name="PopAIAN" type="string" required="true" />
		<cfset variables.instance.PopAIAN = arguments.PopAIAN />
	</cffunction>
	<cffunction name="getPopAIAN" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopAIAN />
	</cffunction>

	<cffunction name="setPopHisp" access="public" returntype="void" output="false">
		<cfargument name="PopHisp" type="string" required="true" />
		<cfset variables.instance.PopHisp = arguments.PopHisp />
	</cffunction>
	<cffunction name="getPopHisp" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopHisp />
	</cffunction>

	<cffunction name="setPopImm" access="public" returntype="void" output="false">
		<cfargument name="PopImm" type="string" required="true" />
		<cfset variables.instance.PopImm = arguments.PopImm />
	</cffunction>
	<cffunction name="getPopImm" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopImm />
	</cffunction>

	<cffunction name="setPopIDU" access="public" returntype="void" output="false">
		<cfargument name="PopIDU" type="string" required="true" />
		<cfset variables.instance.PopIDU = arguments.PopIDU />
	</cffunction>
	<cffunction name="getPopIDU" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopIDU />
	</cffunction>

	<cffunction name="setPopSub" access="public" returntype="void" output="false">
		<cfargument name="PopSub" type="string" required="true" />
		<cfset variables.instance.PopSub = arguments.PopSub />
	</cffunction>
	<cffunction name="getPopSub" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopSub />
	</cffunction>

	<cffunction name="setPopHIV" access="public" returntype="void" output="false">
		<cfargument name="PopHIV" type="string" required="true" />
		<cfset variables.instance.PopHIV = arguments.PopHIV />
	</cffunction>
	<cffunction name="getPopHIV" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopHIV />
	</cffunction>

	<cffunction name="setPopOth" access="public" returntype="void" output="false">
		<cfargument name="PopOth" type="string" required="true" />
		<cfset variables.instance.PopOth = arguments.PopOth />
	</cffunction>
	<cffunction name="getPopOth" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopOth />
	</cffunction>

	<cffunction name="setPopSpec" access="public" returntype="void" output="false">
		<cfargument name="PopSpec" type="string" required="true" />
		<cfset variables.instance.PopSpec = arguments.PopSpec />
	</cffunction>
	<cffunction name="getPopSpec" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PopSpec />
	</cffunction>

	<cffunction name="setUpdates" access="public" returntype="void" output="false">
		<cfargument name="Updates" type="string" required="true" />
		<cfset variables.instance.Updates = arguments.Updates />
	</cffunction>
	<cffunction name="getUpdates" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Updates />
	</cffunction>

	<cffunction name="setEval" access="public" returntype="void" output="false">
		<cfargument name="Eval" type="string" required="true" />
		<cfset variables.instance.Eval = arguments.Eval />
	</cffunction>
	<cffunction name="getEval" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Eval />
	</cffunction>

	<cffunction name="setTrainingAlert" access="public" returntype="void" output="false">
		<cfargument name="TrainingAlert" type="string" required="true" />
		<cfset variables.instance.TrainingAlert = arguments.TrainingAlert />
	</cffunction>
	<cffunction name="getTrainingAlert" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TrainingAlert />
	</cffunction>

	<cffunction name="setCurrentlyEnrolled" access="public" returntype="void" output="false">
		<cfargument name="CurrentlyEnrolled" type="string" required="true" />
		<cfset variables.instance.CurrentlyEnrolled = arguments.CurrentlyEnrolled />
	</cffunction>
	<cffunction name="getCurrentlyEnrolled" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CurrentlyEnrolled />
	</cffunction>

	<cffunction name="setRelevantTraining" access="public" returntype="void" output="false">
		<cfargument name="RelevantTraining" type="string" required="true" />
		<cfset variables.instance.RelevantTraining = arguments.RelevantTraining />
	</cffunction>
	<cffunction name="getRelevantTraining" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RelevantTraining />
	</cffunction>

	<cffunction name="setMotivationTraining" access="public" returntype="void" output="false">
		<cfargument name="MotivationTraining" type="string" required="true" />
		<cfset variables.instance.MotivationTraining = arguments.MotivationTraining />
	</cffunction>
	<cffunction name="getMotivationTraining" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MotivationTraining />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
	</cffunction>

	<cffunction name="setCreatedBy" access="public" returntype="void" output="false">
		<cfargument name="CreatedBy" type="string" required="true" />
		<cfset variables.instance.CreatedBy = arguments.CreatedBy />
	</cffunction>
	<cffunction name="getCreatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreatedBy />
	</cffunction>

	<cffunction name="setUpdated" access="public" returntype="void" output="false">
		<cfargument name="Updated" type="string" required="true" />
		<cfset variables.instance.Updated = arguments.Updated />
	</cffunction>
	<cffunction name="getUpdated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Updated />
	</cffunction>

	<cffunction name="setUpdatedBy" access="public" returntype="void" output="false">
		<cfargument name="UpdatedBy" type="string" required="true" />
		<cfset variables.instance.UpdatedBy = arguments.UpdatedBy />
	</cffunction>
	<cffunction name="getUpdatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UpdatedBy />
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

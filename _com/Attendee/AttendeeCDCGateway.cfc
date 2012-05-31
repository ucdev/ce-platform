<cfcomponent displayname="AttendeeCDCGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Attendee.AttendeeCDCGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeCDCID" type="numeric" required="false" />
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="CBAFundId" type="numeric" required="false" />
		<cfargument name="CBACDC" type="string" required="false" />
		<cfargument name="CBAOth" type="string" required="false" />
		<cfargument name="CBOFundId" type="numeric" required="false" />
		<cfargument name="CBOCDC" type="string" required="false" />
		<cfargument name="CBOOth" type="string" required="false" />
		<cfargument name="FunRCId" type="numeric" required="false" />
		<cfargument name="FunRCSp" type="string" required="false" />
		<cfargument name="FunRNId" type="numeric" required="false" />
		<cfargument name="FunRNSp" type="string" required="false" />
		<cfargument name="MarketId" type="numeric" required="false" />
		<cfargument name="Mspecify" type="string" required="false" />
		<cfargument name="OccClassId" type="numeric" required="false" />
		<cfargument name="OrgTypeId" type="numeric" required="false" />
		<cfargument name="Tspecify" type="string" required="false" />
		<cfargument name="ProfCId" type="numeric" required="false" />
		<cfargument name="ProfCSp" type="string" required="false" />
		<cfargument name="ProfNId" type="numeric" required="false" />
		<cfargument name="ProfNSp" type="string" required="false" />
		<cfargument name="PrinEmpID" type="numeric" required="false" />
		<cfargument name="PrinEmpSp" type="string" required="false" />
		<cfargument name="WorkState" type="string" required="false" />
		<cfargument name="WorkZip" type="string" required="false" />
		<cfargument name="FocSTD" type="string" required="false" />
		<cfargument name="FocHIV" type="string" required="false" />
		<cfargument name="FocWRH" type="string" required="false" />
		<cfargument name="FocGen" type="string" required="false" />
		<cfargument name="FocAdol" type="string" required="false" />
		<cfargument name="FocMH" type="string" required="false" />
		<cfargument name="FocSub" type="string" required="false" />
		<cfargument name="FocEm" type="string" required="false" />
		<cfargument name="FocCor" type="string" required="false" />
		<cfargument name="FocOth" type="string" required="false" />
		<cfargument name="FocSpec" type="string" required="false" />
		<cfargument name="PopGen" type="string" required="false" />
		<cfargument name="PopAdol" type="string" required="false" />
		<cfargument name="PopGLB" type="string" required="false" />
		<cfargument name="PopTran" type="string" required="false" />
		<cfargument name="PopHome" type="string" required="false" />
		<cfargument name="PopCorr" type="string" required="false" />
		<cfargument name="PopPreg" type="string" required="false" />
		<cfargument name="PopSW" type="string" required="false" />
		<cfargument name="PopAA" type="string" required="false" />
		<cfargument name="PopAs" type="string" required="false" />
		<cfargument name="PopNH" type="string" required="false" />
		<cfargument name="PopAIAN" type="string" required="false" />
		<cfargument name="PopHisp" type="string" required="false" />
		<cfargument name="PopImm" type="string" required="false" />
		<cfargument name="PopIDU" type="string" required="false" />
		<cfargument name="PopSub" type="string" required="false" />
		<cfargument name="PopHIV" type="string" required="false" />
		<cfargument name="PopOth" type="string" required="false" />
		<cfargument name="PopSpec" type="string" required="false" />
		<cfargument name="Updates" type="string" required="false" />
		<cfargument name="Eval" type="string" required="false" />
		<cfargument name="TrainingAlert" type="string" required="false" />
		<cfargument name="CurrentlyEnrolled" type="string" required="false" />
		<cfargument name="RelevantTraining" type="string" required="false" />
		<cfargument name="MotivationTraining" type="string" required="false" />
		<cfargument name="SentFlag" type="string" required="false" />
		<cfargument name="SentDate" type="date" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				AttendeeCDCID,
				AttendeeID,
				CBAFundId,
				CBACDC,
				CBAOth,
				CBOFundId,
				CBOCDC,
				CBOOth,
				FunRCId,
				FunRCSp,
				FunRNId,
				FunRNSp,
				MarketId,
				Mspecify,
				OccClassId,
				OrgTypeId,
				Tspecify,
				ProfCId,
				ProfCSp,
				ProfNId,
				ProfNSp,
				PrinEmpID,
				PrinEmpSp,
				WorkState,
				WorkZip,
				FocSTD,
				FocHIV,
				FocWRH,
				FocGen,
				FocAdol,
				FocMH,
				FocSub,
				FocEm,
				FocCor,
				FocOth,
				FocSpec,
				PopGen,
				PopAdol,
				PopGLB,
				PopTran,
				PopHome,
				PopCorr,
				PopPreg,
				PopSW,
				PopAA,
				PopAs,
				PopNH,
				PopAIAN,
				PopHisp,
				PopImm,
				PopIDU,
				PopSub,
				PopHIV,
				PopOth,
				PopSpec,
				Updates,
				Eval,
				TrainingAlert,
				CurrentlyEnrolled,
				RelevantTraining,
				MotivationTraining,
				SentFlag,
				SentDate,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_AttendeeCDC
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AttendeeCDCID") and len(arguments.AttendeeCDCID)>
			AND	AttendeeCDCID = <cfqueryparam value="#arguments.AttendeeCDCID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CBAFundId") and len(arguments.CBAFundId)>
			AND	CBAFundId = <cfqueryparam value="#arguments.CBAFundId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CBACDC") and len(arguments.CBACDC)>
			AND	CBACDC = <cfqueryparam value="#arguments.CBACDC#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CBAOth") and len(arguments.CBAOth)>
			AND	CBAOth = <cfqueryparam value="#arguments.CBAOth#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CBOFundId") and len(arguments.CBOFundId)>
			AND	CBOFundId = <cfqueryparam value="#arguments.CBOFundId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CBOCDC") and len(arguments.CBOCDC)>
			AND	CBOCDC = <cfqueryparam value="#arguments.CBOCDC#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CBOOth") and len(arguments.CBOOth)>
			AND	CBOOth = <cfqueryparam value="#arguments.CBOOth#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRCId") and len(arguments.FunRCId)>
			AND	FunRCId = <cfqueryparam value="#arguments.FunRCId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRCSp") and len(arguments.FunRCSp)>
			AND	FunRCSp = <cfqueryparam value="#arguments.FunRCSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRNId") and len(arguments.FunRNId)>
			AND	FunRNId = <cfqueryparam value="#arguments.FunRNId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRNSp") and len(arguments.FunRNSp)>
			AND	FunRNSp = <cfqueryparam value="#arguments.FunRNSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"MarketId") and len(arguments.MarketId)>
			AND	MarketId = <cfqueryparam value="#arguments.MarketId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Mspecify") and len(arguments.Mspecify)>
			AND	Mspecify = <cfqueryparam value="#arguments.Mspecify#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OccClassId") and len(arguments.OccClassId)>
			AND	OccClassId = <cfqueryparam value="#arguments.OccClassId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OrgTypeId") and len(arguments.OrgTypeId)>
			AND	OrgTypeId = <cfqueryparam value="#arguments.OrgTypeId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Tspecify") and len(arguments.Tspecify)>
			AND	Tspecify = <cfqueryparam value="#arguments.Tspecify#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfCId") and len(arguments.ProfCId)>
			AND	ProfCId = <cfqueryparam value="#arguments.ProfCId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfCSp") and len(arguments.ProfCSp)>
			AND	ProfCSp = <cfqueryparam value="#arguments.ProfCSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfNId") and len(arguments.ProfNId)>
			AND	ProfNId = <cfqueryparam value="#arguments.ProfNId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfNSp") and len(arguments.ProfNSp)>
			AND	ProfNSp = <cfqueryparam value="#arguments.ProfNSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PrinEmpID") and len(arguments.PrinEmpID)>
			AND	PrinEmpID = <cfqueryparam value="#arguments.PrinEmpID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PrinEmpSp") and len(arguments.PrinEmpSp)>
			AND	PrinEmpSp = <cfqueryparam value="#arguments.PrinEmpSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"WorkState") and len(arguments.WorkState)>
			AND	WorkState = <cfqueryparam value="#arguments.WorkState#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"WorkZip") and len(arguments.WorkZip)>
			AND	WorkZip = <cfqueryparam value="#arguments.WorkZip#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FocSTD") and len(arguments.FocSTD)>
			AND	FocSTD = <cfqueryparam value="#arguments.FocSTD#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocHIV") and len(arguments.FocHIV)>
			AND	FocHIV = <cfqueryparam value="#arguments.FocHIV#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocWRH") and len(arguments.FocWRH)>
			AND	FocWRH = <cfqueryparam value="#arguments.FocWRH#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocGen") and len(arguments.FocGen)>
			AND	FocGen = <cfqueryparam value="#arguments.FocGen#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocAdol") and len(arguments.FocAdol)>
			AND	FocAdol = <cfqueryparam value="#arguments.FocAdol#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocMH") and len(arguments.FocMH)>
			AND	FocMH = <cfqueryparam value="#arguments.FocMH#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocSub") and len(arguments.FocSub)>
			AND	FocSub = <cfqueryparam value="#arguments.FocSub#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocEm") and len(arguments.FocEm)>
			AND	FocEm = <cfqueryparam value="#arguments.FocEm#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocCor") and len(arguments.FocCor)>
			AND	FocCor = <cfqueryparam value="#arguments.FocCor#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocOth") and len(arguments.FocOth)>
			AND	FocOth = <cfqueryparam value="#arguments.FocOth#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocSpec") and len(arguments.FocSpec)>
			AND	FocSpec = <cfqueryparam value="#arguments.FocSpec#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PopGen") and len(arguments.PopGen)>
			AND	PopGen = <cfqueryparam value="#arguments.PopGen#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAdol") and len(arguments.PopAdol)>
			AND	PopAdol = <cfqueryparam value="#arguments.PopAdol#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopGLB") and len(arguments.PopGLB)>
			AND	PopGLB = <cfqueryparam value="#arguments.PopGLB#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopTran") and len(arguments.PopTran)>
			AND	PopTran = <cfqueryparam value="#arguments.PopTran#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopHome") and len(arguments.PopHome)>
			AND	PopHome = <cfqueryparam value="#arguments.PopHome#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopCorr") and len(arguments.PopCorr)>
			AND	PopCorr = <cfqueryparam value="#arguments.PopCorr#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopPreg") and len(arguments.PopPreg)>
			AND	PopPreg = <cfqueryparam value="#arguments.PopPreg#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopSW") and len(arguments.PopSW)>
			AND	PopSW = <cfqueryparam value="#arguments.PopSW#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAA") and len(arguments.PopAA)>
			AND	PopAA = <cfqueryparam value="#arguments.PopAA#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAs") and len(arguments.PopAs)>
			AND	PopAs = <cfqueryparam value="#arguments.PopAs#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopNH") and len(arguments.PopNH)>
			AND	PopNH = <cfqueryparam value="#arguments.PopNH#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAIAN") and len(arguments.PopAIAN)>
			AND	PopAIAN = <cfqueryparam value="#arguments.PopAIAN#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopHisp") and len(arguments.PopHisp)>
			AND	PopHisp = <cfqueryparam value="#arguments.PopHisp#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopImm") and len(arguments.PopImm)>
			AND	PopImm = <cfqueryparam value="#arguments.PopImm#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopIDU") and len(arguments.PopIDU)>
			AND	PopIDU = <cfqueryparam value="#arguments.PopIDU#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopSub") and len(arguments.PopSub)>
			AND	PopSub = <cfqueryparam value="#arguments.PopSub#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopHIV") and len(arguments.PopHIV)>
			AND	PopHIV = <cfqueryparam value="#arguments.PopHIV#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopOth") and len(arguments.PopOth)>
			AND	PopOth = <cfqueryparam value="#arguments.PopOth#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopSpec") and len(arguments.PopSpec)>
			AND	PopSpec = <cfqueryparam value="#arguments.PopSpec#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Updates") and len(arguments.Updates)>
			AND	Updates = <cfqueryparam value="#arguments.Updates#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Eval") and len(arguments.Eval)>
			AND	Eval = <cfqueryparam value="#arguments.Eval#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TrainingAlert") and len(arguments.TrainingAlert)>
			AND	TrainingAlert = <cfqueryparam value="#arguments.TrainingAlert#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CurrentlyEnrolled") and len(arguments.CurrentlyEnrolled)>
			AND	CurrentlyEnrolled = <cfqueryparam value="#arguments.CurrentlyEnrolled#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"RelevantTraining") and len(arguments.RelevantTraining)>
			AND	RelevantTraining = <cfqueryparam value="#arguments.RelevantTraining#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"MotivationTraining") and len(arguments.MotivationTraining)>
			AND	MotivationTraining = <cfqueryparam value="#arguments.MotivationTraining#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SentFlag") and len(arguments.SentFlag)>
			AND	SentFlag = <cfqueryparam value="#arguments.SentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SentDate") and len(arguments.SentDate)>
			AND	SentDate = <cfqueryparam value="#arguments.SentDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
    
    <cffunction name="getByCDCAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeCDCID" type="numeric" required="false" />
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="CBAFundId" type="numeric" required="false" />
		<cfargument name="CBACDC" type="string" required="false" />
		<cfargument name="CBAOth" type="string" required="false" />
		<cfargument name="CBOFundId" type="numeric" required="false" />
		<cfargument name="CBOCDC" type="string" required="false" />
		<cfargument name="CBOOth" type="string" required="false" />
		<cfargument name="FunRCId" type="numeric" required="false" />
		<cfargument name="FunRCSp" type="string" required="false" />
		<cfargument name="FunRNId" type="numeric" required="false" />
		<cfargument name="FunRNSp" type="string" required="false" />
		<cfargument name="MarketId" type="numeric" required="false" />
		<cfargument name="Mspecify" type="string" required="false" />
		<cfargument name="OccClassId" type="numeric" required="false" />
		<cfargument name="OrgTypeId" type="numeric" required="false" />
		<cfargument name="Tspecify" type="string" required="false" />
		<cfargument name="ProfCId" type="numeric" required="false" />
		<cfargument name="ProfCSp" type="string" required="false" />
		<cfargument name="ProfNId" type="numeric" required="false" />
		<cfargument name="ProfNSp" type="string" required="false" />
		<cfargument name="PrinEmpID" type="numeric" required="false" />
		<cfargument name="PrinEmpSp" type="string" required="false" />
		<cfargument name="WorkState" type="string" required="false" />
		<cfargument name="WorkZip" type="string" required="false" />
		<cfargument name="FocSTD" type="string" required="false" />
		<cfargument name="FocHIV" type="string" required="false" />
		<cfargument name="FocWRH" type="string" required="false" />
		<cfargument name="FocGen" type="string" required="false" />
		<cfargument name="FocAdol" type="string" required="false" />
		<cfargument name="FocMH" type="string" required="false" />
		<cfargument name="FocSub" type="string" required="false" />
		<cfargument name="FocEm" type="string" required="false" />
		<cfargument name="FocCor" type="string" required="false" />
		<cfargument name="FocOth" type="string" required="false" />
		<cfargument name="FocSpec" type="string" required="false" />
		<cfargument name="PopGen" type="string" required="false" />
		<cfargument name="PopAdol" type="string" required="false" />
		<cfargument name="PopGLB" type="string" required="false" />
		<cfargument name="PopTran" type="string" required="false" />
		<cfargument name="PopHome" type="string" required="false" />
		<cfargument name="PopCorr" type="string" required="false" />
		<cfargument name="PopPreg" type="string" required="false" />
		<cfargument name="PopSW" type="string" required="false" />
		<cfargument name="PopAA" type="string" required="false" />
		<cfargument name="PopAs" type="string" required="false" />
		<cfargument name="PopNH" type="string" required="false" />
		<cfargument name="PopAIAN" type="string" required="false" />
		<cfargument name="PopHisp" type="string" required="false" />
		<cfargument name="PopImm" type="string" required="false" />
		<cfargument name="PopIDU" type="string" required="false" />
		<cfargument name="PopSub" type="string" required="false" />
		<cfargument name="PopHIV" type="string" required="false" />
		<cfargument name="PopOth" type="string" required="false" />
		<cfargument name="PopSpec" type="string" required="false" />
		<cfargument name="Updates" type="string" required="false" />
		<cfargument name="Person" type="string" required="false" />
		<cfargument name="Eval" type="string" required="false" />
		<cfargument name="TrainingAlert" type="string" required="false" />
		<cfargument name="CurrentlyEnrolled" type="string" required="false" />
		<cfargument name="RelevantTraining" type="string" required="false" />
		<cfargument name="MotivationTraining" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />

		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				acdc.AttendeeCDCID,
				att.AttendeeID,
				acdc.CBAFundId,
				acdc.CBACDC,
				acdc.CBAOth,
				acdc.CBOFundId,
				acdc.CBOCDC,
				acdc.CBOOth,
				acdc.FunRCId,
				acdc.FunRCSp,
				acdc.FunRNId,
				acdc.FunRNSp,
				acdc.MarketId,
				acdc.Mspecify,
				acdc.OccClassId,
				acdc.OrgTypeId,
				acdc.Tspecify,
				acdc.ProfCId,
				acdc.ProfCSp,
				acdc.ProfNId,
				acdc.ProfNSp,
				acdc.PrinEmpID,
				acdc.PrinEmpSp,
				acdc.WorkState,
				acdc.WorkZip,
				acdc.FocSTD,
				acdc.FocHIV,
				acdc.FocWRH,
				acdc.FocGen,
				acdc.FocAdol,
				acdc.FocMH,
				acdc.FocSub,
				acdc.FocEm,
				acdc.FocCor,
				acdc.FocOth,
				acdc.FocSpec,
				acdc.PopGen,
				acdc.PopAdol,
				acdc.PopGLB,
				acdc.PopTran,
				acdc.PopHome,
				acdc.PopCorr,
				acdc.PopPreg,
				acdc.PopSW,
				acdc.PopAA,
				acdc.PopAs,
				acdc.PopNH,
				acdc.PopAIAN,
				acdc.PopHisp,
				acdc.PopImm,
				acdc.PopIDU,
				acdc.PopSub,
				acdc.PopHIV,
				acdc.PopOth,
				acdc.PopSpec,
				acdc.Updates,
				acdc.Eval,
				acdc.TrainingAlert,
				acdc.CurrentlyEnrolled,
				acdc.RelevantTraining,
				acdc.MotivationTraining,
				acdc.Created,
				acdc.CreatedBy,
				acdc.Updated,
				acdc.UpdatedBy,
				acdc.Deleted,
				acdc.DeletedFlag,
                att.ActivityID,
                att.PersonID,
                att.CheckIn,
                att.Created AS AttendeeCreated,
                act.Title,
                act.ReleaseDate,
                (SELECT TOP 1 ass.AssessmentID
                 FROM ce_Assessment ass
                 WHERE ass.ActivityID = act.ActivityID) AS AssessmentID,
                 
                (SELECT TOP 1 ass.AssessmentID
                 FROM ce_Assessment ass
                 WHERE ass.ActivityID = act.ParentActivityID) AS ParentAssessmentID,
                 
                (SELECT TOP 1 EventDate
                 FROM ce_Agenda ag
                 WHERE ag.ActivityID = act.ActivityID AND ag.DeletedFlag = 'N') AS ActivityEventDate,
                 
                (SELECT TOP 1 EndTime
                 FROM ce_Agenda ag
                 WHERE ag.ActivityID = act.ActivityID AND ag.DeletedFlag = 'N') AS ActivityEndTime
			FROM	ce_AttendeeCDC ACDC
            INNER JOIN ce_Attendee ATT ON att.AttendeeID = acdc.AttendeeID
            INNER JOIN ce_Activity ACT ON act.ActivityID = att.ActivityID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AttendeeCDCID") and len(arguments.AttendeeCDCID)>
			AND	acdc.AttendeeCDCID = <cfqueryparam value="#arguments.AttendeeCDCID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	att.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	acdc.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CBAFundId") and len(arguments.CBAFundId)>
			AND	acdc.CBAFundId = <cfqueryparam value="#arguments.CBAFundId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CBACDC") and len(arguments.CBACDC)>
			AND	acdc.CBACDC = <cfqueryparam value="#arguments.CBACDC#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CBAOth") and len(arguments.CBAOth)>
			AND	acdc.CBAOth = <cfqueryparam value="#arguments.CBAOth#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CBOFundId") and len(arguments.CBOFundId)>
			AND	acdc.CBOFundId = <cfqueryparam value="#arguments.CBOFundId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CBOCDC") and len(arguments.CBOCDC)>
			AND	acdc.CBOCDC = <cfqueryparam value="#arguments.CBOCDC#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CBOOth") and len(arguments.CBOOth)>
			AND	acdc.CBOOth = <cfqueryparam value="#arguments.CBOOth#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRCId") and len(arguments.FunRCId)>
			AND	acdc.FunRCId = <cfqueryparam value="#arguments.FunRCId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRCSp") and len(arguments.FunRCSp)>
			AND	acdc.FunRCSp = <cfqueryparam value="#arguments.FunRCSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRNId") and len(arguments.FunRNId)>
			AND	acdc.FunRNId = <cfqueryparam value="#arguments.FunRNId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FunRNSp") and len(arguments.FunRNSp)>
			AND	acdc.FunRNSp = <cfqueryparam value="#arguments.FunRNSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"MarketId") and len(arguments.MarketId)>
			AND	acdc.MarketId = <cfqueryparam value="#arguments.MarketId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Mspecify") and len(arguments.Mspecify)>
			AND	acdc.Mspecify = <cfqueryparam value="#arguments.Mspecify#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"OccClassId") and len(arguments.OccClassId)>
			AND	acdc.OccClassId = <cfqueryparam value="#arguments.OccClassId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"OrgTypeId") and len(arguments.OrgTypeId)>
			AND	acdc.OrgTypeId = <cfqueryparam value="#arguments.OrgTypeId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Tspecify") and len(arguments.Tspecify)>
			AND	acdc.Tspecify = <cfqueryparam value="#arguments.Tspecify#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfCId") and len(arguments.ProfCId)>
			AND	acdc.ProfCId = <cfqueryparam value="#arguments.ProfCId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfCSp") and len(arguments.ProfCSp)>
			AND	acdc.ProfCSp = <cfqueryparam value="#arguments.ProfCSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfNId") and len(arguments.ProfNId)>
			AND	acdc.ProfNId = <cfqueryparam value="#arguments.ProfNId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProfNSp") and len(arguments.ProfNSp)>
			AND	acdc.ProfNSp = <cfqueryparam value="#arguments.ProfNSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PrinEmpID") and len(arguments.PrinEmpID)>
			AND	acdc.PrinEmpID = <cfqueryparam value="#arguments.PrinEmpID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PrinEmpSp") and len(arguments.PrinEmpSp)>
			AND	acdc.PrinEmpSp = <cfqueryparam value="#arguments.PrinEmpSp#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"WorkState") and len(arguments.WorkState)>
			AND	acdc.WorkState = <cfqueryparam value="#arguments.WorkState#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"WorkZip") and len(arguments.WorkZip)>
			AND	acdc.WorkZip = <cfqueryparam value="#arguments.WorkZip#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FocSTD") and len(arguments.FocSTD)>
			AND	acdc.FocSTD = <cfqueryparam value="#arguments.FocSTD#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocHIV") and len(arguments.FocHIV)>
			AND	acdc.FocHIV = <cfqueryparam value="#arguments.FocHIV#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocWRH") and len(arguments.FocWRH)>
			AND	acdc.FocWRH = <cfqueryparam value="#arguments.FocWRH#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocGen") and len(arguments.FocGen)>
			AND	acdc.FocGen = <cfqueryparam value="#arguments.FocGen#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocAdol") and len(arguments.FocAdol)>
			AND	acdc.FocAdol = <cfqueryparam value="#arguments.FocAdol#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocMH") and len(arguments.FocMH)>
			AND	acdc.FocMH = <cfqueryparam value="#arguments.FocMH#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocSub") and len(arguments.FocSub)>
			AND	acdc.FocSub = <cfqueryparam value="#arguments.FocSub#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocEm") and len(arguments.FocEm)>
			AND	acdc.FocEm = <cfqueryparam value="#arguments.FocEm#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocCor") and len(arguments.FocCor)>
			AND	acdc.FocCor = <cfqueryparam value="#arguments.FocCor#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocOth") and len(arguments.FocOth)>
			AND	acdc.FocOth = <cfqueryparam value="#arguments.FocOth#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"FocSpec") and len(arguments.FocSpec)>
			AND	acdc.FocSpec = <cfqueryparam value="#arguments.FocSpec#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PopGen") and len(arguments.PopGen)>
			AND	acdc.PopGen = <cfqueryparam value="#arguments.PopGen#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAdol") and len(arguments.PopAdol)>
			AND	acdc.PopAdol = <cfqueryparam value="#arguments.PopAdol#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopGLB") and len(arguments.PopGLB)>
			AND	acdc.PopGLB = <cfqueryparam value="#arguments.PopGLB#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopTran") and len(arguments.PopTran)>
			AND	acdc.PopTran = <cfqueryparam value="#arguments.PopTran#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopHome") and len(arguments.PopHome)>
			AND	acdc.PopHome = <cfqueryparam value="#arguments.PopHome#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopCorr") and len(arguments.PopCorr)>
			AND	acdc.PopCorr = <cfqueryparam value="#arguments.PopCorr#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopPreg") and len(arguments.PopPreg)>
			AND	acdc.PopPreg = <cfqueryparam value="#arguments.PopPreg#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopSW") and len(arguments.PopSW)>
			AND	acdc.PopSW = <cfqueryparam value="#arguments.PopSW#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAA") and len(arguments.PopAA)>
			AND	acdc.PopAA = <cfqueryparam value="#arguments.PopAA#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAs") and len(arguments.PopAs)>
			AND	acdc.PopAs = <cfqueryparam value="#arguments.PopAs#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopNH") and len(arguments.PopNH)>
			AND	acdc.PopNH = <cfqueryparam value="#arguments.PopNH#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopAIAN") and len(arguments.PopAIAN)>
			AND	acdc.PopAIAN = <cfqueryparam value="#arguments.PopAIAN#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopHisp") and len(arguments.PopHisp)>
			AND	acdc.PopHisp = <cfqueryparam value="#arguments.PopHisp#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopImm") and len(arguments.PopImm)>
			AND	acdc.PopImm = <cfqueryparam value="#arguments.PopImm#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopIDU") and len(arguments.PopIDU)>
			AND	acdc.PopIDU = <cfqueryparam value="#arguments.PopIDU#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopSub") and len(arguments.PopSub)>
			AND	acdc.PopSub = <cfqueryparam value="#arguments.PopSub#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopHIV") and len(arguments.PopHIV)>
			AND	acdc.PopHIV = <cfqueryparam value="#arguments.PopHIV#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopOth") and len(arguments.PopOth)>
			AND	acdc.PopOth = <cfqueryparam value="#arguments.PopOth#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PopSpec") and len(arguments.PopSpec)>
			AND	acdc.PopSpec = <cfqueryparam value="#arguments.PopSpec#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Updates") and len(arguments.Updates)>
			AND	acdc.Updates = <cfqueryparam value="#arguments.Updates#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Eval") and len(arguments.Eval)>
			AND	acdc.Eval = <cfqueryparam value="#arguments.Eval#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TrainingAlert") and len(arguments.TrainingAlert)>
			AND	acdc.TrainingAlert = <cfqueryparam value="#arguments.TrainingAlert#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CurrentlyEnrolled") and len(arguments.CurrentlyEnrolled)>
			AND	acdc.CurrentlyEnrolled = <cfqueryparam value="#arguments.CurrentlyEnrolled#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"RelevantTraining") and len(arguments.RelevantTraining)>
			AND	acdc.RelevantTraining = <cfqueryparam value="#arguments.RelevantTraining#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"MotivationTraining") and len(arguments.MotivationTraining)>
			AND	acdc.MotivationTraining = <cfqueryparam value="#arguments.MotivationTraining#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	acdc.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	acdc.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	acdc.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	acdc.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	acdc.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	att.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>

<cfcomponent displayname="AttendeeCDCDAO" hint="table ID column = AttendeeCDCID">

	<cffunction name="init" access="public" output="false" returntype="_com.Attendee.AttendeeCDCDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCDC" type="_com.Attendee.AttendeeCDC" required="true" />

		<cfset var qCreate = "" />
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AttendeeCDC
					(
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
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AttendeeCDC.getAttendeeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCBAFundId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getCBAFundId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCBACDC()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBACDC())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCBAOth()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBAOth())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCBOFundId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getCBOFundId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCBOCDC()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBOCDC())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCBOOth()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBOOth())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFunRCId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getFunRCId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFunRCSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getFunRCSp())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFunRNId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getFunRNId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFunRNSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getFunRNSp())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getMarketId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getMarketId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getMspecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getMspecify())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getOccClassId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getOccClassId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getOrgTypeId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getOrgTypeId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getTspecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getTspecify())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getProfCId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getProfCId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getProfCSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getProfCSp())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getProfNId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getProfNId())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getProfNSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getProfNSp())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPrinEmpID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getPrinEmpID())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPrinEmpSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getPrinEmpSp())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getWorkState()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getWorkState())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getWorkZip()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getWorkZip())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocSTD()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocHIV()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocWRH()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocGen()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocAdol()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocMH()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocSub()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocEm()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocCor()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocOth()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getFocSpec()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getFocSpec())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopGen()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopAdol()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopGLB()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopTran()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopHome()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopCorr()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopPreg()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopSW()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopAA()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopAs()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopNH()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopAIAN()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopHisp()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopImm()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopIDU()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopSub()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopHIV()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopOth()#" CFSQLType="cf_sql_char" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getPopSpec()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getPopSpec())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getUpdates()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getUpdates())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getEval()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getEval())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getTrainingAlert()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getTrainingAlert())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCurrentlyEnrolled()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getCurrentlyEnrolled())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getRelevantTraining()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getRelevantTraining())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getMotivationTraining()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getMotivationTraining())#" />,
					<cfqueryparam value="#arguments.AttendeeCDC.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
		<cftry>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Attendee.AttendeeCDC">
		<cfargument name="AttendeeCDC" type="_com.Attendee.AttendeeCDC" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_AttendeeCDC
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCDC.getAttendeeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AttendeeCDCBean = arguments.AttendeeCDC.init(argumentCollection=strReturn)>
			<cfreturn AttendeeCDCBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCDC" type="_com.Attendee.AttendeeCDC" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AttendeeCDC
				SET
					AttendeeID = <cfqueryparam value="#arguments.AttendeeCDC.getAttendeeID()#" CFSQLType="cf_sql_integer" />,
					CBAFundId = <cfqueryparam value="#arguments.AttendeeCDC.getCBAFundId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getCBAFundId())#" />,
					CBACDC = <cfqueryparam value="#arguments.AttendeeCDC.getCBACDC()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBACDC())#" />,
					CBAOth = <cfqueryparam value="#arguments.AttendeeCDC.getCBAOth()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBAOth())#" />,
					CBOFundId = <cfqueryparam value="#arguments.AttendeeCDC.getCBOFundId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getCBOFundId())#" />,
					CBOCDC = <cfqueryparam value="#arguments.AttendeeCDC.getCBOCDC()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBOCDC())#" />,
					CBOOth = <cfqueryparam value="#arguments.AttendeeCDC.getCBOOth()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getCBOOth())#" />,
					FunRCId = <cfqueryparam value="#arguments.AttendeeCDC.getFunRCId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getFunRCId())#" />,
					FunRCSp = <cfqueryparam value="#arguments.AttendeeCDC.getFunRCSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getFunRCSp())#" />,
					FunRNId = <cfqueryparam value="#arguments.AttendeeCDC.getFunRNId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getFunRNId())#" />,
					FunRNSp = <cfqueryparam value="#arguments.AttendeeCDC.getFunRNSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getFunRNSp())#" />,
					MarketId = <cfqueryparam value="#arguments.AttendeeCDC.getMarketId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getMarketId())#" />,
					Mspecify = <cfqueryparam value="#arguments.AttendeeCDC.getMspecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getMspecify())#" />,
					OccClassId = <cfqueryparam value="#arguments.AttendeeCDC.getOccClassId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getOccClassId())#" />,
					OrgTypeId = <cfqueryparam value="#arguments.AttendeeCDC.getOrgTypeId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getOrgTypeId())#" />,
					Tspecify = <cfqueryparam value="#arguments.AttendeeCDC.getTspecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getTspecify())#" />,
					ProfCId = <cfqueryparam value="#arguments.AttendeeCDC.getProfCId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getProfCId())#" />,
					ProfCSp = <cfqueryparam value="#arguments.AttendeeCDC.getProfCSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getProfCSp())#" />,
					ProfNId = <cfqueryparam value="#arguments.AttendeeCDC.getProfNId()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getProfNId())#" />,
					ProfNSp = <cfqueryparam value="#arguments.AttendeeCDC.getProfNSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getProfNSp())#" />,
					PrinEmpID = <cfqueryparam value="#arguments.AttendeeCDC.getPrinEmpID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getPrinEmpID())#" />,
					PrinEmpSp = <cfqueryparam value="#arguments.AttendeeCDC.getPrinEmpSp()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getPrinEmpSp())#" />,
					WorkState = <cfqueryparam value="#arguments.AttendeeCDC.getWorkState()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getWorkState())#" />,
					WorkZip = <cfqueryparam value="#arguments.AttendeeCDC.getWorkZip()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getWorkZip())#" />,
					FocSTD = <cfqueryparam value="#arguments.AttendeeCDC.getFocSTD()#" CFSQLType="cf_sql_char" />,
					FocHIV = <cfqueryparam value="#arguments.AttendeeCDC.getFocHIV()#" CFSQLType="cf_sql_char" />,
					FocWRH = <cfqueryparam value="#arguments.AttendeeCDC.getFocWRH()#" CFSQLType="cf_sql_char" />,
					FocGen = <cfqueryparam value="#arguments.AttendeeCDC.getFocGen()#" CFSQLType="cf_sql_char" />,
					FocAdol = <cfqueryparam value="#arguments.AttendeeCDC.getFocAdol()#" CFSQLType="cf_sql_char" />,
					FocMH = <cfqueryparam value="#arguments.AttendeeCDC.getFocMH()#" CFSQLType="cf_sql_char" />,
					FocSub = <cfqueryparam value="#arguments.AttendeeCDC.getFocSub()#" CFSQLType="cf_sql_char" />,
					FocEm = <cfqueryparam value="#arguments.AttendeeCDC.getFocEm()#" CFSQLType="cf_sql_char" />,
					FocCor = <cfqueryparam value="#arguments.AttendeeCDC.getFocCor()#" CFSQLType="cf_sql_char" />,
					FocOth = <cfqueryparam value="#arguments.AttendeeCDC.getFocOth()#" CFSQLType="cf_sql_char" />,
					FocSpec = <cfqueryparam value="#arguments.AttendeeCDC.getFocSpec()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getFocSpec())#" />,
					PopGen = <cfqueryparam value="#arguments.AttendeeCDC.getPopGen()#" CFSQLType="cf_sql_char" />,
					PopAdol = <cfqueryparam value="#arguments.AttendeeCDC.getPopAdol()#" CFSQLType="cf_sql_char" />,
					PopGLB = <cfqueryparam value="#arguments.AttendeeCDC.getPopGLB()#" CFSQLType="cf_sql_char" />,
					PopTran = <cfqueryparam value="#arguments.AttendeeCDC.getPopTran()#" CFSQLType="cf_sql_char" />,
					PopHome = <cfqueryparam value="#arguments.AttendeeCDC.getPopHome()#" CFSQLType="cf_sql_char" />,
					PopCorr = <cfqueryparam value="#arguments.AttendeeCDC.getPopCorr()#" CFSQLType="cf_sql_char" />,
					PopPreg = <cfqueryparam value="#arguments.AttendeeCDC.getPopPreg()#" CFSQLType="cf_sql_char" />,
					PopSW = <cfqueryparam value="#arguments.AttendeeCDC.getPopSW()#" CFSQLType="cf_sql_char" />,
					PopAA = <cfqueryparam value="#arguments.AttendeeCDC.getPopAA()#" CFSQLType="cf_sql_char" />,
					PopAs = <cfqueryparam value="#arguments.AttendeeCDC.getPopAs()#" CFSQLType="cf_sql_char" />,
					PopNH = <cfqueryparam value="#arguments.AttendeeCDC.getPopNH()#" CFSQLType="cf_sql_char" />,
					PopAIAN = <cfqueryparam value="#arguments.AttendeeCDC.getPopAIAN()#" CFSQLType="cf_sql_char" />,
					PopHisp = <cfqueryparam value="#arguments.AttendeeCDC.getPopHisp()#" CFSQLType="cf_sql_char" />,
					PopImm = <cfqueryparam value="#arguments.AttendeeCDC.getPopImm()#" CFSQLType="cf_sql_char" />,
					PopIDU = <cfqueryparam value="#arguments.AttendeeCDC.getPopIDU()#" CFSQLType="cf_sql_char" />,
					PopSub = <cfqueryparam value="#arguments.AttendeeCDC.getPopSub()#" CFSQLType="cf_sql_char" />,
					PopHIV = <cfqueryparam value="#arguments.AttendeeCDC.getPopHIV()#" CFSQLType="cf_sql_char" />,
					PopOth = <cfqueryparam value="#arguments.AttendeeCDC.getPopOth()#" CFSQLType="cf_sql_char" />,
					PopSpec = <cfqueryparam value="#arguments.AttendeeCDC.getPopSpec()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AttendeeCDC.getPopSpec())#" />,
					Updates = <cfqueryparam value="#arguments.AttendeeCDC.getUpdates()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getUpdates())#" />,
					Eval = <cfqueryparam value="#arguments.AttendeeCDC.getEval()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getEval())#" />,
					TrainingAlert = <cfqueryparam value="#arguments.AttendeeCDC.getTrainingAlert()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getTrainingAlert())#" />,
					CurrentlyEnrolled = <cfqueryparam value="#arguments.AttendeeCDC.getCurrentlyEnrolled()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getCurrentlyEnrolled())#" />,
					RelevantTraining = <cfqueryparam value="#arguments.AttendeeCDC.getRelevantTraining()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getRelevantTraining())#" />,
					MotivationTraining = <cfqueryparam value="#arguments.AttendeeCDC.getMotivationTraining()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getMotivationTraining())#" />,
					Created = <cfqueryparam value="#arguments.AttendeeCDC.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCDC.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.AttendeeCDC.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.AttendeeCDC.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCDC.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.AttendeeCDC.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AttendeeCDC.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.AttendeeCDC.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AttendeeCDC.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AttendeeCDC.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AttendeeCDC.getDeletedFlag())#" />
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCDC.getAttendeeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCDC" type="_com.Attendee.AttendeeCDC" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AttendeeCDC 
				WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCDC.getAttendeeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCDC" type="_com.Attendee.AttendeeCDC" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AttendeeCDC
			WHERE	AttendeeID = <cfqueryparam value="#arguments.AttendeeCDC.getAttendeeID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AttendeeCDC" type="_com.Attendee.AttendeeCDC" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AttendeeCDC)>
			<cfset success = update(arguments.AttendeeCDC) />
		<cfelse>
			<cfset success = create(arguments.AttendeeCDC) />
		</cfif>
		
		<cfreturn success />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>

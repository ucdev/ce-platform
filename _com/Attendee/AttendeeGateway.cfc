<cfcomponent displayname="AttendeeGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Attendee.AttendeeGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="CheckedInFlag" type="string" required="false" />
		<cfargument name="CheckIn" type="date" required="false" />
		<cfargument name="CheckedOutFlag" type="string" required="false" />
		<cfargument name="CheckOut" type="date" required="false" />
		<cfargument name="MDflag" type="string" required="false" />
		<cfargument name="TermsFlag" type="string" required="false" />
		<cfargument name="PaymentFlag" type="string" required="false" />
		<cfargument name="PayAmount" type="numeric" required="false" />
		<cfargument name="PayOrderNo" type="string" required="false" />
		<cfargument name="PaymentDate" type="date" required="false" />
		<cfargument name="RegisterDate" type="date" required="false" />
		<cfargument name="CompleteDate" type="date" required="false" />
		<cfargument name="TermDate" type="date" required="false" />
		<cfargument name="firstName" type="string" required="false" />
		<cfargument name="middleName" type="string" required="false" />
		<cfargument name="lastName" type="string" required="false" />
		<cfargument name="email" type="string" required="false" />
		<cfargument name="certName" type="string" required="false" />
		<cfargument name="address1" type="string" required="false" />
		<cfargument name="address2" type="string" required="false" />
		<cfargument name="city" type="string" required="false" />
		<cfargument name="stateProvince" type="string" required="false" />
		<cfargument name="stateId" type="numeric" required="false" />
		<cfargument name="countryId" type="numeric" required="false" />
		<cfargument name="postalCode" type="string" required="false" />
		<cfargument name="phone1" type="string" required="false" />
		<cfargument name="phone1ext" type="string" required="false" />
		<cfargument name="phone2" type="string" required="false" />
		<cfargument name="phone2ext" type="string" required="false" />
		<cfargument name="fax" type="string" required="false" />
		<cfargument name="faxext" type="string" required="false" />
		<cfargument name="entryMethod" type="string" required="false" />
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
				AttendeeID,
				ActivityID,
				PersonID,
				StatusID,
				CheckedInFlag,
				CheckIn,
				CheckedOutFlag,
				CheckOut,
				MDflag,
				TermsFlag,
				PaymentFlag,
				PayAmount,
				PayOrderNo,
				PaymentDate,
				RegisterDate,
				CompleteDate,
				TermDate,
				firstName,
				middleName,
				lastName,
				email,
				certName,
				address1,
				address2,
				city,
				stateProvince,
				stateId,
				countryId,
				postalCode,
				phone1,
				phone1ext,
				phone2,
				phone2ext,
				fax,
				faxext,
				entryMethod,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Attendee
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StatusID") and len(arguments.StatusID)>
			AND	StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckedInFlag") and len(arguments.CheckedInFlag)>
			AND	CheckedInFlag = <cfqueryparam value="#arguments.CheckedInFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckIn") and len(arguments.CheckIn)>
			AND	CheckIn = <cfqueryparam value="#arguments.CheckIn#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckedOutFlag") and len(arguments.CheckedOutFlag)>
			AND	CheckedOutFlag = <cfqueryparam value="#arguments.CheckedOutFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckOut") and len(arguments.CheckOut)>
			AND	CheckOut = <cfqueryparam value="#arguments.CheckOut#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"MDflag") and len(arguments.MDflag)>
			AND	MDflag = <cfqueryparam value="#arguments.MDflag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TermsFlag") and len(arguments.TermsFlag)>
			AND	TermsFlag = <cfqueryparam value="#arguments.TermsFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PaymentFlag") and len(arguments.PaymentFlag)>
			AND	PaymentFlag = <cfqueryparam value="#arguments.PaymentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PayAmount") and len(arguments.PayAmount)>
			AND	PayAmount = <cfqueryparam value="#arguments.PayAmount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"PayOrderNo") and len(arguments.PayOrderNo)>
			AND	PayOrderNo = <cfqueryparam value="#arguments.PayOrderNo#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PaymentDate") and len(arguments.PaymentDate)>
			AND	PaymentDate = <cfqueryparam value="#arguments.PaymentDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"RegisterDate") and len(arguments.RegisterDate)>
			AND	RegisterDate = <cfqueryparam value="#arguments.RegisterDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CompleteDate") and len(arguments.CompleteDate)>
			AND	CompleteDate = <cfqueryparam value="#arguments.CompleteDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"TermDate") and len(arguments.TermDate)>
			AND	TermDate = <cfqueryparam value="#arguments.TermDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"firstName") and len(arguments.firstName)>
			AND	firstName = <cfqueryparam value="#arguments.firstName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"middleName") and len(arguments.middleName)>
			AND	middleName = <cfqueryparam value="#arguments.middleName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"lastName") and len(arguments.lastName)>
			AND	lastName = <cfqueryparam value="#arguments.lastName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"email") and len(arguments.email)>
			AND	email = <cfqueryparam value="#arguments.email#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"certName") and len(arguments.certName)>
			AND	certName = <cfqueryparam value="#arguments.certName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"address1") and len(arguments.address1)>
			AND	address1 = <cfqueryparam value="#arguments.address1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"address2") and len(arguments.address2)>
			AND	address2 = <cfqueryparam value="#arguments.address2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"city") and len(arguments.city)>
			AND	city = <cfqueryparam value="#arguments.city#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"stateProvince") and len(arguments.stateProvince)>
			AND	stateProvince = <cfqueryparam value="#arguments.stateProvince#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"stateId") and len(arguments.stateId)>
			AND	stateId = <cfqueryparam value="#arguments.stateId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"countryId") and len(arguments.countryId)>
			AND	countryId = <cfqueryparam value="#arguments.countryId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"postalCode") and len(arguments.postalCode)>
			AND	postalCode = <cfqueryparam value="#arguments.postalCode#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone1") and len(arguments.phone1)>
			AND	phone1 = <cfqueryparam value="#arguments.phone1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone1ext") and len(arguments.phone1ext)>
			AND	phone1ext = <cfqueryparam value="#arguments.phone1ext#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone2") and len(arguments.phone2)>
			AND	phone2 = <cfqueryparam value="#arguments.phone2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone2ext") and len(arguments.phone2ext)>
			AND	phone2ext = <cfqueryparam value="#arguments.phone2ext#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"fax") and len(arguments.fax)>
			AND	fax = <cfqueryparam value="#arguments.fax#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"faxext") and len(arguments.faxext)>
			AND	faxext = <cfqueryparam value="#arguments.faxext#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"entryMethod") and len(arguments.entryMethod)>
			AND	entryMethod = <cfqueryparam value="#arguments.entryMethod#" CFSQLType="cf_sql_varchar" />
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
	
	<cffunction name="getByViewAttributesLMS" access="public" output="false" returntype="query">
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="CheckedInFlag" type="string" required="false" />
		<cfargument name="CheckIn" type="date" required="false" />
		<cfargument name="CheckedOutFlag" type="string" required="false" />
		<cfargument name="CheckOut" type="date" required="false" />
		<cfargument name="MDflag" type="string" required="false" />
		<cfargument name="TermsFlag" type="string" required="false" />
		<cfargument name="PaymentFlag" type="string" required="false" />
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
            	att.ActivityID, 
                att.StatusID, 
                att.CheckIn, 
                att.TermsFlag, 
                att.PaymentFlag, 
            	act.Title AS ActivityTitle, 
                act.ReleaseDate, 
                act.EndDate, 
                pub.Overview, 
                pub.PublishDate, 
				pub.RemoveDate, 
                pub.PaymentFlag AS PubPaymentFlag, 
                pub.TermsFlag AS PubTermFlag, 
                pub.TermsText, 
                pub.StatViews, 
                pub.FeaturedFlag, 
                pub.Updated, 
                pub.StatVoteCount,
                pub.StatVoteValue
			FROM
            	ce_Attendee AS att 
            INNER JOIN
				ce_Activity AS act ON act.ActivityID = att.ActivityID
            INNER JOIN
				ce_Activity_PubGeneral AS pub ON act.ActivityID = pub.ActivityID
			WHERE     (0 = 0)
		
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	att.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	att.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	att.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StatusID") and len(arguments.StatusID)>
			AND	att.StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckedInFlag") and len(arguments.CheckedInFlag)>
			AND	att.CheckedInFlag = <cfqueryparam value="#arguments.CheckedInFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckIn") and len(arguments.CheckIn)>
			AND	att.CheckIn = <cfqueryparam value="#arguments.CheckIn#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckedOutFlag") and len(arguments.CheckedOutFlag)>
			AND	att.CheckedOutFlag = <cfqueryparam value="#arguments.CheckedOutFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckOut") and len(arguments.CheckOut)>
			AND	att.CheckOut = <cfqueryparam value="#arguments.CheckOut#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"MDflag") and len(arguments.MDflag)>
			AND	att.MDflag = <cfqueryparam value="#arguments.MDflag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TermsFlag") and len(arguments.TermsFlag)>
			AND	att.TermsFlag = <cfqueryparam value="#arguments.TermsFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PaymentFlag") and len(arguments.PaymentFlag)>
			AND	att.PaymentFlag = <cfqueryparam value="#arguments.PaymentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	att.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	att.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	att.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	att.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	att.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
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
	
	<cffunction name="getByPIFAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="StatusID" type="numeric" required="false" />
		<cfargument name="CheckedInFlag" type="string" required="false" />
		<cfargument name="CheckIn" type="date" required="false" />
		<cfargument name="CheckedOutFlag" type="string" required="false" />
		<cfargument name="CheckOut" type="date" required="false" />
		<cfargument name="MDflag" type="string" required="false" />
		<cfargument name="TermsFlag" type="string" required="false" />
		<cfargument name="PaymentFlag" type="string" required="false" />
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
				a.PersonID,
				a.StatusID,
				a.CheckIn,
				a.MDflag,
				a.Deleted,
				a.DeletedFlag,
				p.FirstName,
				p.MiddleName,
				p.LastName,
				p.Gender,
				e.Description AS Ethnicity,
				occ.Name AS OccupationalClass,
				pc.Description AS ProfCName,
				frn.Name AS FunRNName,
				ot.Name AS OrgName,
				address.State AS WorkState,
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
				acdc.PopSw,
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
				sm.Name AS MarketName,
				acdc.Updates,
				acdc.Eval,
				acdc.TrainingAlert,
				acdc.CurrentlyEnrolled,
				acdc.RelevantTraining,
				acdc.MotivationTraining
			FROM	ce_Attendee a
			INNER JOIN ce_AttendeeCDC acdc ON acdc.AttendeeID = a.AttendeeID
			INNER JOIN ce_Person p ON p.PersonID = a.PersonID
			INNER JOIN ce_Person_Address AS Address ON p.PrimaryAddressID = address.AddressID
			LEFT JOIN ce_Sys_Ethnicity e ON e.EthnicityID = p.EthnicityID
			LEFT JOIN ce_Sys_OccClass occ ON occ.OccClassID = acdc.OccClassID
			LEFT JOIN ce_Sys_ProfC pc ON pc.ProfCID = acdc.ProfCID
			LEFT JOIN ce_Sys_FunRN frn ON frn.FunRNID = acdc.FunRNID
			LEFT JOIN ce_Sys_OrgType ot ON ot.OrgTypeID = acdc.OrgTypeID
			LEFT JOIN ce_Sys_Market sm ON sm.MarketID = acdc.MarketID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	a.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	a.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	a.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StatusID") and len(arguments.StatusID)>
			AND	a.StatusID = <cfqueryparam value="#arguments.StatusID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckedInFlag") and len(arguments.CheckedInFlag)>
			AND	a.CheckedInFlag = <cfqueryparam value="#arguments.CheckedInFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckIn") and len(arguments.CheckIn)>
			AND	a.CheckIn = <cfqueryparam value="#arguments.CheckIn#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckedOutFlag") and len(arguments.CheckedOutFlag)>
			AND	a.CheckedOutFlag = <cfqueryparam value="#arguments.CheckedOutFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CheckOut") and len(arguments.CheckOut)>
			AND	a.CheckOut = <cfqueryparam value="#arguments.CheckOut#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"MDflag") and len(arguments.MDflag)>
			AND	a.MDflag = <cfqueryparam value="#arguments.MDflag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TermsFlag") and len(arguments.TermsFlag)>
			AND	a.TermsFlag = <cfqueryparam value="#arguments.TermsFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PaymentFlag") and len(arguments.PaymentFlag)>
			AND	a.PaymentFlag = <cfqueryparam value="#arguments.PaymentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	a.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	a.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	a.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	a.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	a.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
			AND	a.DeletedFlag = 'N'
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
    
    <cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT     
				att.AttendeeID, 
				att.ActivityID, 
				att.PersonID, 
				att.StatusID,
				att.CheckedInFlag, 
				att.CheckIn, 
				att.CheckedOutFlag, 
				att.CheckOut, 
				att.PaymentDate, 
				att.PayAmount, 
				att.PayOrderNo, 
				att.RegisterDate, 
				att.CompleteDate, 
				att.TermDate,
				att.Created, 
				att.Updated, 
				att.Deleted, 
				att.DeletedFlag, 
				att.MDflag,
				p1.FirstName, 
				p1.MiddleName,
				p1.LastName, 
				p1.Email,
				address.City,
				address.State,
				address.Country,
				A.Title, 
				A.Description,
				A.StartDate,
				ats.Name AS StatusName,
				A.StartDate,
				SD.Name AS DegreeName
        FROM         
			ce_Attendee AS att 
        INNER JOIN 
			ce_Activity AS A ON att.ActivityID = A.ActivityID 
        INNER JOIN 
			ce_person AS p1 ON p1.personid = att.PersonID
        LEFT OUTER JOIN 
			ce_Person_Address AS Address ON p1.PrimaryAddressID=Address.addressid
        LEFT OUTER JOIN 
			ce_Person_Degree AS PD ON PD.PersonID = p1.PersonID
        LEFT OUTER JOIN 
			ce_Sys_Degree AS SD ON SD.DegreeID = PD.DegreeID
        LEFT OUTER JOIN 
			ce_Sys_AttendeeStatus ats ON ats.AttendeeStatusID = att.StatusID
        WHERE     
			(A.DeletedFlag='N') AND PD.DeletedFlag='N'
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	att.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	att.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	att.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	att.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	att.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	att.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	att.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif><!---
		OR
		(A.DeletedFlag='N') AND ((SELECT COUNT(PD1.PersonDegreeID)
        									 FROM ce_Person_Degree PD1
                                             WHERE PersonID = ATT.PersonID) = 0) --->
		<!---<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	att.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	att.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	att.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	att.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	att.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	att.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	att.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>--->
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
        
   <cffunction name="getByReportAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT     	att.AttendeeID, 
            			att.ActivityID, 
                        att.PersonID, 
						att.StatusID,
                        CASE A.ActivityTypeID
                        	WHEN 2 THEN ATT.CompleteDate
                            ELSE a.StartDate
                        END AS StartDate, 
                        a.Title, 
                        ac.Amount AS CreditAmount, 
                        sc.Name AS CreditType
            FROM ce_Attendee AS att 
            LEFT JOIN ce_Activity AS A ON att.ActivityID = A.ActivityID 
            LEFT JOIN ce_AttendeeCredit AS ac ON ac.AttendeeID = att.AttendeeID
            LEFT JOIN ce_Sys_Credit AS sc ON sc.CreditID = ac.CreditID
            WHERE
            	A.DeletedFlag='N' AND
                ATT.StatusID = 1 AND
                ATT.CompleteDate BETWEEN <cfqueryparam value="#arguments.StartDate#" CFSQLType="cf_sql_date" /> AND <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_date" /> AND
                ATT.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
                <cfif structKeyExists(arguments,"CreditID") and len(arguments.CreditID)>
                    AND	ac.CreditID IN (#arguments.CreditID#)
                </cfif>
                <cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
                    AND	att.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
                </cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>


</cfcomponent>

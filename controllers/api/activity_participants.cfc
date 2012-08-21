<cfcomponent extends="controllers.api.Controller" displayname="api">
	<cffunction name="init">
		<cfset provides("json") />
	</cffunction>
	
	<cffunction name="create">
	</cffunction>

	<cffunction name="delete">
		<cfset renderText("DELETE IN") />
	</cffunction>

	<cffunction name="index">
		<cfcontent type="text/javascript" />

		<cfset modelsTemp = Application.activityAttendee.getAttendees(ActivityID=params.key,DeletedFlag="N")>
		<cfset models = $cleanupmodels() />

		<cfset renderText(serializeJSON(models)) />
	</cffunction>

	<cffunction name="show">
		<cfset $cleanupParams() />

		<cfset model = model("Activity_participant").findOneById(params.key)>

		<cfreturn renderText(serializeJSON(model.properties())) />
	</cffunction>

	<cffunction name="update">
		<cfset $cleanupParams() />

		<cfset model = model("Activity_participant").findOneById(params.key)>

		<cfset model.save()>
		
		<cfreturn renderText(serializeJSON(model.properties())) />
	</cffunction>
    
    <cffunction name="$cleanupmodels">
    	<!--- models RESULT SET IS PASSED IN --->
        <cfset models = queryNew("activityId,attendeeId,city,completeDate,created,currStatusDate,currStatusId,deleted,deletedFlag,email,firstName,fullName,isDeleted,isMD,isReal,isStatus1,isStatus2,isStatus3,isStatus4,lastName,mdFlag,middleName,payAmount,paymentDate,payOrderNo,personDeleted,personId,registerDate,startDate,state,statusId,statusName,termDate,updated") />
        
        <cfloop query="modelsTemp">
        	<cfset queryAddRow(models)>
            <cfset querySetCell(models, 'activityId', modelsTemp.activityId)>
            <cfset querySetCell(models, 'attendeeId', modelsTemp.attendeeId)>
            <cfset querySetCell(models, 'city', modelsTemp.city)>
            <cfset querySetCell(models, 'completeDate', modelsTemp.completeDate)>
            <cfset querySetCell(models, 'created', modelsTemp.created)>
            <cfset querySetCell(models, 'currStatusDate', modelsTemp.currStatusDate)>
            <cfset querySetCell(models, 'currStatusId', modelsTemp.currStatusId)>
            <cfset querySetCell(models, 'deleted', modelsTemp.deleted)>
            <cfset querySetCell(models, 'deletedFlag', modelsTemp.deletedFlag)>
            <cfset querySetCell(models, 'email', modelsTemp.email)>
            <cfset querySetCell(models, 'firstName', modelsTemp.firstName)>
            <cfset querySetCell(models, 'fullName', modelsTemp.fullName)> 
            <cfset querySetCell(models, 'lastName', modelsTemp.lastName)>
            <cfset querySetCell(models, 'mdFlag', modelsTemp.mdFlag)>
            <cfset querySetCell(models, 'middleName', modelsTemp.middleName)>
            <cfset querySetCell(models, 'payAmount', modelsTemp.payAmount)>
            <cfset querySetCell(models, 'paymentDate', modelsTemp.paymentDate)>
            <cfset querySetCell(models, 'payOrderNo', modelsTemp.payOrderNo)>
            <cfset querySetCell(models, 'personDeleted', modelsTemp.personDeleted)>
            <cfset querySetCell(models, 'personId', modelsTemp.personId)>
            <cfset querySetCell(models, 'registerDate', modelsTemp.registerDate)>
            <cfset querySetCell(models, 'startDate', modelsTemp.startDate)>
            <cfset querySetCell(models, 'state', modelsTemp.state)>
            <cfset querySetCell(models, 'statusId', modelsTemp.statusId)>
            <cfset querySetCell(models, 'statusName', modelsTemp.statusName)>
            <cfset querySetCell(models, 'termDate', modelsTemp.termDate)>
            <cfset querySetCell(models, 'updated', modelsTemp.updated)> 
        	
			<cfif modelsTemp.personDeleted EQ "Y">
            	<cfset querySetCell(models, 'isDeleted', true)>
            <cfelse>
           		<cfset querySetCell(models, 'isDeleted', false)>
            </cfif>
            
            <cfif modelsTemp.mdFlag EQ "Y">
				<cfset querySetCell(models, 'isMD', true)>
            <cfelse>
				<cfset querySetCell(models, 'isMD', false)>
            </cfif>
            
            <cfif NOT modelsTemp.hasAcctFlag>
	            <cfset querySetCell(models, 'isReal', false)>
            <cfelse>
	            <cfset querySetCell(models, 'isReal', true)>
            </cfif>
            
            <cfif modelsTemp.statusId EQ 1>
            	<cfset querySetCell(models, 'isStatus1', true)>
            <cfelse>
            	<cfset querySetCell(models, 'isStatus1', false)>
            </cfif>
            
            <cfif modelsTemp.statusId EQ 2>
            	<cfset querySetCell(models, 'isStatus2', true)>
            <cfelse>
            	<cfset querySetCell(models, 'isStatus2', false)>
            </cfif>
            
            <cfif modelsTemp.statusId EQ 3>
            	<cfset querySetCell(models, 'isStatus3', true)>
            <cfelse>
            	<cfset querySetCell(models, 'isStatus3', false)>
            </cfif>
            
            <cfif modelsTemp.statusId EQ 4>
            	<cfset querySetCell(models, 'isStatus4', true)>
            <cfelse>
            	<cfset querySetCell(models, 'isStatus4', false)>
            </cfif>                           
        </cfloop>
        
        <cfreturn queryToStruct(models) />
    </cffunction>
</cfcomponent>
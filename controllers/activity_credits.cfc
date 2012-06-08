<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset super.init() />
	</cffunction>
	<!--- activity_credits/index --->
	<cffunction name="index">
		<cfset activity_credits = model("Activity_credit").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_credits/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_credit)>
	        <cfset flashInsert(error="Activity_credit #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_credits/new --->
	<cffunction name="new">
		<cfset activity_credit = model("Activity_credit").new()>
	</cffunction>
	
	<!--- activity_credits/edit/key --->
	<cffunction name="edit">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.credits" default="" />
		
		<cfset attributes.credits = params.credits />
		<cfset qActivityCredits = application.com.activityCreditGateway.getByViewAttributes(activityId=attributes.activityId)>
		<cfset qCredits = application.com.creditGateway.getByAttributes()>
		
		<cfloop query="qCredits">
			<cfparam name="params.creditAmount#qCredits.CreditID#" default="0" />
			<cfparam name="params.credits#qCredits.CreditID#" default="0" />
			<cfparam name="params.referenceFlag#qCredits.CreditID#" default="N" />
			<cfparam name="params.referenceNo#qCredits.CreditID#" default="" />
		</cfloop>
		
		<cfloop query="qCredits">
			<cfset params.credits = ListAppend(params.Credits,Evaluate("params.Credits#qCredits.CreditID#"),",")>
		</cfloop>
				
		<cfloop query="qActivityCredits">
			<cfset params.credits = ListAppend(params.Credits,qActivityCredits.CreditID,",")>
			<cfset "params.CreditAmount#qActivityCredits.CreditID#" = qActivityCredits.Amount>
			<cfset "params.ReferenceNo#qActivityCredits.CreditID#" = qActivityCredits.ReferenceNo>
		</cfloop>	
	</cffunction>
	
	<!--- activity_credits/create --->
	<cffunction name="create">
		<cfset activity_credit = model("Activity_credit").new(params.activity_credit)>
		
		<!--- Verify that the activity_credit creates successfully --->
		<cfif activity_credit.save()>
			<cfset flashInsert(success="The activity_credit was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_credit.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_credits/update --->
	<cffunction name="update">
		<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
		
		<!--- Verify that the activity_credit updates successfully --->
		<cfif activity_credit.update(params.activity_credit)>
			<cfset flashInsert(success="The activity_credit was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_credit.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_credits/delete/key --->
	<cffunction name="delete">
		<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
		
		<!--- Verify that the activity_credit deletes successfully --->
		<cfif activity_credit.delete()>
			<cfset flashInsert(success="The activity_credit was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_credit.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>

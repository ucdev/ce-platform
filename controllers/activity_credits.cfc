<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset super.init() />
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
    
	<!--- activity_credits/index --->
	<cffunction name="index">
		<cfset activity_credits = model("Activity_credit").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_credits/new --->
	<cffunction name="new">
		<cfset activity_credit = model("Activity_credit").new()>
	</cffunction>
    
    <!--- activity/credits/save --->
    <cffunction name="save">
        <cfparam name="params.credits" default="" />
        
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Activity Credit Update Failed.")>
        
		<!--- Creates CreditType List and sets up the Attributes.Credits var --->
        <!---<cfset qCredits = Application.Com.CreditGateway.getByAttributes()>--->
        <cfif len(trim(params.credits)) GT 0>
			<cfset qCredits = model("Sys_credit").findAll(where="id IN (#params.credits#)")>
        <cfelse>
			<cfset qCredits = model("Sys_credit").findAll(where="id IN (0)")>
        </cfif>
        
        <cfif qCredits.recordCount GT 0>
			<!--- Creates all CreditType variables as well as CreditAmount variables --->
            <cfloop query="qCredits">
                <cfparam name="params.creditAmount[#qCredits.id#]" default="0" />
                <cfparam name="params.referenceNo[#qCredits.id#]" default="0" />
            </cfloop>
            
            <!--- Loops through the Error Checking --->
            <cfloop query="qCredits">
                <!--- Checks if there is a check mark with no amount entered --->
                <cfif params.creditAmount[qCredits.id] EQ 0>
                    <cfset status.addError("","Please set a Credit Amount for #Name# Credit Type.") />
                    
                <!--- Checks if there is an amount but no check mark
                <cfelseif NOT ListFind(params.credits,qCredits.id,",") AND params.creditAmount[qCredits.id] GT 0>
                    <cfset status.addError("","Please check the #Name# Credit Type.") /> --->
                    
                <!--- Checks if there is an amount but no check mark --->
                <cfelseif qCredits.ReferenceFlag EQ "Y" AND params.ReferenceNo[qCredits.id] EQ "">
                    <cfset status.addError("","The #Name# Reference Number is required.") />
                </cfif>
            </cfloop>
            
            <cfif arrayLen(status.getErrors()) EQ 0>
                <!--- DELETE EXISTING --->
                <cfset model("Activity_credit").deleteAll(where="activityId=" & params.key, softDelete=false, includeSoftDeletes=true)>
                
                <cfloop query="qCredits">
                    <!--- if the CreditAmount Field is not empty it saves those values to the DB --->
                    <cfif params.creditAmount[qCredits.id] GT 0>
                        <!--- Creates the Create Bean --->
                        <cfset createCreditsBean = CreateObject("component","#Application.Settings.Com#ActivityCredit.ActivityCredit").Init()>
                        
                        <!--- Fill the Create Bean --->
                        <cfset createCreditsBean.setActivityID(params.key)>
                        <cfset createCreditsBean.setCreditID(qCredits.id)>
                        <cfset createCreditsBean.setAmount(params.creditAmount[qCredits.id])>
                        
                        <cfif  qCredits.referenceFlag EQ "Y">
                            <cfset createCreditsBean.setReferenceNo(params.referenceNo[qCredits.id])>
                        </cfif>
                        
                        <cfset createCreditsBean = Application.Com.ActivityCreditDAO.Create(createCreditsBean)>
                        
                        <!--- Read Credit Info --->
                        <cfset creditInfo = createObject("component","#Application.Settings.Com#System.Credit").init(creditId=qCredits.id)>
                        <cfset creditInfo = Application.Com.CreditDAO.read(CreditInfo)>
                        
                        <!--- ACTION UPDATER --->
                        <cfset Application.History.add(
                                    HistoryStyleID=24,
                                    FromPersonID=session.currentUser.id,
                                    ToActivityID=params.key,
                                    ToCreditID=qCredits.id
                                )>
                    </cfif>
                </cfloop>
                
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Activity credits have been saved.")>
            </cfif>
        <cfelse>
        	<cfset status.setStatusMsg("There were no credits to save.")>
        </cfif>
        
        <cfset renderText(status.getJSON()) />
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
</cfcomponent>

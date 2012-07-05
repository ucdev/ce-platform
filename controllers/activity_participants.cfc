<cfcomponent extends="Controller" output="false">
	
	<!--- activity_participants/create --->
	<cffunction name="create">
		<cfset activity_participant = model("activity_participant").new(params.activity_participant)>
		
		<!--- Verify that the activity_participant creates successfully --->
		<cfif activity_participant.save()>
			<cfset flashInsert(success="The activity_participant was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_participant.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_participants/delete/key --->
	<cffunction name="delete">
		<cfset activity_participant = model("activity_participant").findByKey(params.key)>
		
		<!--- Verify that the activity_participant deletes successfully --->
		<cfif activity_participant.delete()>
			<cfset flashInsert(success="The activity_participant was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_participant.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
	<!--- activity_participants/index --->
	<cffunction name="index">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.status" type="numeric" default="0" />
        <cfparam name="params.page" type="numeric" default="1" />
		
		<cfset showInfoBar(false) />
        
		<cfset qAttendees = Application.activityAttendee.getAttendees(ActivityID=params.key,DeletedFlag="N")>
		<cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=params.key)>
		
		<!--- LEGACY FIX --->
		<cfset attributes.status = params.status />
		
		<!--- TOTALATTENDEELIST IS USED FOR SELECTING ALL ATTENDEES IN AN ACTIVITY --->
		<cfset TotalAttendeeList = "">
		<cfset totalCount = qAttendees.recordCount>
		<cfset completeCount = 0>
		<cfset failCount = 0>
		<cfset progressCount = 0>
		<cfset registeredCount = 0>
		
		<cfloop query="qAttendees">
			<cfswitch expression="#qAttendees.statusId#">
				<cfcase value="1">
					<cfset completeCount++>
				</cfcase>
				<cfcase value="2">
					<cfset progressCount++>
				</cfcase>
				<cfcase value="3">
					<cfset registeredCount++>
				</cfcase>
				<cfcase value="4">
					<cfset failCount++>
				</cfcase>
			</cfswitch>
		</cfloop>
		
		<cfif params.status EQ 0 AND structKeyExists(cookie, "user_attendeeStatus") AND getToken(cookie.USER_AttendeeStatus,1,"|") EQ params.key>
			<cfset params.status = getToken(cookie.USER_AttendeeStatus,2,"|")>
		</cfif>
		
		<cfif len(trim(params.status)) GT 0 AND params.status NEQ 0>
        	<cfif isNumeric(params.status)>
                <cfquery name="qTempAttendees" dbtype="query">
                    SELECT *
                    FROM qAttendees
                    WHERE qAttendees.statusId = <cfqueryparam value="#params.status#" cfsqltype="cf_sql_integer" />
                </cfquery>
        		<cfset qAttendees = qTempAttendees>
            <cfelseif params.status EQ 'selected' AND len(trim(params.selectedAttendees)) GT 0>
                <cfquery name="qTempAttendees" dbtype="query">
                    SELECT *
                    FROM qAttendees
                    WHERE qAttendees.attendeeId IN (#params.selectedAttendees#)
                </cfquery>
        		<cfset qAttendees = qTempAttendees>
            </cfif>
		</cfif>
        
		<cfset AttendeePager = CreateObject("component","#Application.Settings.Com#Pagination").init()>
		<cfset AttendeePager.setQueryToPaginate(qAttendees)>
		<cfset AttendeePager.setBaseLink("/activities/adm_participants/#params.key#?status=#params.status#") />
        <cfset AttendeePager.setPreviousLinkHTML("&larr; Previous") />
        <cfset AttendeePager.setNextLinkHTML("Next &rarr;") />
		<cfset AttendeePager.setItemsPerPage(15) />
        <cfset AttendeePager.setNumericDistanceFromCurrentPageVisible(1) />
        <cfset AttendeePager.setNumericEndBufferCount(2) />
        <cfset AttendeePager.setMissingNumbersHTML('...') />
		<cfset AttendeePager.setUrlPageIndicator("page") />
		<cfset AttendeePager.setShowNumericLinks(true) />
		<cfset AttendeePager.setClassName("pager") />
	</cffunction>
	
	<!--- activity_participants/new --->
	<cffunction name="new">
		<cfset activity_participant = model("activity_participant").new()>
	</cffunction>
    
    <!--- activity_participants/search --->
    <cffunction name="search">
    	<cfparam name="params.key" default="0" />
    	<cfparam name="params.q" default="" />
        
		<cfset params.q = listToArray(replace(trim(params.q), " ", ",", "ALL"))>
        
        <cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=params.key)>
        <cfset qAttendees = model("Activity_participant").searchActivity(params.key, params.q)>
        
        <!--- TOTALATTENDEELIST IS USED FOR SELECTING ALL ATTENDEES IN AN ACTIVITY --->
        <cfset TotalAttendeeList = "">
        <cfset totalCount = qAttendees.recordCount>
        <cfset completeCount = 0>
        <cfset failCount = 0>
        <cfset progressCount = 0>
        <cfset registeredCount = 0>
        
        <cfloop query="qAttendees">
            <cfset TotalAttendeeList = ListAppend(TotalAttendeeList, qAttendees.PersonID,",")>
            
            <cfswitch expression="#qAttendees.statusId#">
                <cfcase value="1">
                    <cfset completeCount++>
                </cfcase>
                <cfcase value="2">
                    <cfset progressCount++>
                </cfcase>
                <cfcase value="3">
                    <cfset registeredCount++>
                </cfcase>
                <cfcase value="4">
                    <cfset failCount++>
                </cfcase>
            </cfswitch>
        </cfloop>
    
        <cfset AttendeePager = CreateObject("component","#Application.Settings.Com#Pagination").init()>
        <cfset AttendeePager.setQueryToPaginate(qAttendees)>
        <cfset AttendeePager.setPreviousLinkHTML("&larr; Previous") />
        <cfset AttendeePager.setNextLinkHTML("Next &rarr;") />
        <cfset AttendeePager.setItemsPerPage(15) />
        <cfset AttendeePager.setNumericDistanceFromCurrentPageVisible(1) />
        <cfset AttendeePager.setNumericEndBufferCount(2) />
        <cfset AttendeePager.setMissingNumbersHTML('...') />
        <cfset AttendeePager.setUrlPageIndicator("page") />
        <cfset AttendeePager.setShowNumericLinks(true) />
        <cfset AttendeePager.setClassName("pager") />
    	
        <cfset renderPage(action="ahah",layout=false)>
        <!---<cfset renderText(status.getJSON()) />--->
    </cffunction>
	
	<!--- activity_participants/show/key --->
	<cffunction name="show">
		<!--- Find the record --->
    	<cfset activity_participant = model("activity_participant").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_participant)>
	        <cfset flashInsert(error="activity_participant #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
	</cffunction>
	
	<!--- activity_participants/update --->
	<cffunction name="update">
		<cfset activity_participant = model("activity_participant").findByKey(params.key)>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The activity_participant was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_participant.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<cffunction name="importer">
		
	</cffunction>
	
	<cffunction name="upload_csv">
		<cfset returnVar = createObject("component","_com.returnData.buildStruct").init() />
		<cfset returnVar.setStatus(false) />
		<cfset returnVar.setStatusMsg('Failed to upload file.') />
		<cfset mdList = "MD,DO" />
		<cfset activity = model("activity").findByKey(params.key) />
       <!---
		<Cfset attendeeBean = createObject("component", "_com.attendee.attendee").init(activityId=arguments.activityId)>
		<Cfset activityBean = createObject("component", "_com.activity.activity").init(activityId=arguments.activityId)>
		<cfset activityBean = application.com.activityDAO.read(activityBean)>--->
		<cfset loc.mimetypes = structNew() />
		<cfset loc.mimetypes['csv'] = "text/csv" />
		
		<cfset file = upload(mimetypes=loc.mimetypes,filefield="#params.filefield#",modelName="activity",modelKey=params.key,uploadType="imports:participants") />
		
		<cfif isStruct(file)>
			<cfset data = csvToArray(file.serverDirectory & file.serverFile) />
			<cfset payload = [] />
			<cfloop from="2" to="#arraylen(data)#" index="i">
				<cfset row = structNew() />
				<cfset row['FIRSTNAME'] = data[i][1] />
				
				<cfif data[i][2] NEQ 0>
					<cfset row['MIDDLENAME'] = data[i][2] />
				<cfelse>
					<cfset row['MIDDLENAME'] = "" />
				</cfif>
				
				<cfset row['LASTNAME'] = data[i][3] />
				
				<cfif len(trim(data[i][4])) GT 0>
					<cfset row['EMAIL'] = lcase(trim(data[i][4])) />
				<cfelse>
					<cfset row['EMAIL'] = "" />
				</cfif>
				
				<cfset row['DEGREE'] = data[i][6] />
				
				<cfset row['name'] = row['FIRSTNAME'] />
				<cfif len(trim(row['MIDDLENAME'])) GT 0>
					<cfset row.name = row.name & " " & row.MIDDLENAME />
				</cfif>
				<cfset row.name = row.name & " " & row.LASTNAME />
				
				<cfif len(trim(row.DEGREE)) GT 0 AND row.DEGREE NEQ "Other">
					<cfset row.name = row.name & ", " & row.DEGREE />
				</cfif>
				
				<cfif isDate(data[i][7])>
					<cfset row['COMPLETEDATE'] = data[i][7] />
				<cfelse>
					<cfset row['COMPLETEDATE'] = activity.enddate />
				</cfif>
				
				<cfset row['ADDRESS1'] = data[i][8] />
				<cfset row['ADDRESS2'] = data[i][9] />
				<cfset row['CITY'] = data[i][10] />
				<cfset row['STATE'] = data[i][11] />
				<cfset row['COUNTRY'] = data[i][12] />
				<cfset row['ZIPCODE'] = data[i][13] />
				<cfset row['PHONE1'] = phoneFormat(data[i][14],"1xxxxxxxxxx") />
				<cfset row['PHONE1EXT'] = data[i][15] />
				<cfset row['PHONE2'] = phoneFormat(data[i][16],"1xxxxxxxxxx") />
				<cfset row['PHONE2EXT'] = data[i][17] />
				<cfset row['FAX'] = data[i][18] />
				<cfset row['FAXEXT'] = data[i][19] />
				
				<cfif NOT structKeyExists(row,'phone')>
					<cfset row['phone'] = row.phone1 />
				</cfif>
				
				<cfif arrayLen(data[i]) EQ 20>
					<cfset row['HOURS'] = data[i][20] />
				<cfelse>
					<cfset row['HOURS'] = 0 />
				</cfif>
				
				<cfset row['activityId'] = params.key />
				
				<!--- CHECK PERSON --->
				<cfset person = model("person_email").findOneByEmail_address(select="person_id",value=row.email) />
				<cfif isObject(person)>
					<cfset row['personId'] = person.person_Id />
				<cfelse>
					<cfset row['personId'] = 0 />
				</cfif>
				
				<cfset row['attendeeId'] = 0 />
				
				<cfset row['recordHash'] = HASH('#row.personId#,#row.activityId#,#row.attendeeId#,#row.phone#,#row.email#','MD5') />
				
				<cfset row['type'] = 'import' />
				<cfset newRequest = model("credit_request").new(row) />

				<cfif newRequest.save(validate=true)>
					<cfset logger = {
						'name':row.name,
						'token':row.recordHash,
						'message':'PENDING'
					} />
				<cfelse>
					<cfset logger = {
						'name':row.name,
						'token':row.recordHash,
						'message':'ALREADY_PENDING'
					} />
				</cfif>
				
				<cfset payload.add(logger) />
			</cfloop>
			
			<cfset returnVar.setPayload(payload) />
		</cfif>
		
		<cfset renderText(returnVar.getJson()) />
	</cffunction>
	
	<cffunction
		name="csvToArray"
		access="public"
		returntype="array"
		output="false"
		hint="I take a CSV file or CSV data value and convert it to an array of arrays based on the given field delimiter. Line delimiter is assumed to be new line / carriage return related.">
	 
		<!--- Define arguments. --->
		<cfargument
			name="file"
			type="string"
			required="false"
			default=""
			hint="I am the optional file containing the CSV data."
			/>
	 
		<cfargument
			name="csv"
			type="string"
			required="false"
			default=""
			hint="I am the CSV text data (if the file argument was not used)."
			/>
	 
		<cfargument
			name="delimiter"
			type="string"
			required="false"
			default=","
			hint="I am the field delimiter (line delimiter is assumed to be new line / carriage return)."
			/>
	 
		<cfargument
			name="trim"
			type="boolean"
			required="false"
			default="true"
			hint="I flags whether or not to trim the END of the file for line breaks and carriage returns."
			/>
	 
		<!--- Define the local scope. --->
		<cfset var local = {} />
	 
		<!---
			Check to see if we are using a CSV File. If so, then all we
			want to do is move the file data into the CSV variable. That
			way, the rest of the algorithm can be uniform.
		--->
		<cfif len( arguments.file )>
	 
			<!--- Read the file into Data. --->
			<cfset arguments.csv = fileRead( arguments.file ) />
	 
		</cfif>
	 
		<!---
			ASSERT: At this point, no matter how the data was passed in,
			we now have it in the CSV variable.
		--->
	 
		<!---
			Check to see if we need to trim the data. Be default, we are
			going to pull off any new line and carraige returns that are
			at the end of the file (we do NOT want to strip spaces or
			tabs as those are field delimiters).
		--->
		<cfif arguments.trim>
	 
			<!--- Remove trailing line breaks and carriage returns. --->
			<cfset arguments.csv = reReplace(
				arguments.csv,
				"[\r\n]+$",
				"",
				"all"
				) />
	 
		</cfif>
	 
		<!--- Make sure the delimiter is just one character. --->
		<cfif (len( arguments.delimiter ) neq 1)>
	 
			<!--- Set the default delimiter value. --->
			<cfset arguments.delimiter = "," />
	 
		</cfif>
	 
	 
		<!---
			Now, let's define the pattern for parsing the CSV data. We
			are going to use verbose regular expression since this is a
			rather complicated pattern.
	 
			NOTE: We are using the verbose flag such that we can use
			white space in our regex for readability.
		--->
		<cfsavecontent variable="local.regEx">(?x)
			<cfoutput>
	 
				<!--- Make sure we pick up where we left off. --->
				\G
	 
				<!---
					We are going to start off with a field value since
					the first thing in our file should be a field (or a
					completely empty file).
				--->
				(?:
	 
					<!--- Quoted value - GROUP 1 --->
					"([^"]*+ (?>""[^"]*+)* )"
	 
					|
	 
					<!--- Standard field value - GROUP 2 --->
					([^"\#arguments.delimiter#\r\n]*+)
	 
				)
	 
				<!--- Delimiter - GROUP 3 --->
				(
					\#arguments.delimiter# |
					\r\n? |
					\n |
					$
				)
	 
			</cfoutput>
		</cfsavecontent>
	 
		<!---
			Create a compiled Java regular expression pattern object
			for the experssion that will be parsing the CSV.
		--->
		<cfset local.pattern = createObject(
			"java",
			"java.util.regex.Pattern"
			).compile(
				javaCast( "string", local.regEx )
				)
			/>
	 
		<!---
			Now, get the pattern matcher for our target text (the CSV
			data). This will allows us to iterate over all the tokens
			in the CSV data for individual evaluation.
		--->
		<cfset local.matcher = local.pattern.matcher(
			javaCast( "string", arguments.csv )
			) />
	 
	 
		<!---
			Create an array to hold the CSV data. We are going to create
			an array of arrays in which each nested array represents a
			row in the CSV data file. We are going to start off the CSV
			data with a single row.
	 
			NOTE: It is impossible to differentiate an empty dataset from
			a dataset that has one empty row. As such, we will always
			have at least one row in our result.
		--->
		<cfset local.csvData = [ [] ] />
	 
		<!---
	
	
			Here's where the magic is taking place; we are going to use
			the Java pattern matcher to iterate over each of the CSV data
			fields using the regular expression we defined above.
	 
			Each match will have at least the field value and possibly an
			optional trailing delimiter.
		--->
		<cfloop condition="local.matcher.find()">
	 
			<!---
				Next, try to get the qualified field value. If the field
				was not qualified, this value will be null.
			--->
			<cfset local.fieldValue = local.matcher.group(
				javaCast( "int", 1 )
				) />
	 
			<!---
				Check to see if the value exists in the local scope. If
				it doesn't exist, then we want the non-qualified field.
				If it does exist, then we want to replace any escaped,
				embedded quotes.
			--->
			<cfif structKeyExists( local, "fieldValue" )>
	 
				<!---
					The qualified field was found. Replace escpaed
					quotes (two double quotes in a row) with an unescaped
					double quote.
				--->
				<cfset local.fieldValue = replace(
					local.fieldValue,
					"""""",
					"""",
					"all"
					) />
	 
			<cfelse>
	 
				<!---
					No qualified field value was found; as such, let's
					use the non-qualified field value.
				--->
				<cfset local.fieldValue = local.matcher.group(
					javaCast( "int", 2 )
					) />
	 
			</cfif>
	 
			<!---
				Now that we have our parsed field value, let's add it to
				the most recently created CSV row collection.
			--->
			<cfset arrayAppend(
				local.csvData[ arrayLen( local.csvData ) ],
				local.fieldValue
				) />
	 
			<!---
				Get the delimiter. We know that the delimiter will always
				be matched, but in the case that it matched the end of
				the CSV string, it will not have a length.
			--->
			<cfset local.delimiter = local.matcher.group(
				javaCast( "int", 3 )
				) />
	 
			<!---
				Check to see if we found a delimiter that is not the
				field delimiter (end-of-file delimiter will not have
				a length). If this is the case, then our delimiter is the
				line delimiter. Add a new data array to the CSV
				data collection.
			--->
			<cfif (
				len( local.delimiter ) &&
				(local.delimiter neq arguments.delimiter)
				)>
	 
				<!--- Start new row data array. --->
				<cfset arrayAppend(
					local.csvData,
					arrayNew( 1 )
					) />
	 
			<!--- Check to see if there is no delimiter length. --->
			<cfelseif !len( local.delimiter )>
				<!---
					If our delimiter has no length, it means that we
					reached the end of the CSV data. Let's explicitly
					break out of the loop otherwise we'll get an extra
					empty space.
				--->
				<cfbreak />
	 
			</cfif>
	 
		</cfloop>
	 
	 
		<!---
			At this point, our array should contain the parsed contents
			of the CSV value as an array of arrays. Return the array.
		--->
		<cfreturn local.csvData />
	</cffunction>
	
	
</cfcomponent>

<!---
Copyright 2008 Terrence Ryan
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--->

<cfcomponent>

	<cffunction name="init" output="FALSE" access="public"  returntype="any" hint="Psuedo constructor that allows us to play our object games." >
		<cfargument name="unfuddleUrl" type="string" required="yes" hint="The Unfuddle URL to use." />
		<cfargument name="username" type="string" required="yes" hint="The Unfuddle Username to use." />
		<cfargument name="password" type="string" required="yes" hint="The Unfuddle Password to use." />
		<cfargument name="debug" type="boolean" default="FALSE" hint="Whether or not to output debugging information to cf debugging, and collects the raw xml in the temp directory. " />
		<cfargument name="timeout" type="numeric" default="5" hint="The timeout on http calls." />
		<cfargument name="apiversion" type="string" default="v1" hint="The version of the api to call." />
		
		<cfset variables.unfuddleUrl = arguments.unfuddleUrl />
		<cfset variables.username = arguments.username />
		<cfset variables.password = arguments.password />
		<cfset variables.debug = arguments.debug />
		<cfset variables.timeout = arguments.timeout />
		<cfset variables.tempDir = GetTempDirectory() />
		<cfset variables.apiversion = arguments.apiversion />
		
		<cfset variables.columnlists['backup'] = "CREATED_AT,ID,PROCESSED,PROCESSED_AT,PROJECT_ID,REQUESTER_ID" />
		
		<cfreturn This />
	</cffunction>
	
	<cffunction name="authenticate" output="FALSE" access="public"  returntype="struct" hint="Tests authentication for unfuddle api. " >
	
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/account"  />
		<cfset var myresult = structNew() />
		<cfset var results = structNew() />
		<cfset results.success = FALSE />
		<cfset results.message = "Not Attempted"/>
		<cfset results.httpcode =  0 />
		<cfhttp url="#urlToRequest#" timeout="#variables.timeout#"
			method="get" result="myresult"
			username="#username#" password="#password#">
			<cfhttpparam type="header" name="Accept" value="application/xml" />
			<cfhttpparam type="header" name="Content-Type" value="application/xml" />
		</cfhttp>
		
		<!--- Added to ensure that bad urls are handled correctly. --->
		<cfif not structKeyExists(myresult, "responseHeader") or not structKeyExists(myresult.responseHeader, "status_code")>
			<cfset results.httpcode = "404" />
		<cfelse>
			<cfset results.httpcode = myresult.responseHeader.status_code />
		</cfif>
		
		<cfswitch expression="#results.httpcode#">
			<cfcase value="200">
				<cfset results.message = "Successfully authenticated." />
				<cfset results.success = TRUE />
			</cfcase>
			<cfcase value="401">
				<cfset results.message = "Authentication Failure."/>
			</cfcase>
			<cfcase value="404">
				<cfset results.message = "Unfuddle url does not exist."/>
			</cfcase>
			<cfdefaultcase>
				<cfset results.message = "Unexpected Result: #myresult.responseHeader.status#"/>
			</cfdefaultcase>

		</cfswitch>

	<cfreturn results />
	
	</cffunction>
	
	
	<!--- Account Functions --->
	<cffunction name="getAccount" output="FALSE" access="public"  returntype="query" hint="Get information about the unfuddle account, there is one account per subdomain." >
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/account"  />
		<cfset var XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset var result = convertUnfuddleXMLToQuery(XMLResults, "account") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="listAccountActivity" output="FALSE" access="public"  returntype="query" hint="Get information about activity on the unfuddle account. It is limited by the permission of the requesting account." >
		<cfargument name="start_date" type="date" hint="Specifies the inclusive start date of the query" />
		<cfargument name="end_date" type="date" hint="Specifies the inclusive start date of the query" />
		<cfargument name="limit" type="numeric" default="0" hint="specifies the maximum number of results to return" />
		
		<cfset var params = structNew() />
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/account/activity"  />
		<cfset var XMLResults = "" />
		<cfset var result = "" />
		
		<cfif structKeyExists(arguments, "start_date")>
			<cfset params.start_date = formatQueryDate(arguments.start_date) />
		</cfif>
		
		<cfif structKeyExists(arguments, "end_date")>
			<cfset params.end_date = formatQueryDate(arguments.end_date) />
		</cfif>
		
		<cfif structKeyExists(arguments, "limit") and arguments.limit gt 0>
			<cfset params.limit = arguments.limit />
		</cfif>
		
		
		<cfif StructIsEmpty(params)>
			<cfset XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfelse>
			<cfset XMLResults = makeHTTPGetRequest(UrlToRequest,params) />
		</cfif>
		
		<cfset result = convertUnfuddleXMLToQuery(XMLResults, "event", "events") />

		<cfreturn result />
	</cffunction>
	
	
	<!--- Backup Functions --->
	<cffunction name="createBackup" output="FALSE" access="public"  returntype="query" hint="Requests a new backup. " >
		<cfargument name="project" type="any" required="TRUE" hint="The project id for which to retrieve backups." />
	
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/" & arguments.project & "/backups"/>
		<cfset var XMLResults = makeHTTPPostRequest(UrlToRequest) />
		<cfset var result = convertUnfuddleXMLToQuery(XMLResults, "backup") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="downloadBackup" output="FALSE" access="public"  returntype="string" hint="Gets a particular backup." >
		<cfargument name="project" type="any" required="TRUE" hint="The project id for which to retrieve backups." />
		<cfargument name="backup" type="any" required="TRUE" hint="The backup id to retrieve." />
		<cfargument name="path" type="any" required="TRUE" hint="Where to download the backup file to." />
		<cfargument name="timeout" type="any" default="120" hint="A timeout value for just this operation." />
		
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/" & arguments.project & "/backups/" & arguments.backup & "/download"/>
		<cfset var accountInfo = getAccount() />
		<cfset var projectInfo = getProject(arguments.project) />
		<cfset var backupInfo = getBackup(arguments.project,arguments.backup) />
		<cfset var fileName = "#accountInfo.subdomain#.#projectInfo.short_name#.#DateFormat(backupInfo.created_at,'yyyymmdd')##TimeFormat(backupInfo.created_at,'hhmmss')#.tar.gz" />
		
		<cfhttp url="#UrlToRequest#" getAsBinary="auto"
			method="get"result="myresult" timeout="#arguments.timeout#"
			username="#username#" password="#password#" path="#arguments.path#" file="#fileName#">
		</cfhttp>
	
	</cffunction>
	
	<cffunction name="getBackup" output="FALSE" access="public"  returntype="query" hint="gets the metadata of a backup. " >
		<cfargument name="project" type="any" required="TRUE" hint="The project id for which to retrieve backups." />
		<cfargument name="backup" type="any" required="TRUE" hint="The backup id to retrieve." />
	
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/" & arguments.project & "/backups/" & arguments.backup />
		<cfset var XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset var result = convertUnfuddleXMLToQuery(XMLResults, "backup") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="listBackups" output="FALSE" access="public"  returntype="any" hint="Lists all of the backups for a project in the unfuddle account." >
		<cfargument name="project" type="any" required="TRUE" hint="The project id for which to retrieve backups." />
		
	
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/" & arguments.project & "/backups"/>
		<cfset var XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset var result = convertUnfuddleXMLToQuery(XMLResults, "backup","backups") />

		<cfreturn result />
	</cffunction>
	
	<!--- Project Functions --->
	<cffunction name="getProject" output="FALSE" access="public"  returntype="any" hint="Gets a project from the unfuddle account." >
		<cfargument name="project" type="any" required="TRUE" hint="Either the project id or project shortname t retrieve. " />
		
		<cfset var UrlToRequest ="" />
		<cfset var XMLResults ="" />
		<cfset var result = "" />
		
		
		<cfif isNumeric(arguments.project)>
			<cfset UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/" & arguments.project  />
		<cfelse>
			<cfset UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/by_short_name/" & arguments.project   />
		</cfif>
		
		<cfset XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset result = convertUnfuddleXMLToQuery(XMLResults, "project") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="listProjects" output="FALSE" access="public"  returntype="any" hint="lists all of the projects in the unfuddle account. " >
	
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects"  />
		<cfset var XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset var result = convertUnfuddleXMLToQuery(XMLResults, "project","projects") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="getTicket" output="FALSE" access="public"  returntype="any" hint="Gets a ticket from the project." >
		<cfargument name="project" type="numeric" required="TRUE" hint="project id" />
		<cfargument name="ticket" type="numeric" required="TRUE" hint="ticket id " />
		
		<cfset var UrlToRequest ="" />
		<cfset var XMLResults ="" />
		<cfset var result = "" />
		
		
		<cfset UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/" & arguments.project & "/tickets/" & arguments.ticket  />
		
		<cfset XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset result = convertUnfuddleXMLToQuery(XMLResults, "ticket") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="listTickets" output="FALSE" access="public"  returntype="any" hint="lists all of the tickets in the project" >
		<cfargument name="project" type="numeric" required="yes" />
		
		<cfset var UrlToRequest = variables.unfuddleUrl & "/api/#variables.apiversion#/projects/#arguments.project#/tickets"  />
		<cfset var XMLResults = makeHTTPGetRequest(UrlToRequest) />
		<cfset var result = convertUnfuddleXMLToQuery(XMLResults, "ticket","tickets") />

		<cfreturn result />
	</cffunction>
	
	<cffunction name="createTicket" output="FALSE" access="public"  returntype="any" hint="creates a ticket in a project " >
		<cfargument name="project" type="numeric" required="yes" />
		<cfargument name="description" type="string" required="yes" />
		<cfargument name="summary" type="string" required="yes" />
		<cfargument name="priority" type="string" required="no" default="1" />
		<cfargument name="status" type="string" required="no" default="new" />
		<cfargument name="customfield1" type="string" required="no" default="" />
		<cfargument name="customfield2" type="string" required="no" default="" />
		<cfargument name="customfield3" type="string" required="no" default="" />
		
		<cfset var params = structNew() />
		<cfset var UrlToRequest = "http://ucccpd.unfuddle.com/api/v1/projects/1/tickets"  />
		<cfset var XMLResults = "" />
		<cfset var result = "" />
		<cfset var XMLString = "" />
		
		<!--- setting up variables --->
		<cfset params.project_id = arguments.project />
		<cfset params.description = arguments.description />
		<cfset params.summary = arguments.summary />
		<cfset params.priority = arguments.priority />
		<cfset params.status = arguments.status />
		<cfset params.field1_value = arguments.customfield1 />
		<cfset params.field2_value = arguments.customfield1 />
		<cfset params.field3_value = arguments.customfield1 />
		
		<cfsavecontent variable="XMLString">
			<cfoutput>
			<ticket>
				<project-id>#params.project_id#</project-id>
				<description>#htmlToMarkdown(params.description)#</description>
				<Priority>#params.priority#</Priority>
				<status>#params.status#</status>
				<summary>#stripTags('allow','',params.summary)#</summary>
				<field1-value>#params.field1_value#</field1-value>
				<field2-value>#params.field2_value#</field2-value>
				<field3-value>#params.field3_value#</field3-value>
			</ticket>
			</cfoutput>
		</cfsavecontent>
		
		<cfhttp url="#urlToRequest#" charset="utf-8" timeout="#variables.timeout#"
			method="post" result="myresult"
			username="#variables.username#" password="#variables.password#">

			<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
			<cfhttpparam type="Header" name="TE" value="deflate;q=0">
			<cfhttpparam type="header" name="Content-Type" value="application/xml" />
			<cfhttpparam type="body" name="post" encoded="no" value="#XMLString#" />
		</cfhttp>
		
		<!---<cfset XMLResult = makeHTTPPostRequest(UrlToRequest,XMLString) />
		<cfset result = convertUnfuddleXMLToQuery(XMLResults, "ticket","tickets") />--->
		
		<cfreturn "true" />
	</cffunction>
	
	<cffunction name="htmlToMarkdown" access="public" output="no" returntype="string">
		<cfargument name="html" type="string" required="yes" />
		
		<cfset var markdown = "" />
		<cfset var theHtml = HtmlCompressFormat(arguments.html) />
		
		<cfset markdown = stripTags('allow','a,b,strong,em,i,p,h1,h2,h3,h4,br,style,script',theHtml) />
		<!--- PARAGRAPH --->
		<cfset markdown = replaceNoCase(markdown,'<p>','','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</p>',chr(10) & chr(10),'ALL') />
		
		<!--- LINE BREAK --->
		<cfset markdown = replaceNoCase(markdown,'<br />',chr(10),'ALL') />
		<cfset markdown = replaceNoCase(markdown,'<br>',chr(10),'ALL') />
		
		<!--- BOLD TAG --->
		<cfset markdown = replaceNoCase(markdown,'<b>','**','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</b>','**','ALL') />
		<cfset markdown = replaceNoCase(markdown,'<strong>','**','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</strong>','**','ALL') />
		
		<!--- ITALIC TAG --->
		<cfset markdown = replaceNoCase(markdown,'<i>','*','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</i>','*','ALL') />
		<cfset markdown = replaceNoCase(markdown,'<em>','*','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</em>','*','ALL') />
		
		<!--- HEADING TAGS --->
		<cfset markdown = replaceNoCase(markdown,'<h1>','##','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</h1>','','ALL') />
		<cfset markdown = replaceNoCase(markdown,'<h2>','####','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</h2>','','ALL') />
		<cfset markdown = replaceNoCase(markdown,'<h3>','######','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</h3>','','ALL') />
		<cfset markdown = replaceNoCase(markdown,'<h4>','########','ALL') />
		<cfset markdown = replaceNoCase(markdown,'</h4>','','ALL') />
		
		
		<cfset markdown = ReReplaceNocase(markdown,'<a href="([^"]+)">([^<]+)</a>',"[\2] (\1)",'ALL') />
		
		<cfreturn markdown />
	</cffunction>
	
	<!--- Private Functions --->
	<cffunction access="private" name="makeHTTPGetRequest" output="true" returntype="XML" hint="Encapsulates getting the requesting and parsing the Unfuddle results into an XML variable." >
		<cfargument name="urlToRequest" type="string" required="yes" hint="The url to request the data from. " />
		<cfargument name="request" type="struct" required="no" hint="A structured post to send to Unfuddle API.  Usually for creating items." />
	
		<cfset var postVar = "" />
		<cfset var XMLResults = "" />
		<cfset var myresult = structNew() />
		<cfset var resultContent = "" />
		
		<cfhttp url="#arguments.urlToRequest#" getAsBinary="never"
			username="#variables.username#" password="#variables.password#" 
			method="get" result="myresult" timeout="#variables.timeout#">
			
			<cfhttpparam type="Header" name="Accept-Encoding" value="deflate;q=0">
			<cfhttpparam type="Header" name="TE" value="deflate;q=0">
			<cfhttpparam type="header" name="Accept" value="application/xml" />
			<cfhttpparam type="header" name="Content-Type" value="application/xml" />
			
			<cfif structKeyExists(arguments, "request")>
				<cfloop collection="#arguments.request#" item ="key" >
					<cfhttpparam type="url" name="#Lcase(key)#" value="#request[key]#" />
				</cfloop>
			</cfif>
			
		</cfhttp>
		
		<cfif not FindNoCase("200", myresult.statusCode)>
			<cfif FindNoCase("404", myresult.statusCode)>
				<cfset XMLResults = XMLNew() />
			<cfelse>
				<cfthrow type="UnfuddleCFC" message="Error in Underlying Web Call" detail="#myresult.statuscode# #arguments.urlToRequest#" />
			</cfif>
		<cfelse>
			
			<cfset XMLResults = XMLParse(trim(myresult.filecontent)) />
			
			<cfif debug>
				<cffile action="write" file="#variables.tempDir##ReplaceList(arguments.urlToRequest, ':,/', '_,+')#.#dateformat(now(),'yyyymmdd')#_#timeformat(now(),'hhmmss')#.xml" output="#XMLResults#" />
			</cfif>
		</cfif>
	
	
	
	
		<cfreturn XMLResults />
	</cffunction>
	
	<cffunction access="private" name="makeHTTPPostRequest" output="false" returntype="XML" hint="Encapsulates getting the requesting and parsing the Basecamp results into an XML variable." >
		<cfargument name="urlToRequest" type="string" required="yes" hint="The url to request the data from. " />
		<cfargument name="request" type="string" required="no" hint="A structured post to send to Unfuddle API.  Usually for creating items." />
	
		<cfset var XMLResults = "" />
		<cfset var myresult = structNew() />
		<cfset var postvar = "" />
		<cfset var localurlToRequest = arguments.urlToRequest />
		
		<!---<cfif structKeyExists(arguments, "request")>
			<cfset postVar = convertPostRequestToXML(arguments.request) />
		</cfif>--->
		
		<cfif structKeyExists(arguments, "request")>
			<cfset postVar = trim(arguments.request) />
		</cfif>
	
		<cfhttp username="#variables.username#" timeout="#variables.timeout#" password="#variables.password#" result="myresult" method="post" url="#localurlToRequest#">
			 <cfhttpparam type="header" name="Accept" value="application/xml" />
		    <cfhttpparam type="header" name="Content-Type" value="application/xml" />
		    <cfif structKeyExists(arguments, "request")>
			    <cfhttpparam type="body" name="post" encoded="no" value="#PostVar#" />
			</cfif>
		</cfhttp>
		<cfdump var="#myresult#"><cfabort>
		<cfif not FindNoCase("200", myresult.statusCode) and not FindNoCase("201", myresult.statusCode)>
			<cfthrow type="UnfuddleCFC" message="Error in Underlying Web Call" detail="#myresult.statuscode# url:#localurlToRequest#" />
		</cfif>
		
		<cfif Find("201", myresult.statusCode) AND StructKeyExists(myresult.Responseheader, "Location")>
			<cfset XMLResults = makeHTTPGetRequest(myresult.Responseheader.location) />
		</cfif>
		
	
	
		<cfreturn XMLResults />
	</cffunction>
	
	<cffunction access="private" name="convertPostRequestToXML" output="false" returntype="string" hint="Takes a post request structure and converts it to the XML form that Basecamp needs." >
		<cfargument name="request" type="struct" required="yes" default="" hint="The request structure to transform. " />
	
		<cfset var i = 0 />
		<cfset var attribute = "" />
		<cfset var postVar = "" />
		<cfset var XMLNode = "" />
	
		<cfset postVar = postVar.concat("<request>") & chr(10) />

		<cfloop collection="#arguments.request#" item="attribute">
			<cfif CompareNoCase("item", attribute) neq 0 and CompareNoCase("type", attribute) neq 0>
				<cfset XMLNode = Lcase(Replace(attribute, "_", "-", "ALL")) />
				<cfif isSimpleValue(arguments.request[attribute])>
					<cfset postVar = postVar.concat("		<#XMLNode#>#arguments.request[attribute]#</#XMLNode#>") & chr(10) />
				<cfelseif isArray(arguments.request[attribute])>
					<cfloop index="i" from="1" to="#ArrayLen(arguments.request[attribute])#">
						<cfset postVar = postVar.concat("	<#XMLNode#>#arguments.request[attribute][i]#</#XMLNode#>") & chr(10) />
					</cfloop>
				</cfif>
			</cfif>
	
		</cfloop>
	
		<cfset postVar = postVar.concat("</request>") & chr(10) />
	
		<cfreturn postVar />
	</cffunction>
	
	<cffunction access="private" name="convertUnfuddleXMLToQuery" output="true" returntype="query" hint="Converts the results from unfuddle into an ColdFusion query variable." >
		<cfargument name="unfuddleXML" type="XML" required="yes" hint="The unfuddle XML content." />
		<cfargument name="collection" type="string" required="yes" hint="The name of the collection to loop over. If the xml structure is 'unfuddlexml.comments.comment',we are looking for 'comment'." />
		<cfargument name="root" type="string" default ="" hint="The root of the XML file, needed if collection is not the root." />
	
		<cfset var keyArray= arrayNew(1) />
		<cfset var QueryResults = QueryNew('') />
		<cfset var i= 0 />
		<cfset var j= 0 />
		<cfset var k= 0 />
		<cfset var r= arguments.root />
		<cfset var c= arguments.collection>
		<cfset var xml = arguments.unfuddleXML />
		<cfset var queryTypes = "" />
		
	
		<cfif len(r) gt 0>
			<cfif StructKeyExists(XML, r) and StructKeyExists(XML[r], c)>
				<cfset keyArray= returnAllSubKeys(XML[r][c], c) />
				
				<cfloop index="k" from="1" to="#ArrayLen(keyArray)#">
					<cfset queryTypes = listAppend(queryTypes, "VarChar")>
				</cfloop>
	
				<cfset QueryResults = QueryNew(Replace(ArrayToList(keyArray), "-", "_", "ALL"), queryTypes) />
			
				<cfloop index="j" from="1" to="#ArrayLen(XML[r][c])#">
					<cfset QueryAddRow(QueryResults) />
					<cfloop index="i" from="1" to="#ArrayLen(keyArray)#">
						<!--- Make sure the item exists. --->
						<cfif structKeyExists(XML[r][c][j], keyArray[i])>
							<!--- If it is marked as a datatime, convert it.  --->
							<cfif IsDateField(keyArray[i]) and structKeyExists(XML[r][c][j][keyArray[i]], "XMLText") and Len(XML[r][c][j][keyArray[i]]['XMLText']) gt 0>
								<cfset QuerySetCell(QueryResults, Replace(keyArray[i], "-", "_", "ALL"), convertunfuddleDateTime(XML[r][c][j][keyArray[i]].XMlText)) />
							<cfelse>
								<cfset QuerySetCell(QueryResults, Replace(keyArray[i], "-", "_", "ALL"), XML[r][c][j][keyArray[i]].XMlText) />
							</cfif>
	
						</cfif>
					</cfloop>
				</cfloop>
			</cfif>
		<cfelse>
			<cfif StructKeyExists(XML, c)>
	
				<cfset keyArray= returnAllSubKeys(XML[c], c) />
				
				<cfloop index="k" from="1" to="#ArrayLen(keyArray)#">
					<cfset queryTypes = listAppend(queryTypes, "VarChar")>
				</cfloop>
				
				<cfset QueryResults = QueryNew(Replace(ArrayToList(keyArray), "-", "_", "ALL"), queryTypes) />
				<cfset QueryAddRow(QueryResults) />
			
				<cfloop index="i" from="1" to="#ArrayLen(keyArray)#">
					<!--- Make sure the item exists. --->
					<cfif structKeyExists(XML[c], keyArray[i])>
						<!--- If it is marked as a datatime, convert it.  --->
						<cfif IsDateField(keyArray[i])  and structKeyExists(XML[c][keyArray[i]], "XMLText") and Len(XML[c][keyArray[i]]['XMLText']) gt 0>
							<cfset QuerySetCell(QueryResults, Replace(keyArray[i], "-", "_", "ALL"), convertunfuddleDateTime(XML[c][keyArray[i]].XMlText)) />
						<cfelse>
												
							<cfset QuerySetCell(QueryResults, Replace(keyArray[i], "-", "_", "ALL"), XML[c][keyArray[i]].XMlText) />
						</cfif>
					</cfif>
				</cfloop>
			</cfif>
		</cfif>
		
		<cfif len(queryResults.ColumnList) eq 0 and StructKeyExists(variables.columnlists, c)>
			<cfset QueryResults = QueryNew(variables.columnlists[c]) />
		</cfif>
	
		<cfreturn QueryResults />
	</cffunction>

	<cffunction access="private" name="convertunfuddleDateTime" output="false" returntype="date" hint="Converts unfuddle time to a ColdFusion date time variable. " >
		<cfargument name="unfuddleTime" type="string" required="yes" hint="The unfuddle formatted date time." />
	
		<cfset var date = "" />
		<cfset var time = ""/>
		<cfset var outputDateTime = "">
		<cfset var localuftime = ReplaceNoCase(arguments.unfuddleTime, "Z", "", "ALL") />
	
		<cfset date = GetToken(localuftime,1,"T") />
		<cfset time = GetToken(GetToken(localuftime,2,"T"), 1,"-") />
		
		<cfset outputDateTime = ParseDateTime(date & " " & time) />
		
		<cfif FindNoCase("Z", arguments.unfuddleTime)>
			<cfset outputDateTime=DateConvert("utc2Local",outputDateTime) />
		</cfif>
	
		<cfreturn outputDateTime />
	</cffunction>
	
	<cffunction access="private" name="returnAllSubKeys" output="false" returntype="array" hint="Takes an Array of structures, and returns a list of all keys. " >
		<cfargument name="array" type="any" required="yes" hint="The array of structures to parse." />
		<cfargument name="collection" type="string" default="" hint="The collection type to parse." />
	
		<cfset var i=0 />
		<cfset var j=0 />
		<cfset var keyHolder = structNew() />
		<cfset var keyArray = ArrayNEw(1) />
		<cfset var returnArray  =ArrayNew(1) />
	
		<cfloop index="i" from="1" to="#ArrayLen(arguments.array)#">
			<cfset keyArray = StructKeyArray(arguments.array[i]) />
	
			<cfloop index="j" from="1" to="#ArrayLen(keyArray)#">
				<cfset keyHolder[keyArray[j]]="" />
			</cfloop>
	
		</cfloop>
		
		<cfif len(arguments.collection) gt 0 AND structKeyExists(ColumnLists, arguments.collection) and
			ListLen(ColumnLists[arguments.collection] gt ArrayLen(returnArray))>
			<cfset returnArray = ListToArray(ColumnLists[arguments.collection] )>
		</cfif>
		
	
		<cfset returnArray  = StructKeyArray(keyholder) />
	
	
	
		<cfreturn returnArray />
	</cffunction>
	
	<cffunction name="isDateField" output="FALSE" access="private"  returntype="boolean" hint="Determines if a field from the XML is a date field." >
		<cfargument name="fieldName" type="string" required="TRUE" hint="The fieldname to check." />
	
		<cfif FindNoCase("created-at", fieldName) OR 
				FindNoCase("updated-at", fieldName) OR
					FindNoCase("processed-at", fieldName)>
			<cfreturn TRUE />
		<cfelse>
			<cfreturn FALSE />
		</cfif>
	</cffunction>

	<cffunction name="formatQueryDate" output="FALSE" access="private"  returntype="string" hint="formats the date used in queries against the api. " >
		<cfargument name="dateToFormat" type="date" required="TRUE" hint="The date to format." />
		<cfreturn DateFormat(arguments.dateToFormat,"yyyy/m/d") />
	</cffunction>
	
	<cfscript>
/**
* Strip xml-like tags from a string when they are within or not within a list of tags.
*
* @param stripmode      A string, disallow or allow. Specifies if the list of tags in the mytags attribute is a list of tags to allow or disallow. (Required)
* @param mytags      List of tags to either allow or disallow. (Required)
* @param mystring      The string to check. (Required)
* @param findonly      Boolean value. If true, returns the first match. If false, all instances are replaced. (Optional)
* @return Returns either a string or the first instance of a match.
* @author Isaac Dealey (info@turnkey.to)
* @version 2, September 22, 2004
*/
function stripTags(stripmode,mytags,mystring) {
    var spanquotes = "([^"">]*""[^""]*"")*";
    var spanstart = "[[:space:]]*/?[[:space:]]*";
    var endstring = "[^>$]*?(>|$)";
    var x = 1;
    var currenttag = structNew();
    var subex = "";
    var findonly = false;
    var cfversion = iif(structKeyExists(GetFunctionList(),"getPageContext"), 6, 5);
    var backref = "\\1"; // this backreference works in cf 5 but not cf mx
    var rexlimit = len(mystring);

    if (arraylen(arguments) gt 3) { findonly = arguments[4]; }
    if (cfversion gt 5) { backref = "\#backref#"; } // fix backreference for mx and later cf versions
    else { rexlimit = 19000; } // limit regular expression searches to 19000 characters to support CF 5 regex character limit

    if (len(trim(mystring))) {
        // initialize defaults for examining this string
        currenttag.pos = ListToArray("0");
        currenttag.len = ListToArray("0");

        mytags = ArrayToList(ListToArray(mytags)); // remove any empty items in the list
        if (len(trim(mytags))) {
            // turn the comma delimited list of tags with * as a wildcard into a regular expression
            mytags = REReplace(mytags,"[[:space:]]","","ALL");
            mytags = REReplace(mytags,"([[:punct:]])",backref,"ALL");
            mytags = Replace(mytags,"\*","[^$>[:space:]]*","ALL");
            mytags = Replace(mytags,"\,","[$>[:space:]]|","ALL");
            mytags = "#mytags#[$>[:space:]]";
        } else { mytags = "$"; } // set the tag list to end of string to evaluate the "allow nothing" condition

        // loop over the string
        for (x = 1; x gt 0 and x lt len(mystring); x = x + currenttag.pos[1] + currenttag.len[1] -1)
        {
            // find the next tag within rexlimit characters of the starting point
            currenttag = REFind("<#spanquotes##endstring#",mid(mystring,x,rexlimit),1,true);
            if (currenttag.pos[1])
            {
                // if a tag was found, compare it to the regular expression
                subex = mid(mystring,x + currenttag.pos[1] -1,currenttag.len[1]);
                if (stripmode is "allow" XOR REFindNoCase("^<#spanstart#(#mytags#)",subex,1,false) eq 1)
                {
                    if (findonly) { return subex; } // return invalid tag as an error message
                    else { // remove the invalid tag from the string
                        myString = RemoveChars(myString,x + currenttag.pos[1] -1,currenttag.len[1]);
                        currenttag.len[1] = 0; // set the length of the tag string found to zero because it was removed
                    }
                }
            }
            // no tag was found within rexlimit characters
            // move to the next block of rexlimit characters -- CF 5 regex limitation
            else { currenttag.pos[1] = rexlimit; }
        }
    }
    if (findonly) { return ""; } // return an empty string indicating no invalid tags found
    else { return mystring; } // return the new string discluding any invalid tags
}
</cfscript>
<cffunction name="XmlSafeText" hint="Replaces all characters that would break an xml file." returnType="string" output="false">        
    <cfargument name="txt" type="string" required="true">
    <cfset var chars = "">
    <cfset var replaced = "">
    <cfset var i = "">
    
    <!--- Use XmlFormat function first --->
    <cfset txt = XmlFormat(txt)>
    <!--- Get all other characters to replace. --->
    <cfset chars = REMatch("[^[:ascii:]]",txt)>
    <!--- Loop through characters and do replace. Maintain a list of characters already replaced to avoid duplicate work. --->
    <cfloop index="i" from="1" to="#ArrayLen(chars)#">
        <cfif listFind(replaced,chars[i]) is 0>
            <cfset txt = Replace(txt,chars[i],"&##" & asc(chars[i]) & ";","all")>
            <cfset replaced = ListAppend(replaced,chars[i])>
        </cfif>
    </cfloop>
    <cfreturn txt>
</cffunction>

<cfscript>
/**
* Replaces a huge amount of unnecessary whitespace from your HTML code.
*
* @param sInput      HTML you wish to compress. (Required)
* @return Returns a string.
* @author Jordan Clark (JordanClark@Telus.net)
* @version 1, November 19, 2002
*/
function HtmlCompressFormat(sInput)
{
var level = 2;
if( arrayLen( arguments ) GTE 2 AND isNumeric(arguments[2]))
{
level = arguments[2];
}
// just take off the useless stuff
sInput = trim(sInput);
switch(level)
{
case "3":
{
// extra compression can screw up a few little pieces of HTML, doh
sInput = reReplace( sInput, "[[:space:]]{2,}", " ", "all" );
sInput = replace( sInput, "> <", "><", "all" );
sInput = reReplace( sInput, "<!--[^>]+>", "", "all" );
break;
}
case "2":
{
sInput = reReplace( sInput, "[[:space:]]{2,}", chr( 13 ), "all" );
break;
}
case "1":
{
// only compresses after a line break
sInput = reReplace( sInput, "(" & chr( 10 ) & "|" & chr( 13 ) & ")+[[:space:]]{2,}", chr( 13 ), "all" );
break;
}
}
return sInput;
}
</cfscript>
</cfcomponent>
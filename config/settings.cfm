<!---
	If you leave these settings commented out, Wheels will set the data source name to the same name as the folder the application resides in.
	<cfset set(dataSourceName="")>
	<cfset set(dataSourceUserName="")>
	<cfset set(dataSourcePassword="")> 
--->

<!---
	If you leave this setting commented out, Wheels will try to determine the URL rewrite capabilities automatically.
	The URLRewriting setting can bet set to "On", "Partial" or "Off".
	To run with "Partial" rewriting, the "PATH_INFO" variable needs to be supported by the web server.
	To run with rewriting "On", you need to apply the necessary rewrite rules on the web server first.
	<cfset set(URLRewriting="Partial")>
--->

<cfset set(dataSourceName="CCPD_PROD")>
<cfset set(reloadPassword="05125586") />
<cfset set(functionName="sendEmail", server="", username="", password="")> 
<cfset set(softDeleteProperty="deleted")>
<cfset set(tableNamePrefix="ce_")>
<cfset set(overwritePlugins=false)>
<cfset set(functionName='selectTag',prependToLabel='',appendToLabel='',prepend='<div class="control-group"><div class="controls">', append='<p class="help-block"></p></div></div>',labelPlacement="before",insertBlank=true)>
<cfset set(functionName='textFieldTag',prependToLabel='',appendToLabel='',prepend='<div class="control-group"><div class="controls">', append='<p class="help-block"></p></div></div>',labelPlacement="before")>

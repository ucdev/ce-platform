<!---
	This file is used to configure specific settings for the "testing" environment.
	A variable set in this file will override the one in "config/settings.cfm".
	Example: <cfset set(cacheQueries=false)>
--->
<cfset set(webPath=left(get('webPath'),len(get('webPath'))-1)) />
<cfset set(javascriptPath="") />
<cfset set(assetPaths={
	http="localhost:9229/assets",
	https="localhost:9229/assets"
}) />
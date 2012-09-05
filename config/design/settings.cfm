<!---
	This file is used to configure specific settings for the "design" environment.
	A variable set in this file will override the one in "config/settings.cfm".
	Example: <cfset set(dataSourceName="devDB")>
--->

<cfset set(assetPaths={
	http="localhost:3000/app/assets",
	https="localhost:3000/app/assets"
}) />
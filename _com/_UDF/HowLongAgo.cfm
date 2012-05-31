<cffunction name="HowLongAgo" access="public" returntype="string">
	<cfargument name="DateTime" type="string" required="yes" />
	
	<cfset var Difference = DateDiff('s',Arguments.DateTime,now())>
	<cfset var r = "">
	<cfset var s = "">
	<cfset var TheInt = 0>
	
	<cfif Difference GTE 60*60*24*365> <!--- // if more than a year ago --->
		<cfset TheInt = Round((Difference / (60*60*24*365)))>
		<cfif TheInt GT 1>
			<cfset s = "s">
		<cfelse>
			<cfset s = "">
		</cfif> 
		<cfset r = Round(TheInt) & " year" & s & " ago">
	<cfelseif Difference GTE 60*60*24*7*5><!--- // if more than FIVE WEEKS ago --->
		<cfset TheInt = Round((Difference / (60*60*24*30)))>
		<cfif TheInt GT 1>
			<cfset s = "s">
		<cfelse>
			<cfset s = "">
		</cfif> 
		<cfset r = Round(TheInt) & " month" & s & " ago">
	<cfelseif Difference GTE 60*60*24*7><!--- // if more than a WEEK ago --->
		<cfset TheInt = Round((Difference / (60*60*24*7)))>
		<cfif TheInt GT 1>
			<cfset s = "s">
		<cfelse>
			<cfset s = "">
		</cfif> 
		<cfset r = Round(TheInt) & " week" & s & " ago">
	<cfelseif Difference GTE 60*60*24><!--- // // if more than a DAY ago --->
		<cfset TheInt = Round((Difference / (60*60*24)))>
		<cfif TheInt GT 1>
			<cfset s = "s">
		<cfelse>
			<cfset s = "">
		</cfif> 
		<cfset r = Round(TheInt) & " day" & s & " ago">
	<cfelseif Difference GTE 60*60><!--- // if more than an hour ago --->
		<cfset TheInt = Round((Difference / (60*60)))>
		<cfif TheInt GT 1>
			<cfset s = "s">
		<cfelse>
			<cfset s = "">
		</cfif> 
		<cfset r = Round(TheInt) & " hour" & s & " ago">
	<cfelseif Difference GTE 60><!---  // if more than a minute ago --->
		<cfset TheInt = Round((Difference / (60)))>
		<cfif TheInt GT 1>
			<cfset s = "s">
		<cfelse>
			<cfset s = "">
		</cfif> 
		<cfset r = Round(TheInt) & " minute" & s & " ago">
	<cfelse><!--- // // if less than a minute ago --->
		<cfset r = "moments ago">
	</cfif>
	
	<cfreturn r>
</cffunction>
<cfcomponent extends="Controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="run">
		<cfparam name="job" default="" />
		
		<cfset renderPage(template="/cron/job_#params.job#") />
	</cffunction>
</cfcomponent>


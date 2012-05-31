<cfcomponent name="cfYUIMinfier" >
	<cffunction name="init">
		<cfargument name="path" type="string" required="false" default="/com/cfyuiminifier">
		<cfset variables.path = arguments.path />
		<!---by Aaron J Lynch             --->
		<!---created 07-09-08             --->
		<!---www.aaronjlynch.com          --->
		<!--- method to minify javascript using the YUICompressor.jar executable --->
		<cfreturn this />
	</cffunction>
	
	<cffunction name="minify" returntype="string" output="false">
		<cfargument name="myScript" required="true" type="string">
		<cfset var UniqueId = CreateUUID() />
		<cfset var Result = arguments.myScript />
		<cfset var fileObj = createObject("java","java.io.File") />
		<cfset var lastFileSize = -1 />
		<cfset var processingStarted = false />
		<cfset var processingComplete = false />
	
		<cftry>
			<cffile action="write" file="#ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#.js" output="#Result#"   />
			<cfexecute name="java" arguments="-jar #ExpandPath('#variables.path#/lib/yuicompressor.jar')# #ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#.js -o #ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#_min.js" />
			
			<cfloop condition="NOT processingStarted">
				<cftry>
					<cfset fileObj.init("#ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#_min.js") />
					<cfset processingStarted = true />
				<cfcatch>
					<cfset processingStarted = false />
				</cfcatch>	
				</cftry>
			</cfloop>
			
			<cfloop condition="NOT processingComplete">
				<cfset sleep(1500) />
				<cfif lastFileSize EQ fileObj.length() >
					<cfset processingComplete = true />
				</cfif>
				<cfset lastFileSize = fileObj.length() />
			</cfloop>
			
			<cffile action="read" variable="Result" file="#ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#_min.js"/>
			<cffile action="delete" file="#ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#.js" />
			<cffile action="delete" file="#ExpandPath('#variables.path#/tmp/')#minifier_#UniqueId#_min.js" />
		<cfcatch>
			<cflog file="cfYUIMinifier" text="#cfcatch.message#--#cfcatch.detail#-#lastFileSize#" />
		</cfcatch>
		</cftry>
		
		<cfreturn Result />
	</cffunction>
</cfcomponent>  
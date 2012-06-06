<cfcomponent output="false">
	 <cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="LessEngine" returntype="Any" access="public" output="false"  hint="I return the javaloader object ready for you to create ???">
		<cfargument name="files" type="array" required="no" default="#arraynew(1)#" />
		<cfscript>
			var loadPathsArray = [
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/commons-logging-1.1.1-javadoc.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/commons-logging-1.1.1-sources.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/commons-logging-1.1.1.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/commons-logging-adapters-1.1.1.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/commons-logging-api-1.1.1.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/commons-logging-tests.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/js.jar",
				ReturnWebRootTranslated2() & "/plugins/lessengine/lib/lesscss-engine-1.3.0.jar"
			];
			var myJavaLoader = application.javaLoader.init(loadPathsArray);
			var lessEngine = getLessEngine();
			var lessFileArrayComplete = getLessFiles(arguments.files);
			var generate = generateFiles(lessEngine,lessFileArrayComplete);
		</cfscript>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="getLessEngine">
		<cfset var lessEngine = application.javaLoader.create("com.asual.lesscss.LessEngine").init() />
		<cfreturn lessEngine />
	</cffunction>
	
	<cffunction name="getLessFiles">
		<cfargument name="files" type="array" required="no" default="#arraynew(1)#" />
		
		<cfscript>
			var loadMe = "";
			var i = "";
		    // create less file array
			var loadLessFiles = arguments.files; 
			var dirPath = ReturnWebRootTranslated2() & "/stylesheets/less/";
		</cfscript>
		
		<cfif arrayLen(loadLessFiles) EQ 0>
			<!--- read directory for less files --->
			<cfdirectory 
			   action = "list"
			   directory = "#dirPath#"
			   name = "loadMe"
			   filter = "#arguments.filter#">
			 
			<!--- add default less in /stylesheets/less folder --->
			<cfloop index="i" from="1" to="#loadMe.RecordCount#">
				<cfset loadLessFiles[i] = dirPath & loadMe.Name[i] />
			</cfloop>
		<cfelse>
			<!--- add default less in /stylesheets/less folder --->
			<cfloop index="i" from="1" to="#arrayLen(loadLessFiles)#">
				<cfset loadLessFiles[i] = dirPath & loadLessFiles[i] />
			</cfloop>
		</cfif>
		
		 <cfreturn loadLessFiles />
	</cffunction>
	
	<!--- function altered from
		http://bears-eat-beets.blogspot.com/2010/08/creating-less-css-plugin-for-coldmvc.html
	 --->
	<cffunction name="generateFiles" returntype="Any" access="public" output="false"  hint="I return the javaloader object ready for you to create ???">
  		<cfargument name="lessEngine" required="true" type="any" />
  		<cfargument name="lessFileArrayComplete" required="true" type="array" />
		
		<cfset var css_file = "" />
		<cfset var destination = "" />
		<cfset var i = "" />
		<cfset var content = "" />
		
		<cfloop array="#arguments.lessFileArrayComplete#" index="i">
			<!--- check if less file exists --->
			<cfif fileExists(#i#)>
			 	<cfset css_file = replaceNoCase(i, ".less", ".css") />
				<cfset destination = replaceNoCase(css_file, "/less/", "/") />
				
				<cfset content = fileRead(i) />
				<cfset fileWrite(destination, arguments.lessEngine.compile(content)) />
			</cfif>
		</cfloop>
		
	</cffunction>
	
	<cffunction name="ReturnWebRootTranslated2" access="public" returntype="string" hint="Returns the translated (file system) location of the web root directory">
		<cfscript>
		/**
		* Returns the translated (file system) location of the web root directory.
		*
		* @return Returns a string.
		* @author David Whiterod (whiterod.david@saugov.sa.gov.au)
		* @version 1, May 9, 2003
		*/
		var tmpPath = Replace(CGI.SCRIPT_NAME, "/", "\", "ALL");
		return Replace(ReplaceNoCase(CGI.PATH_TRANSLATED, tmpPath, "", "ALL"), "\", "/", "ALL");
		</cfscript>
	</cffunction>
	
</cfcomponent>
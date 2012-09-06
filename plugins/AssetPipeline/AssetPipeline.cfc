<cfcomponent output="false">

	<cffunction name="init" access="public" output="false">
		<cfscript>
			this.version = "1.1.5";	
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="styleSheetLinkTag" access="public" output="false" returntype="string" mixin="controller">	
		<cfargument name="sources" type="string" required="false" default="" />
		<cfargument name="type" type="string" required="false" default="#application.wheels.functions.styleSheetLinkTag.type#" />
		<cfargument name="media" type="string" required="false" default="#application.wheels.functions.styleSheetLinkTag.media#" />
		<cfargument name="bundle" type="string" required="false" default="" />
		<cfreturn $callOriginalIncludeMethod($includeMethod="styleSheetLinkTag", $fileType="css", argumentCollection=arguments) />
	</cffunction>
	
	<cffunction name="javaScriptIncludeTag" access="public" output="false" returntype="string" mixin="controller">
		<cfargument name="sources" type="string" required="false" default="" />
		<cfargument name="type" type="string" required="false" default="#application.wheels.functions.javaScriptIncludeTag.type#" />
		<cfargument name="bundle" type="string" required="false" default="" />
		
		<cfreturn $callOriginalIncludeMethod($includeMethod="javaScriptIncludeTag", $fileType="js", argumentCollection=arguments) />
	</cffunction>
	
	<cffunction name="$callOriginalIncludeMethod" access="public" output="false" returntype="string" mixin="controller">
		<cfargument name="$includeMethod" type="string" required="true" />
		<cfargument name="$fileType" type="string" required="true" />
		<cfargument name="sources" type="string" required="true" />
		<cfargument name="bundle" type="string" required="true" />
		<cfargument name="type" type="string" required="true" />
		<cfscript>
			var originalIncludeMethod = core[arguments.$includeMethod];
			
			if (not ListFindNoCase("production,testing", application.wheels.environment))
			{
				if (not Len(arguments.sources) and $bundleExists(bundle=arguments.bundle, type=arguments.$fileType))
					arguments.sources = application.assetBundler[arguments.$fileType][arguments.bundle].sources;
				StructDelete(arguments, "bundle");
				return originalIncludeMethod(argumentCollection=arguments);
			}
			
			if (not Len(arguments.bundle) or not $bundleExists(bundle=arguments.bundle, type=arguments.$fileType))
			{
				if (not Len(arguments.sources) and $bundleExists(bundle=arguments.bundle, type=arguments.$fileType))
					arguments.sources = application.assetBundler[arguments.$fileType][arguments.bundle].sources;
				StructDelete(arguments, "bundle");
				return originalIncludeMethod(argumentCollection=arguments);
			}
			
			arguments.sources = arguments.bundle;
			
			StructDelete(arguments, "$includeMethod");
			StructDelete(arguments, "$fileType");
			StructDelete(arguments, "bundle");
			StructDelete(arguments, "source");
		</cfscript>
		<cfreturn originalIncludeMethod(argumentCollection=arguments) />
	</cffunction>
	
	<cffunction name="$bundleExists" output="false" returntype="boolean" access="public" mixin="controller">
		<cfargument name="bundle" required="true" type="string" />
		<cfargument name="type" required="true" type="string" hint="can be `js` or 	`css`" />
		<cfscript>
			var returnValue = false;
			
			if (not StructKeyExists(application, "assetBundler"))
				return returnValue;
				
			if (not StructKeyExists(application.assetBundler, arguments.type))
				return returnValue;
				
			if (not StructKeyExists(application.assetBundler[arguments.type], arguments.bundle))
				return returnValue;
				
			returnValue = true;
		</cfscript>
		<cfreturn returnValue />
	</cffunction>
	
	<cffunction name="$compressContents" access="public" output="false" returntype="string" mixin="application">
		<cfargument name="fileContents" type="string" required="true" />
		<cfargument name="type" type="string" required="true" />
		<cfscript>
			var loc = {};
			
			loc.javaLoader = $createJavaLoader();
			
			loc.stringReader = createObject("java", "java.io.StringReader").init(arguments.fileContents);
			loc.stringWriter = createObject("java", "java.io.StringWriter").init();
			
			if (LCase(arguments.type) == "css")
			{
				loc.yuiCompressor = loc.javaLoader.create("com.yahoo.platform.yui.compressor.CssCompressor").init(loc.stringReader);
				loc.yuiCompressor.compress(loc.stringWriter, JavaCast("int", -1));
			}
			else if (LCase(arguments.type) == "js")
			{
				/*
				* @author joshuairl
				* @description ADDING ERROR DETECTION AND OUTPUT FOR DEBUGGING 
				*/
				loc.errOutputStream = createObject("java","java.io.ByteArrayOutputStream").init();
				loc.errPrintStream = loc.javaLoader.create("java.io.PrintStream").init(loc.errOutputStream);
				loc.errorReporter = loc.javaLoader.create("org.mozilla.javascript.tools.ToolErrorReporter").init(JavaCast("boolean", true),loc.errPrintStream);
				
				try {
					loc.yuiCompressor = loc.javaLoader.create("com.yahoo.platform.yui.compressor.JavaScriptCompressor").init(loc.stringReader, loc.errorReporter);
					loc.yuiCompressor.compress(loc.stringWriter, JavaCast("int", -1), JavaCast("boolean", true), JavaCast("boolean", false), JavaCast("boolean", false), JavaCast("boolean", false));
				} catch (any e) {
					loc.errPrintStream.close();
					throw(message="YUI Compression Error",detail=loc.errOutputStream.toString());
				}
			}
			else
			{
				return arguments.fileContents;
			}
			
			loc.stringReader.close();
			loc.compressedContents = loc.stringWriter.toString();
			loc.stringWriter.close();	
			
			return loc.compressedContents;	
		</cfscript>
	</cffunction>

	<cffunction name="$createJavaLoader" access="public" output="false" returntype="any" mixin="application">
		<cfscript>
			if (StructKeyExists(server, "javaLoader"))
				return server.javaLoader;
			
			loc.relativePluginPath = application.wheels.webPath & application.wheels.pluginPath & "/assetbundler/";
			loc.classPath = Replace(Replace(loc.relativePluginPath, "/", ".", "all") & "javaloader", ".", "", "one");
			
			loc.paths = ArrayNew(1);
			loc.paths[1] = ExpandPath(loc.relativePluginPath & "lib/yuicompressor-2.4.7.jar");
			
			// set the javaLoader to the request in case we use it again
			server.javaLoader = $createObjectFromRoot(path=loc.classPath, fileName="JavaLoader", method="init", loadPaths=loc.paths, loadColdFusionClassPath=false);
		</cfscript>
		<cfreturn server.javaLoader />
	</cffunction>
	
	<cffunction name="$getFileContents" access="public" output="false" returntype="string" mixin="application">
		<cfargument name="fileNames" type="string" required="true" />
		<cfargument name="relativeFolderPath" type="string" required="true" />
		<cfargument name="extension" type="string" required="true" />
		<cfargument name="delimiter" type="string" required="false" default="," />
		<cfscript>
			var loc = { fileContents = "" };
			
			for (loc.item in ListToArray(arguments.fileNames, arguments.delimiter))
			{
				loc.itemRelativePath = arguments.relativeFolderPath & Trim(loc.item);
			
				if (Reverse(arguments.extension) neq Left(Reverse(loc.itemRelativePath), Len(arguments.extension)))
					loc.itemRelativePath = loc.itemRelativePath & arguments.extension;
			
				loc.itemFilePath = ExpandPath(loc.itemRelativePath);
				
				if (!FileExists(loc.itemFilePath))
					$throw(type="Wheels.AssetFileNotFound", message="Could not find the file '#loc.itemRelativePath#'.", extendedInfo="Create a file named '#loc.item##arguments.extension#' in the '#arguments.relativeFolderPath#' directory (create the directory as well if it doesn't already exist).");
				
				// get each of our files and concantenate them together
				loc.file = $file(action="read", file=loc.itemFilePath);
				
				if (arguments.extension == ".css")
					loc.file = $appendQueryStringToUrls(loc.file);
				
				loc.fileContents = loc.fileContents & loc.file;
			}
			
			return loc.fileContents;
		</cfscript>
	</cffunction>
	
	<cffunction name="$getAllFilesInDirectory" access="public" output="false" returntype="string" mixin="application">
		<cfargument name="directoryPath" type="string" required="true" />
		<cfargument name="relativeFolderPath" type="string" required="true" />
		<cfargument name="extension" type="string" required="true" />
		<cfargument name="delimiter" type="string" required="false" default="," />
		<cfscript>
			var loc = { fileNames = "" };
			
			loc.itemFolderPath = ExpandPath(arguments.relativeFolderPath & Trim(arguments.directoryPath));
			loc.filesQuery = $directory(action="list", directory=loc.itemFolderPath, type="file", filter="*#arguments.extension#", recurse=true);
			
			for (loc.i = 1; loc.i lte loc.filesQuery.Recordcount; loc.i++)
			{
				loc.relativePath = ListLast(ReplaceNoCase(Replace(loc.filesQuery.directory[loc.i], "\", "/", "all") & "/" & loc.filesQuery.name[loc.i], arguments.relativeFolderPath, "|", "all"), "|");
				loc.fileNames = ListAppend(loc.fileNames, loc.relativePath, arguments.delimiter);
			}
		</cfscript>
		<cfreturn loc.fileNames />
	</cffunction>
	
	<cffunction name="$appendQueryStringToUrls" access="public" output="false" returntype="string" mixin="application">
		<cfargument name="fileContents" type="string" required="false" default="" />
		<cfscript>
			var loc = {};
			loc.used = {};
			loc.matches = REMatchNoCase("url\([^\)]*\)", arguments.fileContents);
			
			for (loc.i = 1; loc.i lte ArrayLen(loc.matches); loc.i++)
			{
				if (!StructKeyExists(loc.used, loc.matches[loc.i]))
				{
					loc.replaceWith = ReplaceList(loc.matches[loc.i], "',""", "");
					loc.replaceWith = REReplace(loc.replaceWith, "\)$", $appendQueryString() & ")", "one");
					arguments.fileContents = ReplaceNoCase(arguments.fileContents, loc.matches[loc.i], loc.replaceWith, "all");
					loc.used[loc.matches[loc.i]] = "";
				}
			}
		</cfscript>
		<cfreturn arguments.fileContents />
	</cffunction>

	<cffunction name="$appendQueryString" returntype="string" access="public" output="false" mixin="application">
		<cfscript>
			var returnValue = "";
			// if assetQueryString is a boolean value, it means we just reloaded, so create a new query string based off of now
			// the only problem with this is if the app doesn't get used a lot and the application is left alone for a period longer than the application scope is allowed to exist
			if (IsBoolean(application.wheels.assetQueryString) and YesNoFormat(application.wheels.assetQueryString) == "no")
				return returnValue;
	
			if (!IsNumeric(application.wheels.assetQueryString) and IsBoolean(application.wheels.assetQueryString))
				application.wheels.assetQueryString = Hash(DateFormat(Now(), "yyyymmdd") & TimeFormat(Now(), "HHmmss"));
			returnValue = returnValue & "?" & application.wheels.assetQueryString;
		</cfscript>
		<cfreturn returnValue />
	</cffunction>
	
</cfcomponent>
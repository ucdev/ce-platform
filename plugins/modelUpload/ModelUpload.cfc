<cfcomponent output="false" mixin="controller">

	<cffunction name="init" returntype="any" access="public" output="false">
		<cfset this.version = "1.0,1.1">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="upload" returntype="any" access="public" output="false">
		<cfargument name="fileField" type="string" required="true">
		<cfargument name="destination" type="string" required="false" hint="relative to 'files' folder" default="">
		<cfargument name="uploadType" type="string" required="false" default="">
		<cfargument name="modelName" type="string" required="false" default="">
		<cfargument name="modelKey" type="string" required="false" default="">
		<cfargument name="modelPrimaryColumn" type="string" required="false" default="">
		<cfset var loc = {}>
		<cfset loc.ret = "">
		<cfset loc.mp = "multipart/form-data">
		
		<!---
		see if the content_type is mulitpart which means a file was uploaded
		if not get out. no use wasting time
		--->
		<cfif not left(cgi.CONTENT_TYPE, len(loc.mp)) eq loc.mp>
			<cfreturn loc.ret>
		</cfif>

		<!--- now that we have our field name, let's look in the form scope to see if it's blank --->
		<cfif not len(form[arguments.fileField])>
			<cfreturn loc.ret>
		</cfif>
		<cfset arguments.uploadType = lcase(arguments.uploadType) />
		<cfset typeArray = listToArray(arguments.uploadType,':') />
		
		<cfset loc['dir'] = structNew() />
		<cfset loc.dir['base'] = $setupDir(expandPath(get("filePath"))) />
		<cfset loc.typeDirVar = "" />
		
		<cfloop from="1" to="#arrayLen(typeArray)#" index="i">
			<cfset loc.typeDirVar = loc.typeDirVar & typeArray[i] & "\" />
			<cfset loc.dir[typeArray[i]] = $setupDir(loc.dir['base'] & "\" & loc.typeDirVar) />
			
			<cfif i EQ arrayLen(typeArray)>
				<cfset loc.dir['final'] = loc.dir['base'] & "\" & loc.typeDirVar />
			</cfif>
		</cfloop>
		
		<cfset loc.filename = arguments.modelKey & "_" & dateFormat(now(),'yyyymmdd') & timeFormat(now(),'hhmmss') />
		

		<!--- create the a default set of arguments to pass to cffileupload --->
		<cfset loc.args = {}>
		<cfset loc.args.destination = loc.dir['final'] />

		<cfif structKeyExists(arguments,'modelPrimaryColumn') AND len(trim(arguments.modelPrimaryColumn)) GT 0>
			<cfset setPrimaryColumn = true />
		<cfelse>
			<cfset setPrimaryColumn = false />
		</cfif>
		<cfset loc.args.action = "upload">
		<cfset loc.args.filefield = arguments.fileField>
		
		<!---<cfif structKeyExists(arguments,'destination') AND len(trim(arguments.destination)) GT 0>
			<cfset loc.args.destination = arguments.destination>
		<cfelse>
			<cfset loc.args.destination = expandPath(get("filePath")) & arguments.modelName>
		</cfif>--->
		
		<cfset loc.args.nameconflict = "MAKEUNIQUE">
		
		<!--- remove the fieldName, destination from the arguments scope for overloading --->
		<cfset structdelete(arguments, "fileField", false)>
		<cfset structdelete(arguments, "destination",false)>
		
		<!--- append and oveerwrite the defaults with any extra arguments --->
		<cfset structappend(loc.args, arguments, true)>
		
		<!--- upload the file --->
		<cftry>
			<cfset loc.cffileupload = $cffileupload(
			argumentCollection=loc.args
			)>
			
			<cfcatch type="any">
				<cfreturn loc.ret>
			</cfcatch>
		</cftry>
		

		
		<cfset loc.dbParams = structNew() />
		<cfset structAppend(loc.dbParams,loc.cffileupload,true) />
		<cfset loc.dbParams['uploadtype'] = loc.args.uploadtype />
		<cfset loc.dbParams['modelname'] = loc.args.modelName />
		<cfset loc.dbParams['modelKey'] = loc.args.modelKey />
		<cfset loc.dbParams['createdAt'] = now() />
		
		<cfset loc.db = model("upload").new(loc.dbParams) />
		
		<cfif loc.db.save(validate=false)>
			<cffile action="rename" source="#loc.dir.final#\#loc.db.serverFile#" destination="#loc.dir.final#\#loc.filename#.#loc.db.serverFileExt#" />
			<cfset loc.db.serverDirectory = '#loc.dir.final#' />
			<cfset loc.db.serverFileName = '#loc.filename#' />
			<cfset loc.db.serverFile = '#loc.filename#.#loc.db.serverFileExt#' />
			<cfset loc.db.save(validate=false) />
			<cfif setPrimaryColumn>
				<cfset loc.dbModel = model(loc.args.modelName).findByKey(loc.args.modelKey) />
				
				<cfif isObject(loc.dbModel)>
					<cfset loc.dbModel.updateProperty(loc.args.modelPrimaryColumn,loc.db.id) />
				</cfif>
			</cfif>
		</cfif>
			
		<cfreturn loc.db.properties()>
	</cffunction>
 	
	<cffunction name="$cffileupload" returntype="struct" access="public" output="false">
		<cfargument name="deleteBadFile" type="boolean" required="false" default="true" hint="should we delete an invalid files that are uploaded from the temp directory.">
		<cfargument name="badExtensions" type="string" required="false" default="" hint="appends the internal extension list. any file with these extensions is automatically invalid.">
		<cfargument name="mimeTypes" type="struct" required="false" default="#structnew()#" hint="appends or replace the internal list of mimetypes with your own custom list.">
		<cfset var loc = {}>
		<cfset loc.badExtensions = "cfm,cfml,cfc,dbm,jsp,asp,aspx,exe,php,cgi,shtml">
		<cfset loc.mimetypes = {}>
		<!--- pdf --->
		<cfset loc.mimetypes.pdf = "application/pdf,application/x-pdf,app/pdf">
		<!--- office --->
		<cfset loc.mimetypes.ppt = "application/vnd.ms-powerpoint">
		<cfset loc.mimetypes.xls = "application/vnd.ms-excel">
		<cfset loc.mimetypes.doc = "application/msword">
		<cfset loc.mimetypes.pub = "application/x-mspublisher,application/vnd.ms-publisher">
		<cfset loc.mimetypes.docm = "application/vnd.ms-word.document.macroEnabled.12">
		<cfset loc.mimetypes.docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document">
		<cfset loc.mimetypes.dotm = "application/vnd.ms-word.template.macroEnabled.12">
		<cfset loc.mimetypes.dotx = "application/vnd.openxmlformats-officedocument.wordprocessingml.template">
		<cfset loc.mimetypes.potm = "application/vnd.ms-powerpoint.template.macroEnabled.12">
		<cfset loc.mimetypes.potx = "application/vnd.openxmlformats-officedocument.presentationml.template">
		<cfset loc.mimetypes.ppam = "application/vnd.ms-powerpoint.addin.macroEnabled.12">
		<cfset loc.mimetypes.ppsm = "application/vnd.ms-powerpoint.slideshow.macroEnabled.12">
		<cfset loc.mimetypes.ppsx = "application/vnd.openxmlformats-officedocument.presentationml.slideshow">
		<cfset loc.mimetypes.pptm = "application/vnd.ms-powerpoint.presentation.macroEnabled.12">
		<cfset loc.mimetypes.pptx = "application/vnd.openxmlformats-officedocument.presentationml.presentation">
		<cfset loc.mimetypes.xlam = "application/vnd.ms-excel.addin.macroEnabled.12">
		<cfset loc.mimetypes.xlsb = "application/vnd.ms-excel.sheet.binary.macroEnabled.12">
		<cfset loc.mimetypes.xlsm = "application/vnd.ms-excel.sheet.macroEnabled.12">
		<cfset loc.mimetypes.xlsx = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
		<cfset loc.mimetypes.xltm = "application/vnd.ms-excel.template.macroEnabled.12">
		<cfset loc.mimetypes.xltx = "application/vnd.openxmlformats-officedocument.spreadsheetml.template">
		<!--- images --->
		<cfset loc.mimetypes.jpg = "image/jpg,image/pjpg,image/jpeg,image/pjpeg">
		<cfset loc.mimetypes.jpeg = "image/jpg,image/pjpg,image/jpeg,image/pjpeg">
		<cfset loc.mimetypes.gif = "image/gif">
		<cfset loc.mimetypes.png = "image/png">
		
		<!--- append our mime types with any custom ones --->
		<cfif not structisempty(arguments.mimeTypes)>
			<cfset structappend(loc.mimetypes, arguments.mimeTypes, true)>
		</cfif>
		<cfset structdelete(arguments, "mimeTypes")>
		
		<!--- append our badExtensions with any custom ones --->
		<cfset loc.badExtensions = listappend(loc.badExtensions, arguments.badExtensions)>
		<cfset structdelete(arguments, "badExtensions")>
		
		<!--- the result to use internally --->
		<cfset arguments.result = "loc.cffile">
	
		<!---
			intercept the upload destination and set it to the tempdirectory,
			save it so we can move the file later
		 --->
		<cfset loc.destination = arguments.destination>
		<cfset arguments.destination = getTempDirectory()>
	
		<!--- execute upload --->
		<cffile attributeCollection="#arguments#">
	
		<!--- get the full filename that was uploaded --->
		<cfset loc.fileuploaded = arguments.destination & loc.cffile["serverFile"]>
	
		<!--- try to get the mimetype of the uploaded file --->
		<cfset loc.filemimetype = getPageContext().getServletContext().getMimeType(loc.fileuploaded)>
	
		<cfif
			listfindnocase(loc.badExtensions, loc.cffile["serverFileExt"])
			or not structkeyexists(loc.mimetypes, loc.cffile["serverFileExt"])
			or (structkeyexists(loc, "filemimetype") && not listfindnocase(loc.mimetypes[loc.cffile["serverFileExt"]], loc.filemimetype))>
			<cfif arguments.deleteBadFile>
				<cffile action="delete" file="#loc.fileuploaded#">
			</cfif>
			<cfthrow type="Custom" message="Invalid file type">
		</cfif>
		
		<!--- full path to move the file to --->
		<cfset loc.finaldestination = listappend(loc.destination, loc.cffile["serverFile"], "\/")>
		
		<!--- handle makeunique when moving --->
		<cfif structkeyexists(arguments, "nameconflict") and arguments.nameconflict eq "makeunique">
		
			<cfif fileexists(loc.finaldestination)>
				<cfset loc.cffile["serverFileName"] = loc.cffile["serverFileName"] & gettickcount()>
				<cfset loc.cffile["serverFile"] = listappend(loc.cffile["serverFileName"], loc.cffile["serverFileExt"], ".")>
				<cfset loc.finaldestination = listappend(loc.destination, loc.cffile["serverFile"], "\/")>
			</cfif>
		
		</cfif>
	
		<!--- forgot to handle mode in unix --->
		<cfset loc.args = {}>
		<cfset loc.args.action = "move">
		<cfset loc.args.source = "#loc.fileuploaded#">
		<cfset loc.args.destination = "#loc.finaldestination#">
		<cfif structkeyexists(arguments, "mode")>
			<cfset loc.args.mode = "#arguments.mode#">
		</cfif>
	
		<!--- move the file --->
		<cffile attributeCollection="#loc.args#">
	
		<!--- append the mimetype to the returning structure for convinence --->
		<cfset loc.cffile.mimetype = listfirst(loc.mimetypes[loc.cffile["serverFileExt"]])>
		<cfif structkeyexists(loc, "filemimetype")>
			<cfset loc.cffile.mimetype = loc.filemimetype>
		</cfif>
		
		<cfreturn loc.cffile>
	</cffunction>

	<cffunction name="$setupDir">
		<cfargument name="dir">
		
		<cfif NOT directoryExists(arguments.dir)>
			<cfdirectory action="create" directory="#arguments.dir#" />
		</cfif>
		
		<cfreturn arguments.dir />
	</cffunction>
</cfcomponent>
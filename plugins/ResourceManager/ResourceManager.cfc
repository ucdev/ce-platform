<cfcomponent output="false">
	<cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="createAssets" hint="I load all cached pagelet resources.">
		<cfset var loc = {} />
		<cfset loc.filepath = "" />
		<cfset loc.httppath = "" />
		<cfset loc.pathData = $getPathFromRequest(pathInfo=request.cgi.path_Info, scriptName=request.cgi.script_Name) />
		<cfset loc.srcPath = "/javascripts/src/_core/" />
		<cfset loc.tmplPath = "/javascripts/src/_scaffold/" />
		<cfset loc.nameInSingularUppercase = capitalize(singularize(params.controller))>
		<cfset loc.nameInSingularLowercase = LCase(singularize(params.controller))>
		<cfset loc.nameInPluralLowercase = LCase(params.controller)>
		<cfset loc.nameInPluralUppercase = capitalize(params.controller)>
		<cfset loc.actionName = lcase(params.action)>
		
		<!--- <cfif structKeyExists(params,'ROUTE') AND params.route NEQ "wildcard">
			<!--- CONTROLLER JS --->
			<cfset $renderTemplate(name="controller",templatePath=expandPath("#loc.tmplPath#Controllers/template.txt"),outputPath=expandPath("#loc.srcPath#Controllers"),fileName="#loc.nameInPluralLowercase#.coffee") />
			
			<!--- COLLECTION JS --->
			<cfset $renderTemplate(name="collection",templatePath=expandPath("#loc.tmplPath#Collections/template.txt"),outputPath=expandPath("#loc.srcPath#Collections"),fileName="#loc.nameInPluralLowercase#.coffee") />
			
			<!--- MODEL JS --->
			<cfset $renderTemplate(name="model",templatePath=expandPath("#loc.tmplPath#Models/template.txt"),outputPath=expandPath("#loc.srcPath#Models"),fileName="#loc.nameInSingularLowercase#.coffee") />
			
			<!--- PAGER JS --->
			<cfset $renderTemplate(name="pager",templatePath=expandPath("#loc.tmplPath#Pagers/template.txt"),outputPath=expandPath("#loc.srcPath#Pagers"),fileName="#loc.nameInPluralLowercase#.coffee") />
			
			<!--- ROUTER JS --->
			<cfset $renderTemplate(name="router",templatePath=expandPath("#loc.tmplPath#Routers/template.txt"),outputPath=expandPath("#loc.srcPath#Routers"),fileName="#loc.nameInPluralLowercase#.coffee") />

			<!--- VIEW EDIT JS --->
			<cfset $renderTemplate(name="view_edit",templatePath=expandPath("#loc.tmplPath#Views/edit_template.txt"),outputPath=expandPath("#loc.srcPath#Views/#loc.nameInPluralLowercase#"),fileName="edit.coffee") />

			<!--- VIEW INDEX JS --->
			<cfset $renderTemplate(name="view_index",templatePath=expandPath("#loc.tmplPath#Views/index_template.txt"),outputPath=expandPath("#loc.srcPath#Views/#loc.nameInPluralLowercase#"),fileName="index.coffee") />
			
			<!--- VIEW SHOW JS --->
			<cfset $renderTemplate(name="view_show",templatePath=expandPath("#loc.tmplPath#Views/show_template.txt"),outputPath=expandPath("#loc.srcPath#Views/#loc.nameInPluralLowercase#"),fileName="show.coffee") />
			
			<!--- VIEW ROW JS --->
			<cfset $renderTemplate(name="view_row",templatePath=expandPath("#loc.tmplPath#Views/row_template.txt"),outputPath=expandPath("#loc.srcPath#Views/#loc.nameInPluralLowercase#"),fileName="row.coffee") />
		</cfif> --->
	</cffunction>
	
	<cffunction name="$renderTemplate">
		<cfargument name="name" type="string" required="yes" />
		<cfargument name="templatePath" type="string" required="yes" />
		<cfargument name="outputPath" type="string" required="yes" />
		<cfargument name="fileName" type="string" required="yes" />
		
		<cfset var loc = {} />
		<cfset loc.nameInSingularUppercase = capitalize(singularize(params.controller))>
		<cfset loc.nameInSingularLowercase = LCase(singularize(params.controller))>
		<cfset loc.nameInPluralLowercase = LCase(params.controller)>
		<cfset loc.nameInPluralUppercase = capitalize(params.controller)>
		<cfset loc.actionName = lcase(params.action)>
		<cfset loc.templatePath = arguments.templatePath />
		<cfset loc.outputPath = arguments.outputPath />
		<cfset loc.fileName = arguments.fileName />
		<cfset loc.outputVar = "" />
		
		<cfif NOT directoryExists(loc.outputPath)>
			<cfdirectory action="create" directory="#loc.outputPath#">
		</cfif>
		
		<cfif NOT fileExists(loc.outputPath & "/" & loc.fileName) AND fileExists(loc.templatePath)>
				<cffile action="read" file="#loc.templatePath#" variable="loc.outputVar" />
				<cfset loc.outputVar = Replace(loc.outputVar,"<%= loc.nameInPluralLowercase =%>","#loc.nameInPluralLowercase#","ALL") />
				<cfset loc.outputVar = Replace(loc.outputVar,"<%= loc.nameInPluralUppercase =%>","#loc.nameInPluralUppercase#","ALL") />
				<cfset loc.outputVar = Replace(loc.outputVar,"<%= loc.nameInSingularUppercase =%>","#loc.nameInSingularUppercase#","ALL") />
				<cfset loc.outputVar = Replace(loc.outputVar,"<%= loc.nameInSingularLowercase =%>","#loc.nameInSingularLowercase#","ALL") />
				<cffile action="write" file="#loc.outputPath#/#loc.fileName#" output="#loc.outputVar#" charset="utf-8"  />
			</cfif>
	</cffunction>
	
	<cffunction name="$writeLessFile">
	</cffunction>
	
	<cffunction name="$writeJsFile">
		<cfsavecontent variable="loc.output">
		
		</cfsavecontent>
	</cffunction>
	
	<cffunction name="$writeToCache">
	
	</cffunction>
	
	<cffunction name="$loadCss()">
	
	</cffunction>
	
	<cffunction name="$loadPagelet()">
	
	</cffunction>
</cfcomponent>
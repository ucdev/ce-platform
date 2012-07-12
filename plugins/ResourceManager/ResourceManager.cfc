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
		
		<cfset loc.nameInSingularLowercase = LCase(singularize(params.controller))>
		<cfset loc.nameInPluralLowercase = LCase(params.controller)>
		<cfset loc.nameInPluralUppercase = capitalize(params.controller)>
		<cfset loc.actionName = lcase(params.action)>
		
		<cfif structKeyExists(params,'ROUTE') AND params.route NEQ "wildcard">
			<!--- CONTROLLER JS --->
			<cfset $renderTemplate(name="controller",templatePath=expandPath("/javascripts/app/controllers/template.txt"),outputPath=expandPath("/javascripts/controllers"),fileName="#loc.nameInPluralLowercase#.js") />
			
			<!--- COLLECTION JS --->
			<cfset $renderTemplate(name="collection",templatePath=expandPath("/javascripts/app/collections/template.txt"),outputPath=expandPath("/javascripts/collections"),fileName="#loc.nameInPluralLowercase#.js") />
			
			<!--- MODEL JS --->
			<cfset $renderTemplate(name="model",templatePath=expandPath("/javascripts/app/models/template.txt"),outputPath=expandPath("/javascripts/models"),fileName="#loc.nameInSingularLowercase#.js") />
			
			<!--- ROUTER JS --->
			<cfset $renderTemplate(name="router",templatePath=expandPath("/javascripts/app/routers/template.txt"),outputPath=expandPath("/javascripts/routers"),fileName="#loc.nameInPluralLowercase#.js") />

			<!--- VIEW EDIT JS --->
			<cfset $renderTemplate(name="view_edit",templatePath=expandPath("/javascripts/app/views/edit_template.txt"),outputPath=expandPath("/javascripts/views/#loc.nameInPluralLowercase#"),fileName="edit.js") />

			<!--- VIEW INDEX JS --->
			<cfset $renderTemplate(name="view_index",templatePath=expandPath("/javascripts/app/views/index_template.txt"),outputPath=expandPath("/javascripts/views/#loc.nameInPluralLowercase#"),fileName="index.js") />
			
			<!--- VIEW SHOW JS --->
			<cfset $renderTemplate(name="view_show",templatePath=expandPath("/javascripts/app/views/show_template.txt"),outputPath=expandPath("/javascripts/views/#loc.nameInPluralLowercase#"),fileName="show.js") />
			
			<!--- VIEW ROW JS --->
			<cfset $renderTemplate(name="view_row",templatePath=expandPath("/javascripts/app/views/row_template.txt"),outputPath=expandPath("/javascripts/views/#loc.nameInPluralLowercase#"),fileName="row.js") />
			
			<!--- BUILD MODEL JS --->
			<cfset loc.modelJs = "/javascripts/models/#lcase(singularize(params.controller))#.js" />
	
			<cfsavecontent variable="loc.modelOutput"><cfoutput>
			ccpd.#lcase(singularize(params.controller))# = Backbone.Model.extend({
				initialize: function(){
					debug.info("#singularize(params.controller)# model initialized.");
				}
			});
			</cfoutput></cfsavecontent>
			<cfif NOT fileExists(loc.modelJs)>
				<cffile action="write" file="#loc.modelJs#" output="#loc.modelOutput#" charset="utf-8"  />
			</cfif>
			<!---
			<!--- BUILD LESS VIEW FILE --->
			<cfset loc.modelJs = "/javascripts/#application.version_token#/app/models/#lcase(singularize(params.controller))#.js" />
			
			<cfif NOT fileExists(loc.modelJs)>
				<cffile action="write" file="#loc.modelJs#" output="" charset="utf-8"  />
			</cfif>--->
		</cfif>
	</cffunction>
	
	<cffunction name="$renderTemplate">
		<cfargument name="name" type="string" required="yes" />
		<cfargument name="templatePath" type="string" required="yes" />
		<cfargument name="outputPath" type="string" required="yes" />
		<cfargument name="fileName" type="string" required="yes" />
		
		<cfset var loc = {} />
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
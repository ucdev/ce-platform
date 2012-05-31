<cfcomponent name="jtidy" displayname="jTidy" hint="clean out invalid html">

	<cffunction name="XHTMLParser" displayname="Tidy parser" hint="Takes a string as an argument and returns parsed and valid xHTML" output="false">
		<cfargument name="strToParse" required="true" type="string" default="" />
		<cfargument name="props" type="string" required="no" default="body" />
		
		<cfset var returnPart = structNew() /> <!--- // return variable --->
		
		<!---
			====MODES====
			body: grabs all content within the body tags only.
			all: grabs entire XHTML document (unparsed)
			images: grabs image "src" properties (uses "count" argument to determine how many images to grab)
			title: grabs page title
			srcOnly: for images, it returns image src only
		--->
		
		<cfset parseData = trim(arguments.strToParse) />
		
		<!--- Simply return the sting if its empty --->
		<cfif not len(parseData)>
			<cfreturn parseData />
		</cfif>
		
		<cftry>
		
			<cfscript>
			/**
			* This function reads in a string, checks and corrects any invalid HTML.
			* By Greg Stewart
			*
			* @param strToParse The string to parse (will be written to file).
			* accessible from the web browser
			* @return returnPart
			* @author Greg Stewart (gregs(at)tcias.co.uk)
			* @version 1, August 22, 2004
			
			* @version 1.1, September 09, 2004
			* with the help of Mark Woods this UDF no longer requires temp files and only accepts
			* the string to parse
			
			* @version 1.2, January 01, 2010
			* slightly modified version by Mike Henke
			* added javaloader
			*/
			
			// generic warning
			warning="jTidy is not installed on your server.";
			
			// jtidy-r938.zip from http://sourceforge.net/projects/jtidy/files
			loadPaths = ArrayNew(1);
			loadPaths[1] = expandPath("/jtidy_cfc/lib/jtidy-r938.jar");
     	 	
			javaloader = createObject("component", "jtidy_cfc.javaloader.JavaLoader").init(loadPaths);														
			jTidy = javaloader.create("org.w3c.tidy.Tidy").init();	
			 
			jTidy.setQuiet(false);
			jTidy.setIndentContent(true);
			jTidy.setSmartIndent(true);
			jTidy.setIndentAttributes(true);
			jTidy.setWraplen(1024);
			//jTidy.setForceOutput(true);
			jTidy.setXHTML(true);
			
			// create the in and out streams for jTidy
			readBuffer = CreateObject("java","java.lang.String").init(parseData).getBytes();
			inP = createobject("java","java.io.ByteArrayInputStream").init(readBuffer);
			
			//ByteArrayOutputStream
			outx = createObject("java", "java.io.ByteArrayOutputStream").init();
			
			// do the parsing
			parsed = jTidy.parse(inP,outx);
			// close the stream
			// outx.close();
			outstr = outx.toString();
			</cfscript>
			<!---<cfset startPos = REFind("<body", outstr)+6 />
			<cfset endPos = REFind("</body>", outstr) />--->
			
			<!--- check if output from jtidy is blank --->
			<cfif outstr eq '' >
				<cfset warning = "output from jtidy empty" />
				<cfthrow />
			</cfif>
			
			<!--- ALL XHTML MARKUP --->
			<cfif listFindNoCase(arguments.props,'markup','|')>
				<cfset returnPart['markup'] = outstr />
			</cfif>
			
			<!--- META TAGS --->
			<cfif listFindNoCase(arguments.props,'meta','|')>
				<cfset returnPart['meta'] = [] />
				<cfset aMeta = REMatchNoCase("(<meta[^>]+>)", outstr) />
				
				<cfloop from="1" to="#arrayLen(aMeta)#" index="i">
					<cfset meta = aMeta[i] />
					<cfset metaStruct = ParseHTMLTag(meta).ATTRIBUTES />
					<cfset arrayAppend(returnPart['meta'],metaStruct) />
				</cfloop>
			</cfif>
			
			<!--- BODY TAG CONTENT --->
			<cfif listFindNoCase(arguments.props,'content','|')>
				<cfset returnPart['content'] = REReplaceNoCase(outstr, '.+<body[^>]*>(.+)</body>.+', "\1") />
			</cfif>
			
			<!--- IMAGE SRC ATTRIBUTES RESOLVED --->
			<cfif listFindNoCase(arguments.props,'images','|')>
				<cfset returnPart['images'] = [] />
				<cfset aImages = REMatchNoCase("(<img[^>]+>)", REReplaceNoCase(outstr, '.+<body[^>]*>(.+)</body>.+', "\1")) />
				
				<cfloop from="1" to="#arrayLen(aImages)#" index="i">
					<cfset image = aImages[i] />
					<cfset imageStruct = ParseHTMLTag(image).ATTRIBUTES />
					<cfset arrayAppend(returnPart['images'],imageStruct) />
				</cfloop>
				
			</cfif>
			
			<!--- TITLE OF THE PAGE --->
			<cfif listFindNoCase(arguments.props,'title','|')>
				<cfset returnPart['title'] = REReplaceNoCase(outstr, '.+<title[^>]*>(.+)</title>.+', "\1") />
			</cfif>
			
			<cfif listFindNoCase(arguments.props,'paragraph','|')>
				<cfset returnPart['paragraph'] = REMatchNoCase('<p>(.+)</p>',REReplaceNoCase(outstr, '.+<body[^>]*>(.+)</body>.+', "\1")) />
			</cfif>
			
			<cfif listFindNoCase(arguments.props,'text','|')>
				<cfset returnPart['text'] = removeHTML(returnPart['content']) />
			</cfif>
			
			
			<cfreturn returnPart />
			
			<cfcatch type="a">
				<!--- display and log error message  --->
				<cftrace type="warning" text="jtidy_cfc: #warning#" />
				<!--- displays input data so the application still works --->
				<cfreturn parseData />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cfscript>
/**
* Removes All HTML from a string removing tags, script blocks, style blocks, and replacing special character code.
*
* @param source      String to format. (Required)
* @return Returns a string.
* @author Scott Bennett (scott@coldfusionguy.com)
* @version 1, November 14, 2007
*/
function removeHTML(source){
    
    // Remove all spaces becuase browsers ignore them
    var result = ReReplace(trim(source), "[[:space:]]{2,}", " ","ALL");
    
    // Remove the header
    result = ReReplace(result, "<[[:space:]]*head.*?>.*?</head>","", "ALL");
    
    // remove all scripts
    result = ReReplace(result, "<[[:space:]]*script.*?>.*?</script>","", "ALL");
    
    // remove all styles
    result = ReReplace(result, "<[[:space:]]*style.*?>.*?</style>","", "ALL");
    
    // insert tabs in spaces of <td> tags
    result = ReReplace(result, "<[[:space:]]*td.*?>","    ", "ALL");
    
    // insert line breaks in places of <BR> and <LI> tags
    result = ReReplace(result, "<[[:space:]]*br[[:space:]]*>",chr(13), "ALL");
    result = ReReplace(result, "<[[:space:]]*li[[:space:]]*>",chr(13), "ALL");
    
    // insert line paragraphs (double line breaks) in place
    // if <P>, <DIV> and <TR> tags
    result = ReReplace(result, "<[[:space:]]*div.*?>",chr(13), "ALL");
    result = ReReplace(result, "<[[:space:]]*tr.*?>",chr(13), "ALL");
    result = ReReplace(result, "<[[:space:]]*p.*?>",chr(13), "ALL");
    
    // Remove remaining tags like <a>, links, images,
    // comments etc - anything thats enclosed inside < >
    result = ReReplace(result, "<.*?>","", "ALL");
    
    // replace special characters:
    result = ReReplace(result, "&nbsp;"," ", "ALL");
    result = ReReplace(result, "&bull;"," * ", "ALL");
    result = ReReplace(result, "&lsaquo;","<", "ALL");
    result = ReReplace(result, "&rsaquo;",">", "ALL");
    result = ReReplace(result, "&trade;","(tm)", "ALL");
    result = ReReplace(result, "&frasl;","/", "ALL");
    result = ReReplace(result, "&lt;","<", "ALL");
    result = ReReplace(result, "&gt;",">", "ALL");
    result = ReReplace(result, "&copy;","(c)", "ALL");
    result = ReReplace(result, "&reg;","(r)", "ALL");
    
    // Remove all others. More special character conversions
    // can be added above if needed
    result = ReReplace(result, "&(.{2,6});", "", "ALL");
    
    // Thats it.
    return result;

}
</cfscript>
	<cffunction
			name="ParseHTMLTag"
			access="public"
			returntype="struct"
			output="false"
			hint="Parses the given HTML tag into a ColdFusion struct.">
		 
			<!--- Define arguments. --->
			<cfargument
				name="HTML"
				type="string"
				required="true"
				hint="The raw HTML for the tag."
				/>
		 
			<!--- Define the local scope. --->
			<cfset var LOCAL = StructNew() />
		 
			<!--- Create a structure for the taget tag data. --->
			<cfset LOCAL.Tag = StructNew() />
		 
			<!--- Store the raw HTML into the tag. --->
			<cfset LOCAL.Tag.HTML = ARGUMENTS.HTML />
		 
			<!--- Set a default name. --->
			<cfset LOCAL.Tag.Name = "" />
		 
			<!---
				Create an structure for the attributes. Each
				attribute will be stored by it's name.
			--->
			<cfset LOCAL.Tag.Attributes = StructNew() />
		 
		 
			<!---
				Create a pattern to find the tag name. While it
				might seem overkill to create a pattern just to
				find the name, I find it easier than dealing with
				token / list delimiters.
			--->
			<cfset LOCAL.NamePattern = CreateObject(
				"java",
				"java.util.regex.Pattern"
				).Compile(
					"^<(\w+)"
					)
				/>
		 
			<!--- Get the matcher for this pattern. --->
			<cfset LOCAL.NameMatcher = LOCAL.NamePattern.Matcher(
				ARGUMENTS.HTML
				) />
		 
			<!---
				Check to see if we found the tag. We know there
				can only be ONE tag name, so using an IF statement
				rather than a conditional loop will help save us
				processing time.
			--->
			<cfif LOCAL.NameMatcher.Find()>
		 
				<!--- Store the tag name in all upper case. --->
				<cfset LOCAL.Tag.Name = UCase(
					LOCAL.NameMatcher.Group( 1 )
					) />
		 
			</cfif>
		 
		 
			<!---
				Now that we have a tag name, let's find the
				attributes of the tag. Remember, attributes may
				or may not have quotes around their values. Also,
				some attributes (while not XHTML compliant) might
				not even have a value associated with it (ex.
				disabled, readonly).
			--->
			<cfset LOCAL.AttributePattern = CreateObject(
				"java",
				"java.util.regex.Pattern"
				).Compile(
					"\s+(\w+)(?:\s*=\s*(""[^""]*""|[^\s>]*))?"
					)
				/>
		 
			<!--- Get the matcher for the attribute pattern. --->
			<cfset LOCAL.AttributeMatcher = LOCAL.AttributePattern.Matcher(
				ARGUMENTS.HTML
				) />
		 
		 
			<!---
				Keep looping over the attributes while we
				have more to match.
			--->
			<cfloop condition="LOCAL.AttributeMatcher.Find()">
		 
				<!--- Grab the attribute name. --->
				<cfset LOCAL.Name = LOCAL.AttributeMatcher.Group( 1 ) />
		 
				<!---
					Create an entry for the attribute in our attributes
					structure. By default, just set it the empty string.
					For attributes that do not have a name, we are just
					going to have to store this empty string.
				--->
				<cfset LOCAL.Tag.Attributes[ LOCAL.Name ] = "" />
		 
				<!---
					Get the attribute value. Save this into a scoped
					variable because this might return a NULL value
					(if the group in our name-value pattern failed
					to match).
				--->
				<cfset LOCAL.Value = LOCAL.AttributeMatcher.Group( 2 ) />
		 
				<!---
					Check to see if we still have the value. If the
					group failed to match then the above would have
					returned NULL and destroyed our variable.
				--->
				<cfif StructKeyExists( LOCAL, "Value" )>
		 
					<!---
						We found the attribute. Now, just remove any
						leading or trailing quotes. This way, our values
						will be consistent if the tag used quoted or
						non-quoted attributes.
					--->
					<cfset LOCAL.Value = LOCAL.Value.ReplaceAll(
						"^""|""$",
						""
						) />
		 
					<!---
						Store the value into the attribute entry back
						into our attributes structure (overwriting the
						default empty string).
					--->
					<cfset LOCAL.Tag.Attributes[ LOCAL.Name ] = LOCAL.Value />
		 
				</cfif>
		 
			</cfloop>
		 
		 
			<!--- Return the tag. --->
			<cfreturn LOCAL.Tag />
		</cffunction>
</cfcomponent>
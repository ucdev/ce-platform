<cfcomponent displayname="UDF">

	<cffunction name="init" access="public" output="no" returntype="_com.UDF">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="nameCase" access="public" returntype="string" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfset arguments.name = ucase(arguments.name)>
		<cfreturn reReplace(arguments.name,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
	</cffunction>
	<cffunction name="QueryAppend" access="public" returntype="void" output="false"
		hint="This takes two queries and appends the second one to the first one. This actually updates the first query and does not return anything.">
		
		<!--- Define arguments. --->
		<cfargument name="QueryOne" type="query" required="true" />
		<cfargument name="QueryTwo" type="query" required="true" />
		
		<!--- Define the local scope. --->
		<cfset var LOCAL = StructNew() />
		
		<!--- Get the column list (as an array for faster access. --->
		<cfset LOCAL.Columns = ListToArray( ARGUMENTS.QueryTwo.ColumnList ) />
		
		
		<!--- Loop over the second query. --->
		<cfloop query="ARGUMENTS.QueryTwo">
		
		<!--- Add a row to the first query. --->
		<cfset QueryAddRow( ARGUMENTS.QueryOne ) />
		
		<!--- Loop over the columns. --->
		<cfloop index="LOCAL.Column" from="1" to="#ArrayLen( LOCAL.Columns )#" step="1">
		
		<!--- Get the column name for easy access. --->
		<cfset LOCAL.ColumnName = LOCAL.Columns[ LOCAL.Column ] />
		
		<!--- Set the column value in the newly created row. --->
		<cfset ARGUMENTS.QueryOne[ LOCAL.ColumnName ][ ARGUMENTS.QueryOne.RecordCount ] = ARGUMENTS.QueryTwo[ LOCAL.ColumnName ][ ARGUMENTS.QueryTwo.CurrentRow ] />
		
		</cfloop>
		
		</cfloop>
		
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
	<cfscript>
	/**
	* This function takes URLs in a text string and turns them into links.
	* Version 2 by Lucas Sherwood, lucas@thebitbucket.net.
	* Version 3 Updated to allow for ;
	*
	* @param string      Text to parse. (Required)
	* @param target      Optional target for links. Defaults to "". (Optional)
	* @param paragraph      Optionally add paragraphFormat to returned string. (Optional)
	* @return Returns a string.
	* @author Joel Mueller (lucas@thebitbucket.netjmueller@swiftk.com)
	* @version 3, August 11, 2004
	*/
	function ActivateURL(string) {
		var nextMatch = 1;
		var objMatch = "";
		var outstring = "";
		var thisURL = "";
		var thisLink = "";
		var    target = IIf(arrayLen(arguments) gte 2, "arguments[2]", DE(""));
		var paragraph = IIf(arrayLen(arguments) gte 3, "arguments[3]", DE("false"));
		
		do {
			objMatch = REFindNoCase("(((https?:|ftp:|gopher:)\/\/)|(www\.|ftp\.))[-[:alnum:]\?%,\.\/&##!;@:=\+~_]+[A-Za-z0-9\/]", string, nextMatch, true);
			if (objMatch.pos[1] GT nextMatch OR objMatch.pos[1] EQ nextMatch) {
				outString = outString & Mid(String, nextMatch, objMatch.pos[1] - nextMatch);
			} else {
				outString = outString & Mid(String, nextMatch, Len(string));
			}
			nextMatch = objMatch.pos[1] + objMatch.len[1];
			if (ArrayLen(objMatch.pos) GT 1) {
				// If the preceding character is an @, assume this is an e-mail address
				// (for addresses like admin@ftp.cdrom.com)
				if (Compare(Mid(String, Max(objMatch.pos[1] - 1, 1), 1), "@") NEQ 0) {
					thisURL = Mid(String, objMatch.pos[1], objMatch.len[1]);
					thisLink = "<A HREF=""";
					switch (LCase(Mid(String, objMatch.pos[2], objMatch.len[2]))) {
						case "www.": {
							thisLink = thisLink & "http://";
							break;
						}
						case "ftp.": {
							thisLink = thisLink & "ftp://";
							break;
						}
					}
					thisLink = thisLink & thisURL & """";
					if (Len(Target) GT 0) {
						thisLink = thisLink & " TARGET=""" & Target & """";
					}
					thisLink = thisLink & ">" & thisURL & "</A>";
					outString = outString & thisLink;
					// String = Replace(String, thisURL, thisLink);
					// nextMatch = nextMatch + Len(thisURL);
				} else {
					outString = outString & Mid(String, objMatch.pos[1], objMatch.len[1]);
				}
			}
		} while (nextMatch GT 0);
			
		// Now turn e-mail addresses into mailto: links.
		outString = REReplace(outString, "([[:alnum:]_\.\-]+@([[:alnum:]_\.\-]+\.)+[[:alpha:]]{2,4})", "<A HREF=""mailto:\1"">\1</A>", "ALL");
			
		if (paragraph) {
			outString = ParagraphFormat(outString);
		}
		return outString;
	}
	
	function friendlyUrl(title) {
		title = replaceNoCase(title,"&amp;","and","all"); //replace &amp;
		title = replaceNoCase(title,"&","and","all"); //replace &
		title = replaceNoCase(title,"'","","all"); //remove apostrophe
		title = reReplaceNoCase(trim(title),"[^a-zA-Z]","-","ALL");
		title = reReplaceNoCase(title,"[\-\-]+","-","all");
		//Remove trailing dashes
		if(right(title,1) eq "-") {
			title = left(title,len(title) - 1);
		}
		if(left(title,1) eq "-") {
			title = right(title,len(title) - 1);
		}    
		return lcase(title);
	}
	</cfscript>
	
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

	<cfscript>
	function stripAllBut(str,strip) {
		var badList = "\";
		var okList = "\\";
		var bCS = true;
	
		if(arrayLen(arguments) gte 3) bCS = arguments[3];
	
		strip = replaceList(strip,badList,okList);
		
		if(bCS) return rereplace(str,"[^#strip#]","","all");
		else return rereplaceNoCase(str,"[^#strip#]","","all");
	}
	function getExtension(name) { 
		if(find(".",name)) return listLast(name,".");
		else return "";
	}
	</cfscript>
    
    <cffunction name="getRandomString" hint="Generates random string." access="public" output="false" returntype="string">
    	<cfargument name="case" type="string" default="mixed" hint="Whether upper, lower or mixed" />
        <cfargument name="format" type="string" default="alphanumeric" hint="Whether to generate numeric, string, alphanumeric or special (includes alphanumeric and special characters such as ! @ & etc)" />
        <cfargument name="invalidCharacters" type="string" default="" hint="List of invalid characters which will be excluded from the key. This overrides the default list" />
        <cfargument name="length" type="numeric" default="8" hint="The length of the key to generate" />
        <cfargument name="numericPrefix" type="numeric" default="0" hint="Number of random digits to start the key with (the rest of the key will be whatever the 'format' is)" />
        <cfargument name="numericSuffix" type="numeric" default="0" hint="Number of random digits to end the key with (the rest of the key will be whatever the 'format' is)" />
        <cfargument name="fixedPrefix" type="string" default="" hint="A prefix prepended to the generated key. The length of which is subtracted from the 'length' argument" />
        <cfargument name="fixedSuffix" type="string" default="" hint="A suffix appended to the generated key. The length of which is subtracted from the 'length' argument" />
        <cfargument name="specialChars" type="string" default="" hint="List of special chars to help generate key from. Overrides the default 'characterMap.special' list" />
        <cfargument name="debug" type="boolean" default="false" hint="Returns cfcatch information in the event of an error. Try turning on if function returns no value." />
    
        <cfscript>        
			var i = 0;
			var key = "";
			var keyCase = arguments.case;
			var keyLength = arguments.length;
			var uniqueChar = "";
			var invalidChars = "o,i,l,s,O,I,L,S";    //Possibly confusing characters we will remove
			var characterMap = structNew();
			var characterLib = "";
			var libLength = 0;
			
			try
			{
				
				characterMap.numeric = "0,1,2,3,4,5,6,7,8,9";
				characterMap.stringLower = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
				characterMap.stringUpper = UCase(characterMap.stringLower);
				characterMap.stringCombined = listAppend(characterMap.stringLower, characterMap.stringUpper);
							
				if (len(trim(arguments.specialChars)))
					characterMap.special = arguments.specialChars;
				else
					characterMap.special = "!,@,##,$,%,^,&,*,(,),_,-,=,+,/,\,[,],{,},<,>,~";
	
				switch (arguments.format) {
					case "numeric":
						characterLib = characterMap.numeric;            
						break;
						
					case "string":
						if (keyCase EQ "upper")
						{
							characterLib = characterMap.stringUpper;
						}                
						else if (keyCase EQ "lower")
						{
							characterLib = characterMap.stringLower;
						}                
						else if (keyCase EQ "mixed")
						{
							characterLib = characterMap.stringCombined;
						}
						break;
						
					case "alphanumeric":
						invalidChars = invalidChars.concat(",0,1,5");        //Possibly confusing chars removed
						if (keyCase EQ "upper")
						{
							characterLib = listAppend(characterMap.numeric, characterMap.stringUpper);
						}
						else if (keyCase EQ "lower")
						{
							characterLib = listAppend(characterMap.numeric, characterMap.stringLower);
						}                
						else if (keyCase EQ "mixed")
						{
							characterLib = listAppend(characterMap.numeric, characterMap.stringCombined);
						}
						break;
						
					case "special":
						invalidChars = invalidChars.concat(",0,1,5");        //Possibly confusing chars removed
						if (keyCase EQ "upper")
						{
							characterLib = listAppend(listAppend(characterMap.numeric, characterMap.stringUpper), characterMap.special);
						}
						else if (keyCase EQ "lower")
						{
							characterLib = listAppend(listAppend(characterMap.numeric, characterMap.stringLower), characterMap.special);
						}                    
						else if (keyCase EQ "mixed")
						{
							characterLib = listAppend(listAppend(characterMap.numeric, characterMap.stringCombined), characterMap.special);
						}
						break;
				}
		
				if (len(trim(arguments.invalidCharacters)))
					invalidChars = arguments.invalidCharacters;
		
				if (len(trim(arguments.fixedPrefix))) {
					key = arguments.fixedPrefix;
					keyLength = keyLength - len(trim(arguments.fixedPrefix));
				}
				
				if (len(trim(arguments.fixedSuffix))) {
					keyLength = keyLength - len(trim(arguments.fixedSuffix));
				}
			
				libLength = listLen(characterLib);
		
				for (i = 1;i LTE keyLength;i=i+1) {
					do {
						if (arguments.numericPrefix GT 0 AND i LTE arguments.numericPrefix) {
							uniqueChar = listGetAt(characterMap.numeric, randRange(1, listLen(characterMap.numeric)));
						}
						else if (arguments.numericSuffix GT 0 AND keyLength-i LT arguments.numericSuffix) {
							uniqueChar = randRange(characterMap.numeric, randRange(1, listLen(characterMap.numeric)));
						}
						else {
							uniqueChar = listGetAt(characterLib, randRange(1, libLength));
						}
					}
					while (listFind(invalidChars, uniqueChar));                
					key = key.concat(uniqueChar);
				}
				
				if (len(trim(arguments.fixedSuffix)))
					key = key.concat(trim(arguments.fixedSuffix));
	
			}
			catch (Any e) {
				if (arguments.debug)
					key = e.message & " " & e.detail;
				else
					key = "";
			}
	
			return key;
    	</cfscript>
    </cffunction>
    
    <cfscript>
	function isEmail(str) {
    return (REFindNoCase("^['_a-z0-9-\+]+(\.['_a-z0-9-\+]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|asia|biz|cat|coop|info|museum|name|jobs|post|pro|tel|travel|mobi))$",
		arguments.str) AND len(listGetAt(arguments.str, 1, "@")) LTE 64 AND
		len(listGetAt(arguments.str, 2, "@")) LTE 255) IS 1;
		}
	</cfscript>
	
    <cffunction name="QueryToCSV" access="Public" returntype="string" output="false" hint="I take a query and convert it to a comma separated value string.">
        <cfargument name="Query" type="query" required="true" hint="I am the query being converted to CSV." />
        <cfargument name="Fields" type="string" required="true" hint="I am the list of query fields to be used when creating the CSV value." />
        <cfargument name="CreateHeaderRow" type="boolean" required="false" default="true" hint="I flag whether or not to create a row of header values." />
        <cfargument name="Delimiter" type="string" required="false" default="," hint="I am the field delimiter in the CSV value." />
         
        <!--- Define the local scope. --->
        <cfset var LOCAL = {} />
         
        <!---
        First, we want to set up a column index so that we can
        iterate over the column names faster than if we used a
        standard list loop on the passed-in list.
        --->
        <cfset LOCAL.ColumnNames = {} />
         
        <!---
        Loop over column names and index them numerically. We
        are going to be treating this struct almost as if it
        were an array. The reason we are doing this is that
        look-up times on a table are a bit faster than look
        up times on an array (or so I have been told).
        --->
        <cfloop index="LOCAL.ColumnName" list="#ARGUMENTS.Fields#" delimiters=",">
            <!--- Store the current column name. --->
            <cfset LOCAL.ColumnNames[ StructCount( LOCAL.ColumnNames ) + 1 ] = Trim( LOCAL.ColumnName ) />
        </cfloop>
         
        <!--- Store the column count. --->
        <cfset LOCAL.ColumnCount = StructCount( LOCAL.ColumnNames ) />
         
        <!---
        Now that we have our index in place, let's create
        a string buffer to help us build the CSV value more
        effiently.
        --->
        <cfset LOCAL.Buffer = CreateObject( "java", "java.lang.StringBuffer" ).Init() />
     
        <!--- Create a short hand for the new line characters. --->
        <cfset LOCAL.NewLine = (Chr( 13 ) & Chr( 10 )) />
     
        <!--- Check to see if we need to add a header row. --->
        <cfif ARGUMENTS.CreateHeaderRow>
            <!--- Loop over the column names. --->
            <cfloop index="LOCAL.ColumnIndex" from="1" to="#LOCAL.ColumnCount#" step="1">
                <!--- Append the field name. --->
                <cfset LOCAL.Buffer.Append(JavaCast("string","""#LOCAL.ColumnNames[ LOCAL.ColumnIndex ]#""")) />
                 
                <!--- Check to see which delimiter we need to add: field or line. --->
                <cfif (LOCAL.ColumnIndex LT LOCAL.ColumnCount)>
                    <!--- Field delimiter. --->
                    <cfset LOCAL.Buffer.Append(JavaCast( "string", ARGUMENTS.Delimiter )) />
                <cfelse>
                    <!--- Line delimiter. --->
                    <cfset LOCAL.Buffer.Append(JavaCast( "string", LOCAL.NewLine )) />
                </cfif>
            </cfloop>
        </cfif>
     
        <!---
        Now that we have dealt with any header value, let's
        convert the query body to CSV. When doing this, we are
        going to qualify each field value. This is done be
        default since it will be much faster than actually
        checking to see if a field needs to be qualified.
        --->
     
        <!--- Loop over the query. --->
        <cfloop query="ARGUMENTS.Query">
            <!--- Loop over the columns. --->
            <cfloop index="LOCAL.ColumnIndex" from="1" to="#LOCAL.ColumnCount#" step="1">
                <!--- Append the field value. --->
                <cfset LOCAL.Buffer.Append(JavaCast("string","""#ARGUMENTS.Query[ LOCAL.ColumnNames[ LOCAL.ColumnIndex ] ][ ARGUMENTS.Query.CurrentRow ]#""")) />
     
                <!--- Check to see which delimiter we need to add: field or line. --->
                <cfif (LOCAL.ColumnIndex LT LOCAL.ColumnCount)>
                    <!--- Field delimiter. --->
                    <cfset LOCAL.Buffer.Append(JavaCast( "string", ARGUMENTS.Delimiter )) />
                <cfelse>
                    <!--- Line delimiter. --->
                    <cfset LOCAL.Buffer.Append(JavaCast( "string", LOCAL.NewLine )) />
                </cfif>
            </cfloop>
        </cfloop>
     
        <!--- Return the CSV value. --->
        <cfreturn LOCAL.Buffer.ToString() />
    </cffunction>
    
	<cfscript>
	/**
	* Returns True if the date provided in the first argument lies between the two dates in the second and third arguments.
	*
	* @param dateObj      CF Date Object you want to test.
	* @param dateObj1      CF Date Object for the starting date.
	* @param dateObj2      CF Date Object for the ending date.
	* @return Returns a Boolean.
	* @author Bill King (bking@hostworks.com)
	* @version 1, November 29, 2001
	*/
	function IsDateBetween(dateObj, dateCompared1, dateCompared2)
	{
	return YesNoFormat((DateCompare(dateObj, dateCompared1) gt -1) AND (DateCompare(dateObj, dateCompared2) lt 1));
	}
	</cfscript>
	
	<cfscript>
	 /**
	 * Parses a Url and returns a struct with keys defining the information in the Uri.
	 * 
	 * @param sURL 	 String to parse. (Required)
	 * @return Returns a struct. 
	 * @author Dan G. Switzer, II (&#100;&#115;&#119;&#105;&#116;&#122;&#101;&#114;&#64;&#112;&#101;&#110;&#103;&#111;&#119;&#111;&#114;&#107;&#115;&#46;&#99;&#111;&#109;) 
	 * @version 1, January 10, 2007 
	 */
	function parseUrl(sUrl){
		// var to hold the final structure
		var stUrlInfo = structNew();
		// vars for use in the loop, so we don't have to evaluate lists and arrays more than once
		var i = 1;
		var sKeyPair = "";
		var sKey = "";
		var sValue = "";
		var aQSPairs = "";
		var sPath = "";
		/*
			from: http://www.ietf.org/rfc/rfc2396.txt
	
			^((([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*)))?
			 123            4  5          6       7  8        9 A
	
				scheme    = $3
				authority = $5
				path      = $6
				query     = $8
				fragment  = $10 (A)
		*/
		var sUriRegEx = "^(([^:/?##]+):)?(//([^/?##]*))?([^?##]*)(\?([^##]*))?(##(.*))?";
		/*
			separates the authority into user info, domain and port
	
			^((([^@:]+)(:([^@]+))?@)?([^:]*)?(:(.*)))?
			 123       4 5           6       7 8
	
				username  = $3
				password  = $5
				domain    = $6
				port      = $8
		*/
		var sAuthRegEx = "^(([^@:]+)(:([^@]+))?@)?([^:]*)?(:(.*))?";
		/*
			separates the path into segments & parameters
	
			((/?[^;/]+)(;([^/]+))?)
			12         3 4
	
				segment     = $1
				path        = $2
				parameters  = $4
		*/
		var sSegRegEx = "(/?[^;/]+)(;([^/]+))?";
	
		// parse the url looking for info
		var stUriInfo = reFindNoCase(sUriRegEx, sUrl, 1, true);
		// this is for the authority section
		var stAuthInfo = "";
		// this is for the segments in the path
		var stSegInfo = "";
	
		// create empty keys
		stUrlInfo["scheme"] = "";
		stUrlInfo["authority"] = "";
		stUrlInfo["path"] = "";
		stUrlInfo["directory"] = "";
		stUrlInfo["file"] = "";
		stUrlInfo["query"] = "";
		stUrlInfo["fragment"] = "";
		stUrlInfo["domain"] = "";
		stUrlInfo["port"] = "";
		stUrlInfo["username"] = "";
		stUrlInfo["password"] = "";
		stUrlInfo["params"] = structNew();
	
		// get the scheme
		if( stUriInfo.len[3] gt 0 ) stUrlInfo["scheme"] = mid(sUrl, stUriInfo.pos[3], stUriInfo.len[3]);
		// get the authority
		if( stUriInfo.len[5] gt 0 ) stUrlInfo["authority"] = mid(sUrl, stUriInfo.pos[5], stUriInfo.len[5]);
		// get the path
		if( stUriInfo.len[6] gt 0 ) stUrlInfo["path"] = mid(sUrl, stUriInfo.pos[6], stUriInfo.len[6]);
		// get the path
		if( stUriInfo.len[8] gt 0 ) stUrlInfo["query"] = mid(sUrl, stUriInfo.pos[8], stUriInfo.len[8]);
		// get the fragment
		if( stUriInfo.len[10] gt 0 ) stUrlInfo["fragment"] = mid(sUrl, stUriInfo.pos[10], stUriInfo.len[10]);
	
		// break authority into user info, domain and ports
		if( len(stUrlInfo["authority"]) gt 0 ){
			// parse the authority looking for info
			stAuthInfo = reFindNoCase(sAuthRegEx, stUrlInfo["authority"], 1, true);
	
			// get the domain
			if( stAuthInfo.len[6] gt 0 ) stUrlInfo["domain"] = mid(stUrlInfo["authority"], stAuthInfo.pos[6], stAuthInfo.len[6]);
			// get the port
			if( stAuthInfo.len[8] gt 0 ) stUrlInfo["port"] = mid(stUrlInfo["authority"], stAuthInfo.pos[8], stAuthInfo.len[8]);
			// get the username
			if( stAuthInfo.len[3] gt 0 ) stUrlInfo["username"] = mid(stUrlInfo["authority"], stAuthInfo.pos[3], stAuthInfo.len[3]);
			// get the password
			if( stAuthInfo.len[5] gt 0 ) stUrlInfo["password"] = mid(stUrlInfo["authority"], stAuthInfo.pos[5], stAuthInfo.len[5]);
		}
	
		// the query string in struct form
		stUrlInfo["params"]["segment"] = structNew();
	
		// if the path contains any parameters, we need to parse them out
		if( find(";", stUrlInfo["path"]) gt 0 ){
			// this is for the segments in the path
			stSegInfo = reFindNoCase(sSegRegEx, stUrlInfo["path"], 1, true);
	
			// loop through all the segments and build the strings
			while( stSegInfo.pos[1] gt 0 ){
				// build the path, excluding parameters
				sPath = sPath & mid(stUrlInfo["path"], stSegInfo.pos[2], stSegInfo.len[2]);
	
				// if there are some parameters in this segment, add them to the struct
				if( stSegInfo.len[4] gt 0 ){
	
					// put the parameters into an array for easier looping
					aQSPairs = listToArray(mid(stUrlInfo["path"], stSegInfo.pos[4], stSegInfo.len[4]), ";");
	
					// now, loop over the array and build the struct
					for( i=1; i lte arrayLen(aQSPairs); i=i+1 ){
						sKeyPair = aQSPairs[i]; // current pair
						sKey = listFirst(sKeyPair, "="); // current key
						// make sure there are 2 keys
						if( listLen(sKeyPair, "=") gt 1){
							sValue = urlDecode(listLast(sKeyPair, "=")); // current value
						} else {
							sValue = ""; // set blank value
						}
						// check if key already added to struct
						if( structKeyExists(stUrlInfo["params"]["segment"], sKey) ) stUrlInfo["params"]["segment"][sKey] = listAppend(stUrlInfo["params"]["segment"][sKey], sValue); // add value to list
						else structInsert(stUrlInfo["params"]["segment"], sKey, sValue); // add new key/value pair
					}
				}
	
				// get the ending position
				i = stSegInfo.pos[1] + stSegInfo.len[1];
	
				// get the next segment
				stSegInfo = reFindNoCase(sSegRegEx, stUrlInfo["path"], i, true);
			}
	
		} else {
			// set the current path
			sPath = stUrlInfo["path"];
		}
	
		// get the file name
		stUrlInfo["file"] = getFileFromPath(sPath);
		// get the directory path by removing the file name
		if( len(stUrlInfo["file"]) gt 0 ){
			stUrlInfo["directory"] = replace(sPath, stUrlInfo["file"], "", "one");
		} else {
			stUrlInfo["directory"] = sPath;
		}
	
		// the query string in struct form
		stUrlInfo["params"]["url"] = structNew();
	
		// if query info was supplied, break it into a struct
		if( len(stUrlInfo["query"]) gt 0 ){
			// put the query string into an array for easier looping
			aQSPairs = listToArray(stUrlInfo["query"], "&");
	
			// now, loop over the array and build the struct
			for( i=1; i lte arrayLen(aQSPairs); i=i+1 ){
				sKeyPair = aQSPairs[i]; // current pair
				sKey = listFirst(sKeyPair, "="); // current key
				// make sure there are 2 keys
				if( listLen(sKeyPair, "=") gt 1){
					sValue = urlDecode(listLast(sKeyPair, "=")); // current value
				} else {
					sValue = ""; // set blank value
				}
				// check if key already added to struct
				if( structKeyExists(stUrlInfo["params"]["url"], sKey) ) stUrlInfo["params"]["url"][sKey] = listAppend(stUrlInfo["params"]["url"][sKey], sValue); // add value to list
				else structInsert(stUrlInfo["params"]["url"], sKey, sValue); // add new key/value pair
			}
		}
	
		// return the struct
		return stUrlInfo;
	}

	/**
	* Convert the query into a CSV format using Java StringBuffer Class.
	*
	* @param query      The query to convert. (Required)
	* @param headers      A list of headers to use for the first row of the CSV string. Defaults to all the columns. (Optional)
	* @param cols      The columns from the query to transform. Defaults to all the columns. (Optional)
	* @return Returns a string.
	* @author Qasim Rasheed (qasimrasheed@hotmail.com)
	* @version 1, March 23, 2005
	*/
	function QueryToCSV2(query){
		var csv = createobject( 'java', 'java.lang.StringBuffer');
		var i = 1;
		var j = 1;
		var cols = "";
		var headers = "";
		var endOfLine = chr(13) & chr(10);
		if (arraylen(arguments) gte 2) headers = arguments[2];
		if (arraylen(arguments) gte 3) cols = arguments[3];
		if (not len( trim( cols ) ) ) cols = query.columnlist;
		if (not len( trim( headers ) ) ) headers = cols;
		headers = listtoarray( headers );
		cols = listtoarray( cols );
		
		for (i = 1; i lte arraylen( headers ); i = i + 1)
			csv.append( '"' & headers[i] & '",' );
		csv.append( endOfLine );
		
		for (i = 1; i lte query.recordcount; i= i + 1){
			for (j = 1; j lte arraylen( cols ); j=j + 1){
				if (isNumeric( query[cols[j]][i] ) )
					csv.append( query[cols[j]][i] & ',' );
				else
					csv.append( '"' & Application.UDF.StripAllBut(StripHTML(query[cols[j]][i]),"abcdefghijklmnopqrstuvwxyz0123456789/: .'-",false) & '",' );
				
			}
			csv.append( endOfLine );
		}
		return csv.toString();
	}
	</cfscript>
	
	<cffunction name="QueryToStruct" access="public" returntype="any" output="false"
		hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">
	
		<!--- Define arguments. --->
		<cfargument name="Query" type="query" required="true" />
		<cfargument name="Row" type="numeric" required="false" default="0" />
	
		<cfscript>
	
			// Define the local scope.
			var LOCAL = StructNew();
	
			// Determine the indexes that we will need to loop over.
			// To do so, check to see if we are working with a given row,
			// or the whole record set.
			if (ARGUMENTS.Row){
	
				// We are only looping over one row.
				LOCAL.FromIndex = ARGUMENTS.Row;
				LOCAL.ToIndex = ARGUMENTS.Row;
	
			} else {
	
				// We are looping over the entire query.
				LOCAL.FromIndex = 1;
				LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;
	
			}
	
			// Get the list of columns as an array and the column count.
			LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
			LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );
	
			// Create an array to keep all the objects.
			LOCAL.DataArray = ArrayNew( 1 );
	
			// Loop over the rows to create a structure for each row.
			for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
	
				// Create a new structure for this row.
				ArrayAppend( LOCAL.DataArray, StructNew() );
	
				// Get the index of the current data array object.
				LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );
	
				// Loop over the columns to set the structure values.
				for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
	
					// Get the column value.
					LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
	
					// Set column value into the structure.
					LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
	
				}
	
			}
	
	
			// At this point, we have an array of structure objects that
			// represent the rows in the query over the indexes that we
			// wanted to convert. If we did not want to convert a specific
			// record, return the array. If we wanted to convert a single
			// row, then return the just that STRUCTURE, not the array.
			if (ARGUMENTS.Row){
	
				// Return the first array item.
				return( LOCAL.DataArray[ 1 ] );
	
			} else {
	
				// Return the entire array.
				return( LOCAL.DataArray );
	
			}
	
		</cfscript>
	</cffunction>
	
	<cfscript>
	/**
	* Removes HTML from the string.
	* v2 - Mod by Steve Bryant to find trailing, half done HTML.
	*
	* @param string      String to be modified. (Required)
	* @return Returns a string.
	* @author Raymond Camden (ray@camdenfamily.com)
	* @version 3, July 9, 2008
	*/
	function stripHTML(str) {
	str = reReplaceNoCase(str, "<.*?>","","all");
	//get partial html in front
	str = reReplaceNoCase(str, "^.*?>","");
	//get partial html at end
	str = reReplaceNoCase(str, "<.*$","");
	return str;
	}
	</cfscript>
</cfcomponent>
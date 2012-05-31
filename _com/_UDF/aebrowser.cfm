<!--- 
	NAME:			<cf_aebrowser>
	
	VERSION:		1.06
	
	AUTHOR:			Andrew Dixon (andrew@andrewdixon.co.uk)

	DESCRIPTION:	<cf_aebrowser> is a set of ColdFusion tags that detector the browser
					and operating system and returns a structure containing a variety of
					different variables. 

	ATTRIBUTES:		None

	RETURN:			<cf_aebrowser> returns a structure that contains the following variables

					Browser Type
					------------
					* ISAOL				- default value no; yes if browser is AOL.
					* ISCAMINO			- default value no; yes if browser is Camino (Mac OS browser from Mozilla).
					* ISEXPLORER		- default value no; yes if browser is MS Internet Explorer.
					* ISFIREFOX			- default value no; yes if browser is Firefox (ultra-fast browser from Mozilla - probably the best browser in the world).
					* ISKONQUEROR		- default value no; yes if browser is Konqueror (Linux KDE browser).
					* ISLYNX			- default value no; yes if browser is Lynx (console based browser from *ix).
					* ISMOZILLA			- default value no; yes if browser is Mozilla.
					* ISNAVIGATOR		- default value no; yes if browser is Netscape Navigator.
					* ISOPERA			- default value no; yes if browser is Opera.
					* ISOTHERTYPE		- default value no; yes if browser is unknown browser type.
					* ISREALONEPLAYER	- default value no; yes if browser is Real One Player.
					* ISSAFARI			- default value no; yes if browser is Safari (Mac OS browser from Apple).
					* ISWEBTV			- default value no; yes if browser is WebTV.
					* TYPE				- default value NULL; Set to browser type, for example AOL = Explorer as AOL use a variation of MSIE.
					
					Browser Version
					---------------
					* MAJORVERSION		- default value NULL; Set to the major version number of the browser, single digit integer.
					* MINORVERSION		- default value NULL; Set to the minor version number of the browser, single digit integer.
					* MOZILLAVERSION	- default value NULL; Set to the version number of Mozilla the browser follows.
					* VERSION			- default value NULL; Set to the full version number of the browser.
					
					Browser Support
					---------------
					Note: These values tell you if a feature is supported by the browser, but some features
					like Javascript can be switched off by the user. This tag does not detect if they are
					active.
					* SUPPORTCSS		- default value no; yes if CSS is supported.
					* SUPPORTDHTML		- default value no; yes if DHTML is supported.
					* SUPPORTJAVA		- default value no; yes if Java is supported.
					* SUPPORTJAVASCRIPT	- default value no; yes if Javascript is supported.
					* SUPPORTTRUEDOC	- default value no; yes if Truedoc is supported.
					* SUPPORTXML		- default value no; yes if XML is supported.
					
					OS Type
					-------
					* ISWINDOWS			- default value no; yes if OS is Windows.
					* ISLINUX			- default value no; yes if OS is Linux.
					* ISMAC				- default value no; yes if OS is Mac.
					* ISOS2				- default value no; yes if OS is OS2.
					* ISOTHEROS			- default value no; yes if OS is unknown OS.
					* ISUNIX			- default value no; yes if OS is Unix.
					* ISAMIGAOS			- default value no; yes if OS is Amiga OS.
					* ISFREEBSD			- default value no; yes if OS is FreeBSD.
					* PLATFORM			- default value NULL; Set to the OS name, for example Windows XP or Mac OS X.
					
					Other Values
					------------
					* USER_AGENT		- Set to the USER_AGENT string that the browser has returned.
					
	EXAMPLE USAGE:	To use <cf_aebrowser> simply include the tag in your page and then use
					the return structure. For example:
					
					<cf_aebrowser>
					<cfif browser.ISEXPLORER>
						... do IE code ...
					<cfelseif browser.ISMOZILLA>
						... do Mozilla code ...
					</cfif>

	NOTES:			This version of aebrowser, which is nothing to do with the original, is 
					fully compatible with the original version, however as the original 
					version was encrypted I have fully rewritten it. I have added new variable
					for new browsers, such as Mozilla, Firefox, Safari, etc.
	
	TESTS:			A list of the browser and platform combination that have successfully been tested
					can be found at:-
					
					http://www.andrewdixon.co.uk/aebrowser/testlist.html
					
					If you have different browser/platform combination and it has tested successfully
					please submit it andrew@andrewdixon.co.uk, including the browser name and version
					and the platform name and version, also include the contents of the 
					browser.USER_AGENT variable. 
					
					If you have a browser/platform combination and it didn't test successfully, either
					failed to identify corrector or it caused a CF error please submit the details to
					andrew@andrewdixon.co.uk, including as much detail as possible, in particular the
					browser.USER_AGENT variable.
					
	CHANGE LOG:		29th August 2004 - Create first base version for testing purposes. Version 1.0 Alpha.
					30th August 2004 - Several adjustment after some testing. Add code to get the version
									   number for Safari and Firdbird (old name of Firefox). Changed the
									   code that gets the version of Opera as on NT4 it outputs the version
									   number in a different format.
					30th August 2004 - More testing revealed a problem still with the identification of the
									   version number with Firebird, code change to correct this. Also a 
									   problem with some versions of Netscape in identifying the version
									   number version was after the word Mozilla in the HTTP_USER_AGENT
									   variable, for example "Mozilla/4.07 [en] (WinNT; I)", added code to
									   correct. Also add code to pick up Windows 2000 when the string in
									   the HTTP_USER_AGENT is "Windows 2000" instead of "Windows NT 5.0".
					31st August 2004 - Corrected a bug that was removing the digital after the decimal
									   place in the Safari version number. Added code to fix CF Error with
									   some versions of Netscape 7. Added code to get Camino version number.
									   Added Konqueror to the list of browsers.
					1st Sept 2004 	 - Coldfusion error reported with unknown browsers containing the word
									   Gecko. Added code to fix. Added a cftry around the parser code stop 
									   the generation of any error message from the tag.
					5th Sept 2004	 - Minor change to picking up of minor version number. Moved to 
									   production status after extensive testing.
					13th May 2005	 - Bug fix: newer versions of Safari that no longer have a . in the
									   version number.
									   Bug fix: IE user agent sometimes does not contain a close bracket.
									   Added: Windows CE detection.
--->

<cfprocessingdirective suppresswhitespace="Yes">
	<!--- ********************************************************************************* --->
	<!--- Define the outline structure of the Browser variable with default values			--->
	<!--- ********************************************************************************* --->
	<cfscript>
		// Create New Browser Structure
		browser = StructNew();
		
		// Define Web Browser elements
		StructInsert(browser, "ISAOL", "no");
		StructInsert(browser, "ISCAMINO", "no");
		StructInsert(browser, "ISEXPLORER", "no");
		StructInsert(browser, "ISFIREFOX", "no");
		StructInsert(browser, "ISKONQUEROR", "no");
		StructInsert(browser, "ISLYNX", "no");
		StructInsert(browser, "ISMOZILLA", "no");
		StructInsert(browser, "ISNAVIGATOR", "no");
		StructInsert(browser, "ISOPERA", "no");
		StructInsert(browser, "ISOTHERTYPE", "no");
		StructInsert(browser, "ISREALONEPLAYER", "no");
		StructInsert(browser, "ISSAFARI", "no");
		StructInsert(browser, "ISWEBTV", "no");
		StructInsert(browser, "TYPE", "");
	
		// Define Browser Version
		StructInsert(browser, "MAJORVERSION", "");
		StructInsert(browser, "MINORVERSION", "");
		StructInsert(browser, "MOZILLAVERSION", "");
		StructInsert(browser, "VERSION", "");
	
		// Define OS elements
		StructInsert(browser, "ISWINDOWS", "no");
		StructInsert(browser, "ISLINUX", "no");
		StructInsert(browser, "ISMAC", "no");
		StructInsert(browser, "ISOS2", "no");
		StructInsert(browser, "ISOTHEROS", "no");
		StructInsert(browser, "ISUNIX", "no");
		StructInsert(browser, "ISAMIGAOS", "no");
		StructInsert(browser, "ISFREEBSD", "no");
		StructInsert(browser, "PLATFORM", "no");
		
		// Define Browser Support	
		StructInsert(browser, "SUPPORTCSS", "no");
		StructInsert(browser, "SUPPORTDHTML", "no");
		StructInsert(browser, "SUPPORTJAVA", "no");
		StructInsert(browser, "SUPPORTJAVASCRIPT", "no");
		StructInsert(browser, "SUPPORTTRUEDOC", "no");
		StructInsert(browser, "SUPPORTXML", "no");
		
		// Define other elements
		StructInsert(browser, "USER_AGENT", HTTP_USER_AGENT);
	</cfscript>

	<!--- <cftry> --->

		<!--- ********************************************************************************* --->
	    <!--- Find Browser Type 																--->
		<!--- ********************************************************************************* --->
	    <cfif HTTP_USER_AGENT CONTAINS "Opera">
			<cfset temp = StructUpdate(browser, "ISOPERA", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Opera")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "AOL">
			<cfset temp = StructUpdate(browser, "ISAOL", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Explorer")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "(R1">
			<cfset temp = StructUpdate(browser, "ISREALONEPLAYER", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Real One Player")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Lynx">
			<cfset temp = StructUpdate(browser, "ISLYNX", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Lynx")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Camino">
			<cfset temp = StructUpdate(browser, "ISCAMINO", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Camino")>
	    <cfelseif (HTTP_USER_AGENT CONTAINS "Firefox") OR (HTTP_USER_AGENT CONTAINS "Firebird")>
			<cfset temp = StructUpdate(browser, "ISFIREFOX", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Firefox")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Safari">
			<cfset temp = StructUpdate(browser, "ISSAFARI", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Safari")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Konqueror">
			<cfset temp = StructUpdate(browser, "ISKONQUEROR", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Konqueror")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "WebTV">
			<cfset temp = StructUpdate(browser, "ISWEBTV", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "WebTV")>
	    <cfelseif (HTTP_USER_AGENT CONTAINS "Netscape") OR ((HTTP_USER_AGENT DOES NOT CONTAIN "compatible;") AND (HTTP_USER_AGENT DOES NOT CONTAIN "Gecko"))>
			<cfset temp = StructUpdate(browser, "ISNAVIGATOR", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Navigator")>
		<cfelseif (HTTP_USER_AGENT DOES NOT CONTAIN "Netscape") AND (HTTP_USER_AGENT DOES NOT CONTAIN "like Gecko") AND (HTTP_USER_AGENT CONTAINS "Gecko/")>
			<cfset temp = StructUpdate(browser, "ISMOZILLA", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Mozilla")>
	    <cfelseif (HTTP_USER_AGENT CONTAINS "MSIE")>
			<cfset temp = StructUpdate(browser, "ISEXPLORER", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Explorer")>
	    <cfelse>
			<cfset temp = StructUpdate(browser, "ISOTHERTYPE", "yes")>
			<cfset temp = StructUpdate(browser, "TYPE", "Other")>
	    </cfif>
	
		<!--- ********************************************************************************* --->
	    <!--- Get the Browser Version 															--->
		<!--- ********************************************************************************* --->
	    <cfif browser.ISEXPLORER OR browser.ISREALONEPLAYER OR browser.ISAOL>
		    <cfset bracketOpen = Find("(", HTTP_USER_AGENT, 1)+1>
		    <cfset bracketClose = Find(")", HTTP_USER_AGENT, bracketOpen)>
		    <cfif bracketClose EQ 0>
				<cfset bracketClose = Len(HTTP_USER_AGENT)>
			</cfif>
			<cfset removeCount = bracketClose - bracketOpen>
			<cfset itemList = Mid(HTTP_USER_AGENT, bracketOpen, removeCount)>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(RemoveChars(ListGetAt(itemList, 2, ";"),1,5)))>
	    <cfelseif browser.ISNAVIGATOR>
		    <cfset findNetscape = Find("Netscape/", HTTP_USER_AGENT, 1)+9>
			<cfif findNetscape EQ 9>
			    <cfset findNetscape = Find("Netscape6/", HTTP_USER_AGENT, 1)+10>
				<cfif findNetscape EQ 10>
					<cfset findNetscape = Find("Mozilla/", HTTP_USER_AGENT, 1)+8>
				    <cfset findSpace = Find(" ", HTTP_USER_AGENT, findNetscape)>
				<cfelse>
				    <cfset findSpace = Len(HTTP_USER_AGENT)+1>
				</cfif>
			<cfelse>
			    <cfset findSpace = Find(" ", HTTP_USER_AGENT, findNetscape)>
				<cfif findSpace EQ 0>
					<cfset findSpace = Len(HTTP_USER_AGENT)+1>
				</cfif>
			</cfif>
			<cfset removeCount = findSpace - findNetscape>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findNetscape, removeCount)))>
	    <cfelseif browser.ISMOZILLA>
		    <cfset bracketOpen = Find("(", HTTP_USER_AGENT, 1)+1>
		    <cfset bracketClose = Find(")", HTTP_USER_AGENT, bracketOpen)>
			<cfset removeCount = bracketClose - bracketOpen>
			<cfset itemList = Mid(HTTP_USER_AGENT, bracketOpen, removeCount)>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(RemoveChars(ListGetAt(itemList, 5, ";"),1,4)))>
		<cfelseif browser.ISOPERA>
			<cfif Find("Opera/", HTTP_USER_AGENT, 1) GT 0>
			    <cfset findOpera = Find("Opera/", HTTP_USER_AGENT, 1)+6>
			<cfelse>
			    <cfset findOpera = Find("Opera", HTTP_USER_AGENT, 1)+6>
			</cfif>
		    <cfset findSpace = Find(" ", HTTP_USER_AGENT, findOpera)>
			<cfset removeCount = findSpace - findOpera>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findOpera, removeCount)))>
		<cfelseif browser.ISLYNX>
		    <cfset findLynx = Find("Lynx/", HTTP_USER_AGENT, 1)+5>
		    <cfset findSpace = Find(" ", HTTP_USER_AGENT, findLynx)>
			<cfset removeCount = findSpace - findLynx>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findLynx, removeCount)))>
		<cfelseif browser.ISWEBTV>
		    <cfset findWebTV = Find("WebTV/", HTTP_USER_AGENT, 1)+6>
		    <cfset findSpace = Find(" ", HTTP_USER_AGENT, findWebTV)>
			<cfset removeCount = findSpace - findWebTV>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findWebTV, removeCount)))>
		<cfelseif browser.ISSAFARI>
		    <cfset findSafari = Find("Safari/", HTTP_USER_AGENT, 1)+7>
		    <cfset findEnd = Len(HTTP_USER_AGENT)+1>
			<cfset removeCount = findEnd - findSafari>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findSafari, removeCount)))>
		<cfelseif browser.ISFIREFOX>
		    <cfset findFirefox = Find("Firefox/", HTTP_USER_AGENT, 1)+8>
			<cfif findFireFox EQ 8>
			    <cfset findFirefox = Find("Firebird/", HTTP_USER_AGENT, 1)+9>
			</cfif>
		    <cfset findEnd = Len(HTTP_USER_AGENT)>
			<cfset removeCount = findEnd - findFirefox + 1>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findFirefox, removeCount)))>
		<cfelseif browser.ISCAMINO>
		    <cfset findCamino = Find("Camino/", HTTP_USER_AGENT, 1)+7>
		    <cfset findEnd = Len(HTTP_USER_AGENT)+1>
			<cfset removeCount = findEnd - findCamino>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findCamino, removeCount)))>
		<cfelseif browser.ISKONQUEROR>
		    <cfset findKonqueror = Find("Konqueror/", HTTP_USER_AGENT, 1)+10>
		    <cfset findSemicolon = Find(";", HTTP_USER_AGENT, findKonqueror)>
			<cfset removeCount = findSemicolon - findKonqueror>
			<cfset temp = StructUpdate(browser, "VERSION", Trim(Mid(HTTP_USER_AGENT, findKonqueror, removeCount)))>
		<cfelse>
			<cfset temp = StructUpdate(browser, "VERSION", "")>
	    </cfif>
		
		<!--- Get the major and minor version numbers --->
		<cfif browser.VERSION GT "">
			<cfset decimalPlace = FindNoCase(".", browser.VERSION, 1)>
			<cfif decimalPlace GT 0>
				<cfset temp = StructUpdate(browser, "MAJORVERSION", Mid(browser.VERSION, 1, decimalPlace-1))>
				<cfset temp = StructUpdate(browser, "MINORVERSION", Mid(browser.VERSION, decimalPlace+1, Len(browser.VERSION)-decimalPlace+1))>
			<cfelse>
				<cfset temp = StructUpdate(browser, "MAJORVERSION", browser.VERSION)>
				<cfset temp = StructUpdate(browser, "MINORVERSION", 0)>
			</cfif>
		</cfif>
		
		<!--- Get the version of Mozilla the browser implements --->
		<cfif HTTP_USER_AGENT CONTAINS "Mozilla/">
		    <cfset findMozilla = Find("Mozilla/", HTTP_USER_AGENT, 1)+8>
		    <cfset findSpace = Find(" ", HTTP_USER_AGENT, findMozilla)>
			<cfset removeCount = findSpace - findMozilla>
			<cfset temp = StructUpdate(browser, "MOZILLAVERSION", Trim(Mid(HTTP_USER_AGENT, findMozilla, removeCount)))>
		</cfif>
		
		<!--- ********************************************************************************* --->
	    <!--- Find Operating System																--->
		<!--- ********************************************************************************* --->
	    <cfif (HTTP_USER_AGENT CONTAINS "Windows NT 4.0") OR (HTTP_USER_AGENT CONTAINS "WinNT4.0")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "95">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "98">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "9x">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif  (HTTP_USER_AGENT CONTAINS "Windows 2000") OR ((HTTP_USER_AGENT CONTAINS "Windows NT 5.0") AND NOT (browser.ISNAVIGATOR AND browser.MAJORVERSION LTE 4))>
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif (HTTP_USER_AGENT CONTAINS "Windows NT 5.0") AND (browser.ISNAVIGATOR) AND (browser.MAJORVERSION LTE 4)>
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.1">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows XP">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.2">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows CE">
			<cfset temp = StructUpdate(browser, "PLATFORM", "Windows")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Linux">
			<cfset temp = StructUpdate(browser, "ISLINUX", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "Linux")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "Unix">
			<cfset temp = StructUpdate(browser, "ISUNIX", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "Unix")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "SunOS">
			<cfset temp = StructUpdate(browser, "ISUNIX", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "SunOS")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "HP-UX">
			<cfset temp = StructUpdate(browser, "ISUNIX", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "HP-UX")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "MAC OS X">
			<cfset temp = StructUpdate(browser, "PLATFORM", "MacOS")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "apple" OR HTTP_USER_AGENT CONTAINS "mac">
			<cfset temp = StructUpdate(browser, "PLATFORM", "MacOS")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "AmigaOS">
			<cfset temp = StructUpdate(browser, "ISAMIGAOS", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "AmigaOS")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "FreeBSD">
			<cfset temp = StructUpdate(browser, "ISFREEBSD", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "FreeBSD")>
	    <cfelseif HTTP_USER_AGENT CONTAINS "OS2">
			<cfset temp = StructUpdate(browser, "ISOS2", "yes")>
			<cfset temp = StructUpdate(browser, "PLATFORM", "OS2")>
		<cfelseif HTTP_USER_AGENT CONTAINS "WebTV">
			<cfset temp = StructUpdate(browser, "PLATFORM", "WebTV")>
	    <cfelse>
			<cfset temp = StructUpdate(browser, "PLATFORM", "")>
	    </cfif>
		<cfif browser.PLATFORM CONTAINS "Windows">
			<cfset temp = StructUpdate(browser, "ISWINDOWS", "yes")>
		<cfelseif browser.PLATFORM CONTAINS "Mac">
			<cfset temp = StructUpdate(browser, "ISMAC", "yes")>
		</cfif>
	
		<!--- ********************************************************************************* --->
		<!--- Set the support elements 															--->
		<!--- ********************************************************************************* --->
		<cfif 	((browser.ISEXPLORER OR browser.ISAOL OR browser.ISREALONEPLAYER OR browser.ISOPERA OR browser.ISNAVIGATOR) AND browser.MAJORVERSION GTE 5)
				OR (browser.ISMOZILLA AND browser.MAJORVERSION GTE 1)
				OR (browser.ISCAMINO)
				OR (browser.ISFIREFOX)
				OR (browser.ISSAFARI)>
			<cfset temp = StructUpdate(browser, "SUPPORTCSS", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTDHTML", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTJAVA", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTJAVASCRIPT", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTTRUEDOC", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTXML", "yes")>
		<cfelseif browser.ISNAVIGATOR AND browser.MAJORVERSION EQ 4>
			<cfset temp = StructUpdate(browser, "SUPPORTCSS", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTDHTML", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTJAVA", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTJAVASCRIPT", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTTRUEDOC", "yes")>
		<cfelseif browser.isWebTV>
			<cfset temp = StructUpdate(browser, "SUPPORTCSS", "yes")>
			<cfset temp = StructUpdate(browser, "SUPPORTJAVASCRIPT", "yes")>
		</cfif>
		
		<cfset temp = SetVariable("caller.browser",browser)>
		<!--- <cfcatch>
			<cfset temp = SetVariable("caller.browser",browser)>
		</cfcatch>
	</cftry> --->
</cfprocessingdirective>

<!--- Place functions here that should be globally available in your application. --->
<cfscript>
/**
 * Check if a variable is set and has a value.
 * Mods by RCamden to add support for struct/query
 * 
 * @param varName 	 Variable to check for. (Required)
 * @return Returns a boolean. 
 * @author Fabio Serra (&#102;&#97;&#115;&#101;&#114;&#64;&#102;&#97;&#115;&#101;&#114;&#46;&#110;&#101;&#116;) 
 * @version 1, July 10, 2003 
 */
function isEmpty(varName) {
	var ptr = "";
	
	if(not isDefined(varName)) return true;
	ptr = evaluate(varName);
	
	if(isSimpleValue(ptr)) {
		if(not len(ptr)) return true;
	} else if(isArray(ptr)) {
		if(arrayIsEmpty(ptr)) return true;
	} else if(isStruct(ptr)) {
		if(structIsEmpty(ptr)) return true;
	} else if(isQuery(ptr)) {
		if(not ptr.recordCount) return true;
	}
		
	return false;
}
</cfscript>
<cfscript>
function midLimit(sString,nLimit) {
	var nLength = Len(sString);
	var nPercent = 0;
	var nStart = Round(nLimit * .5);
	var nRemoveCount = (nLength - nLimit);
	var sResult = "";
	
	if(nLength GT 0) {
		nPercent = nLimit / nLength;
	}
	
	if(nLength GT nLimit) {
		sResult = RemoveChars(sString,nStart,nRemoveCount+3);
		sResult = Insert("...",sResult,nStart-1);
	} else {
		sResult = sString;
	}
	
	return sResult;
}
</cfscript>

<cffunction name="avatar">
	<cfargument name="email" required="no" default="">
	<cfargument name="gender" required="no" default="m">
	<cfargument name="size" required="no" default="i">
	<cfargument name="alt_email" required="no" default="">
	
	<cfset var dimensions = 50 />
	<cfif isEmpty(arguments.gender)>
		<cfset arguments.gender = "m" />
	</cfif>
	<cfswitch expression="#arguments.size#">
		<cfcase value="i">
			<cfset dimensions = "50" />
		</cfcase>
		<cfcase value="p">
			<cfset dimensions = "180" />
		</cfcase>
		<cfcase value="p">
			<cfset dimensions = "50" />
		</cfcase>
	</cfswitch>
	
	<cfif isEmpty(arguments.email)>
		<cfset arguments.email = arguments.alt_email />
	</cfif>
	
	<cfset avatarUrl = "/images/no-photo/person_#arguments.gender#_#arguments.size#.png" />
	<!---<cfset avatarUrl = "http://www.gravatar.com/avatar/#lcase(HASH(arguments.email,'MD5'))#?s=#dimensions#&d=identicon" />--->
	
	<cfreturn avatarUrl />
</cffunction>
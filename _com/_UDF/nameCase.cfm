<---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:
		
		http://www.cflib.org
		
	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.
		
	License:
	This code may be used freely. 
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.
	
	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<!---
 Converts an entire string to namecase (JARED RYPKA-HAUER becomes Jared Rypka-Hauer).
 
 @param string 	 String to format. (Required)
 @return Returns a string. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 2, January 1, 2006 
--->
<cffunction name="nameCase" access="public" returntype="string" output="false">
    <cfargument name="name" type="string" required="true" />
    <cfset arguments.name = ucase(arguments.name)>
    <cfreturn reReplace(arguments.name,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
</cffunction>







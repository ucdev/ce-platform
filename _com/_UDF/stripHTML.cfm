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
<cfscript>
/**
* Returns extension defined by all characters following last period.
* v2 by Ray Camden
*
* @param name      File name to use. (Required)
* @return Returns a string.
* @author Alexander Sicular (as867@columbia.edu)
* @version 2, May 9, 2003
*/
function getExtension(name) {
if(find(".",name)) return listLast(name,".");
else return "";
}
</cfscript>
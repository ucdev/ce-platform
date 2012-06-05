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
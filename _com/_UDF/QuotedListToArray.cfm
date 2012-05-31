<cfscript>
/**
* Converts elements in a quoted list to an array.
*
* @param theList      The list to parse. (Required)
* @return Returns an array.
* @author Anthony Cooper (ant@outsrc.co.uk)
* @version 1, January 3, 2007
*/
function quotedListToArray(theList) {
    var items = arrayNew( 1 );
    var i = 1;
    var start = 1;
    var search = structNew();
    var quoteChar = """";

    while(start LT len(theList)) {
        search = reFind('(\#quoteChar#.*?\#quoteChar#)|([0-9\.]*)', theList, start, true );
            
        if (arrayLen(search.LEN) gt 1) {
            items[i] = mid(theList, search.POS[1], (search.LEN[1])); //Extract string
            items[i] = reReplace(items[i], '^\#quoteChar#|\#quoteChar#$', "", "All" );     //Remove double quote character
            start = search.POS[1] + search.LEN[1] + 1;
            i = i + 1;
        }
        else {
            start = Len( theList );
        }
    }
        
    return items;    
}
</cfscript>
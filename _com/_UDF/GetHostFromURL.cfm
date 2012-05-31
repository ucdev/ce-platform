<cfscript>
/**
* Returns the host from a specified URL.
* RE fix for MX, thanks to Tom Lane
*
* @param this_url      URL to parse. (Required)
* @return Returns a string.
* @author Shawn Seley (shawnse@aol.com)
* @version 2, August 23, 2002
*/
function GetHostFromURL(this_url) {
    var first_char = "";
    var re_found_struct = "";
    var num_expressions = 0;
    var num_dots = 0;
    var this_host = "";
    
    this_url = trim(this_url);
    
    first_char = Left(this_url, 1);
    if (Find(first_char, "./")) {
        return ""; // relative URL = no host (ex: "../dir1/filename.html" or "/dir1/filename.html")
    } else if(Find("://", this_url)){
        // absolute URL (ex: "ftp://user:pass@ftp.host.com")
        re_found_struct = REFind("[^@]*@([^/:\?##]+)|([^/:\?##]+)", this_url, Find("://", this_url)+3, "True");
    } else {
        // abbreviated URL (ex: "user:pass@ftp.host.com")
        re_found_struct = REFind("[^@]*@([^/:\?##]+)|([^/:\?##]+)", this_url, 1, "True");
    }
    
    if (re_found_struct.pos[1] GT 0) {
        num_expressions = ArrayLen(re_found_struct.pos);
if(re_found_struct.pos[num_expressions] is 0) num_expressions = num_expressions - 1;
        this_host = Mid(this_url, re_found_struct.pos[num_expressions], re_found_struct.len[num_expressions]);
        num_dots = (Len(this_host) - Len(Replace(this_host, ".", "", "ALL")));;
        if ((not FindOneOf("/@:", this_url)) and (num_dots LT 2)){
            // since this URL doesn't contain any "/" or "@" or ":" characters and since the "host" has fewer than two dots (".")
            // then it is probably actually a file name
            return "";
        }
        return this_host;
    } else {
        return "";
    }
}
</cfscript>
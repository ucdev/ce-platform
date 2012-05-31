<cfscript>
/**
* Detects 40+ browsers.
* 
* @return Returns a string. 
* @author John Bartlett (jbartlett@strangejourney.net) 
* @version 1, September 30, 2005 
*/
function browserDetect() {
    var loc=0;
    var i=0;
    var b=0;
    var tmp="";
    var browserList="";
    var currBrowser="";
    
    // Avant Browser (Not all Avant browsers contain "Avant" in the string)
    loc=findNoCase("Avant",CGI.HTTP_USER_AGENT);
    if(loc GT 0) {
        loc=listFindNoCase(CGI.HTTP_USER_AGENT,"MSIE"," ");
        if(loc GT 0) {
            tmp=listGetAt(CGI.HTTP_USER_AGENT,loc + 1," ");
            return "Avant " & left(tmp,len(tmp) - 1);
        }
    }

    // PocketPC
    if(findNoCase("Windows CE",CGI.HTTP_USER_AGENT)) return "PocketPC";

    // Misc (browser x.x)
    browserList="Acorn Browse,Check&amp;Get,iCab,Netsurf,Opera,Oregano,SIS";
    for (b=1; b lte listLen(BrowserList); b=b+1) {
        currBrowser=listGetAt(browserList,b);
        loc=listFindNoCase(CGI.HTTP_USER_AGENT,currBrowser," ");
        if(loc GT 0) return currBrowser & " " & listGetAt(CGI.HTTP_USER_AGENT,loc + 1," ");
    }

    // Misc (browser/x.x)
    BrowserList="Amaya,AmigaVoyager,Amiga-AWeb,Camino,Chimera,Contiki,cURL,Dillo,DocZilla,edbrowse,Emacs-W3,Epiphany,Firefox,IBrowse,iCab,K-Meleon,Konqueror,Lynx,Mosaic,NetPositive,Netscape,OmniWeb,Opera,Safari,SWB,Sylera,W3CLineMode,w3m,WebTV";
    for (b=1; b LTE ListLen(BrowserList); b=b+1) {
        currBrowser=listGetAt(browserList,b);
        loc=findNoCase(currBrowser,CGI.HTTP_USER_AGENT);
        if(loc GT 0) {
            // Locate Browser version in string
            for(i=1;i lte listLen(CGI.HTTP_USER_AGENT," ");i=i+1) {
                if(lCase(left(listGetAt(CGI.HTTP_USER_AGENT,i," "),len(currBrowser) + 1)) eq "#CurrBrowser#/") return currBrowser & " " & listLast(listGetAt(CGI.HTTP_USER_AGENT,i," "),"/");
            }
        }
    }

    // Misc (browser, no version)
    browserList="BrowseX,ELinks,Links,OffByOne,BlackBerry";
    for(b=1; b lte listLen(BrowserList); b=b+1) {
        currBrowser=listGetAt(browserList,b);
        if(findNoCase(currBrowser,CGI.HTTP_USER_AGENT) gt 0) return currBrowser;
    }

    // Mozila (must be done after Firefox, Netscape, and other Mozila clones)
    loc=findNoCase("Gecko",CGI.HTTP_USER_AGENT);
    if(loc GT 0) {
        // Locate revision number in string
        for(i=1;i lte listLen(CGI.HTTP_USER_AGENT," ");i=i+1) {
            if(lCase(left(listGetAt(CGI.HTTP_USER_AGENT,i," "),3)) eq "rv:") return "Mozilla " & val(listLast(ListGetAt(CGI.HTTP_USER_AGENT,i," "),":"));
        }
    }

    // IE (Must be last due to other browsers "spoofing" it.
    loc=listFindNoCase(CGI.HTTP_USER_AGENT,"MSIE"," ");
    if(Loc GT 0) {
        tmp=listGetAt(CGI.HTTP_USER_AGENT,loc + 1," ");
        return "MSIE " & left(tmp,len(tmp) - 1);
    }

    // Unable to detect browser
    return "Unknown";
}
Request.Browser = browserDetect();
</cfscript>
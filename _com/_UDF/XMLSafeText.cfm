<cffunction name="XmlSafeText" hint="Replaces all characters that would break an xml file." returnType="string" output="false">       
    <cfargument name="txt" hint="String to format" type="string" required="true">
    <cfset var chars = "">
    <cfset var replaced = "">

    <!--- Use XmlFormat function first --->
    <cfset txt = XmlFormat(txt)>
    <!--- Get all other characters to replace. --->
    <cfset chars = REMatch("[^[:ascii:]]",txt)>
    <!--- Loop through characters and do replace. Maintain a list of characters already replaced to avoid duplicate work. --->
    <cfloop index="char" array="#chars#">
        <cfif ListFind(replaced,char) is 0>
            <cfset txt = Replace(txt,char,"&##" & asc(char) & ";","all")>
            <cfset replaced = ListAppend(replaced,char)>
        </cfif>
    </cfloop>

    <cfreturn txt>
</cffunction>
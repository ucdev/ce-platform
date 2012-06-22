<cfoutput>
<script>
var geodata;

<cfif isDefined("geodata")>
geodata = #serializeJSON(geodata)#;
</cfif>
</script>

#javaScriptIncludeTag(bundle="#application.version_token#/ccpd.attendee")#
</cfoutput>
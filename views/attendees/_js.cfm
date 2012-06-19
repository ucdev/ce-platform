<cfoutput>
<script>
var geodata;

<cfif isDefined("geodata")>
geodata = #serializeJSON(geodata)#;
</cfif>
</script>

#javaScriptIncludeTag(bundle="ccpd.attendee")#
</cfoutput>
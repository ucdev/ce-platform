<cfoutput>
<script>
ce.activity.credit_requests.load({
	records:#serializeJson(credit_requests)#
});
</script>
</cfoutput>
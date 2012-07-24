<cfoutput>
<script>
ce.bind("initialize:after", function(options){		
	ce.activity.credit_requests.start({
		records:#serializeJson(credit_requests)#
	});
});
</script>
</cfoutput>
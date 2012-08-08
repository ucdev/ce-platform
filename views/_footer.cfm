	</div> 
	<!-- /container -->
	<script type="text/javascript">
		//SETUP CE
		$(function() {
			ce.user.load(<cfoutput>#serializeJson(userInfo)#</cfoutput>);
		});
	</script>
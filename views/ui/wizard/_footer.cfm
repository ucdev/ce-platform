	</div> <!-- div.current_step_container -->
	<footer>
		<div id="buttons">
			<a id="prev_step_button" class="button">Prev:</a>
			<a id="next_step_button" class="button">Next:</a>
		</div>
	</footer> 

	<script type="text/javascript">
		//SETUP CE
		$(function() {
			ce.user.load(<cfoutput>#serializeJson(userInfo)#</cfoutput>);
		});
	</script>
<script>
<cfoutput>
var nAID = #Attributes.ActivityID#;
</cfoutput>
$(document).ready(function() {
	$("#refresh-link").click(function() {
		$("#stats-container").hide();
		$("#stats-loading").show();
		
		$.ajax({
			url:'/admin/_com/scripts/statFixer.cfc',
			type:'post',
			async:false,
			dataType:'json',
			data:{
				method:'run',
				returnFormat:'plain',
				mode:'manual',
				activityId:nAID
			},
			success:function(data) {
				if(data.STATUS) {
					addMessage(data.STATUSMSG,250,6000,4000);
					updateStats();
				} else {
					$("#stats-loading").hide();
					$("#stats-container").show();
					addError(data.STATUSMSG,250,6000,4000);
				}
			}
		});
	});
});
</script>

<cfoutput>
<h3>Statistics</h3>
<span class="RefreshLink" style="position:relative;"><a href="javascript://" id="refresh-link"><img src="#Application.Settings.RootPath#/_images/icons/refresh.png" style="position: absolute; right: -30px; top: 4px;" /></a></span>
<div id="stats-container">
<table width="100%" cellspacing="1" cellpadding="3" border="0">
	<tr>
		<td width="46%" nowrap="nowrap">Attendees:</td>
		<td width="54%">#ActivityBean.getStatAttendees()#</td>
	</tr>
	<tr>
		<td nowrap="nowrap">MDs:</td>
		<td>#ActivityBean.getStatMD()#</td>
	</tr>
	<tr>
		<td nowrap="nowrap">Non MDs:</td>
		<td>#ActivityBean.getStatNonMD()#</td>
	</tr>
	<tr>
		<td nowrap="nowrap">Supporters:</td>
		<td>#ActivityBean.getStatSupporters()#</td>
	</tr>
	<tr>
		<td nowrap="nowrap">Support Dollars:</td>
		<td>#LSCurrencyFormat(ActivityBean.getStatSuppAmount())#</td>
	</tr>
</table>
</div>
<div id="stats-loading" style="display:none;"><img src="/admin/_images/ajax-loader.gif"/></div>
</cfoutput>
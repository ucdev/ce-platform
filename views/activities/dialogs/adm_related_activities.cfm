<script>
$(document).ready(function() {
	$(".ActivityRow").unbind();
	
	$(".ActivityRow").click(function() {
		var nActivityID = $.Replace(this.id,"Activity","","ALL");
		window.location=sLocation + '?ActivityID=' + nActivityID;
	});
	
	$(".ActivityRow").mouseover(function() {
		$(this).removeClass('ActivityRow');
		$(this).addClass('CurrentActivityRow');
	});
	
	$(".ActivityRow").mouseout(function() {
		$(this).removeClass('CurrentActivityRow');
		$(this).addClass('ActivityRow');
	});
	
	$("#ActivityList").attr({ scrollTop: $(".CurrentActivityRow").position().top-30 });
});
</script>
<cfoutput>
<div class="ActivityLinks">
	<table width="<cfif BrowserDetect() CONTAINS "MSIE">95%<cfelse>100%</cfif>" cellspacing="0" cellpadding="0" border="0" class="ActivityRows">
		<tr id="Activity#Attributes.ParentActivityID#" <cfif Attributes.ParentActivityID EQ Attributes.ActivityID>class="CurrentActivityRow"<cfelse>class="ActivityRow"</cfif>>
			<td width="16" style="text-align:center;" valign="top"><img src="#Application.Settings.RootPath#/_images/icons/book_open.png" border="0" align="absmiddle" /></td>
			<td width="16" style="text-align:center;" valign="top"><img src="#Application.Settings.RootPath#/_images/icons/Status#ParentBean.getStatusID()#.png" border="0" align="absmiddle" /></td>
			<td width="70" style="text-align:center;" valign="top"><strong>#DateFormat(ParentBean.getStartDate(),"mm/dd/yyyy")#</strong></td>
			<td valign="top"><strong>#ParentBean.getTitle()#</strong></td>
		</tr>
	<cfloop query="qSubActivities">
		<tr id="Activity#qSubActivities.ActivityID#" <cfif qSubActivities.ActivityID EQ Attributes.ActivityID>class="CurrentActivityRow"<cfelse>class="ActivityRow"</cfif>>
			<td width="16" style="text-align:center;" valign="top"><img src="#Application.Settings.RootPath#/_images/icons/calendar_view_day.png" border="0" align="absmiddle" /></td>
			<td width="16" style="text-align:center;" valign="top"><img src="#Application.Settings.RootPath#/_images/icons/Status#qSubActivities.StatusID#.png" border="0" align="absmiddle" /></td>
			<td width="70" style="text-align:center;" valign="top">#DateFormat(qSubActivities.StartDate,"mm/dd/yyyy")#</td>
			<td valign="top">#qSubActivities.Title#</td>
		</tr>
	</cfloop>
	</table>
</div>
</cfoutput>
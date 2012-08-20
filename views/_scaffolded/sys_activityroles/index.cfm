<h1>Listing sys_activityroles</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_activityrole", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_activityroles">
		<tr>
			<td>#id#</td>
		<td>#name#</td>
		<td>#description#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


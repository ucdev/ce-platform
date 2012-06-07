<h1>Listing sys_groupings</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_grouping", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity Type ID</th>
		<th>Name</th>
		<th>Aliases</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_groupings">
		<tr>
			<td>#id#</td>
		<td>#ActivityTypeID#</td>
		<td>#Name#</td>
		<td>#Aliases#</td>
		<td>#Created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


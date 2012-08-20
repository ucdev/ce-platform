<h1>Listing sys_states</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_state", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Code</th>
		<th>APAbbrv</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_states">
		<tr>
			<td>#id#</td>
		<td>#name#</td>
		<td>#code#</td>
		<td>#APAbbrv#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


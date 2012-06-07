<h1>Listing sys_statuses</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_status", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_statuses">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#Created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


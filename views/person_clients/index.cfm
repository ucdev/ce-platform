<h1>Listing person_clients</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_client", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person Id</th>
		<th>Client Id</th>
		<th>Client Token</th>
		<th>Revoke Flag</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="person_clients">
		<tr>
			<td>#id#</td>
		<td>#personId#</td>
		<td>#clientId#</td>
		<td>#clientToken#</td>
		<td>#revokeFlag#</td>
		<td>#created#</td>
		<td>#updated#</td>
		<td>#deleted#</td>
		<td>#deletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


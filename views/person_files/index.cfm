<h1>Listing person_files</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_file", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>File ID</th>
		<th>Person ID</th>
		<th>File Group ID</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="person_files">
		<tr>
			<td>#id#</td>
		<td>#FileID#</td>
		<td>#PersonID#</td>
		<td>#FileGroupID#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


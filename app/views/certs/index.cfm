<h1>Listing certs</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New cert", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Title</th>
		<th>Details</th>
		<th>Template</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		<th>Deleted By</th>
		
	</thead>
	<tbody>
		<cfloop query="certs">
		<tr>
			<td>#id#</td>
		<td>#title#</td>
		<td>#details#</td>
		<td>#template#</td>
		<td>#created#</td>
		<td>#createdBy#</td>
		<td>#updated#</td>
		<td>#updatedBy#</td>
		<td>#deleted#</td>
		<td>#deletedFlag#</td>
		<td>#deletedBy#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


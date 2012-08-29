<h1>Listing files</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New file", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>File Name</th>
		<th>File Caption</th>
		<th>File Size</th>
		<th>File Type ID</th>
		<th>Person ID</th>
		<th>Activity ID</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="files">
		<tr>
			<td>#id#</td>
		<td>#FileName#</td>
		<td>#FileCaption#</td>
		<td>#FileSize#</td>
		<td>#FileTypeID#</td>
		<td>#PersonID#</td>
		<td>#ActivityID#</td>
		<td>#Created#</td>
		<td>#CreatedBy#</td>
		<td>#Updated#</td>
		<td>#UpdatedBy#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


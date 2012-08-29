<h1>Listing images</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New image", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Imagetype_id</th>
		<th>Data_key</th>
		<th>Caption</th>
		<th>Filename</th>
		<th>File_ext</th>
		<th>Orig_filename</th>
		<th>Created</th>
		<th>Created_by</th>
		
	</thead>
	<tbody>
		<cfloop query="images">
		<tr>
			<td>#id#</td>
		<td>#imagetype_id#</td>
		<td>#data_key#</td>
		<td>#caption#</td>
		<td>#filename#</td>
		<td>#file_ext#</td>
		<td>#orig_filename#</td>
		<td>#created#</td>
		<td>#created_by#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


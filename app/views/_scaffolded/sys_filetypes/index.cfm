<h1>Listing sys_filetypes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_filetype", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_filetypes">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#Description#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


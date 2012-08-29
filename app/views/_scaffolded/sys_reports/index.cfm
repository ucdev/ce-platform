<h1>Listing sys_reports</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_report", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Title</th>
		<th>Description</th>
		<th>File Name</th>
		<th>Created</th>
		<th>Updated</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_reports">
		<tr>
			<td>#id#</td>
		<td>#Title#</td>
		<td>#Description#</td>
		<td>#FileName#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


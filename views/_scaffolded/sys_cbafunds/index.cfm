<h1>Listing sys_cbafunds</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_cbafund", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_cbafunds">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#Description#</td>
		<td>#Created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


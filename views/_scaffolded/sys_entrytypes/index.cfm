<h1>Listing sys_entrytypes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_entrytype", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Expense Flag</th>
		<th>Description</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_entrytypes">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#ExpenseFlag#</td>
		<td>#Description#</td>
		<td>#Created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


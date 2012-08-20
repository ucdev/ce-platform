<h1>Listing sys_degrees</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_degree", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Abbrev</th>
		<th>Sort</th>
		<th>Profession</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_degrees">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#Abbrev#</td>
		<td>#Sort#</td>
		<td>#Profession#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


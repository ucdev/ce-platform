<h1>Listing sys_countries</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_country", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Code</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_countries">
		<tr>
			<td>#id#</td>
		<td>#name#</td>
		<td>#code#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


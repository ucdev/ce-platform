<h1>Listing sys_assesstypes</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New sys_assesstype", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
		
	</thead>
	<tbody>
		<cfloop query="sys_assesstypes">
		<tr>
			<td>#id#</td>
		<td>#Name#</td>
		<td>#Description#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


<h1>Listing person_degrees</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_degree", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person ID</th>
		<th>Degree ID</th>
		<th>Created</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="person_degrees">
		<tr>
			<td>#id#</td>
		<td>#PersonID#</td>
		<td>#DegreeID#</td>
		<td>#Created#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


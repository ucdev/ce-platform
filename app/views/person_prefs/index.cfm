<h1>Listing person_prefs</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_pref", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person ID</th>
		<th>Email Specialty Flag</th>
		<th>Primary Email Id</th>
		<th>Created At</th>
		<th>Updated At</th>
		
	</thead>
	<tbody>
		<cfloop query="person_prefs">
		<tr>
			<td>#id#</td>
		<td>#PersonID#</td>
		<td>#EmailSpecialtyFlag#</td>
		<td>#PrimaryEmailId#</td>
		<td>#createdAt#</td>
		<td>#updatedAt#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


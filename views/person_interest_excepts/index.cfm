<h1>Listing person_interest_excepts</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New person_interest_except", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person ID</th>
		<th>Activity ID</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="person_interest_excepts">
		<tr>
			<td>#id#</td>
		<td>#PersonID#</td>
		<td>#ActivityID#</td>
		<td>#Created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


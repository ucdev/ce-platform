<h1>Listing degree_credits</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New degree_credit", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Degree Id</th>
		<th>Credit Id</th>
		<th>Sort</th>
		<th>Created</th>
		
	</thead>
	<tbody>
		<cfloop query="degree_credits">
		<tr>
			<td>#id#</td>
		<td>#degreeId#</td>
		<td>#creditId#</td>
		<td>#sort#</td>
		<td>#created#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


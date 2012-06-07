<h1>Listing assessresults</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New assessresult", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Person ID</th>
		<th>Assessment ID</th>
		<th>Result Status ID</th>
		<th>Score</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="assessresults">
		<tr>
			<td>#id#</td>
		<td>#PersonID#</td>
		<td>#AssessmentID#</td>
		<td>#ResultStatusID#</td>
		<td>#Score#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


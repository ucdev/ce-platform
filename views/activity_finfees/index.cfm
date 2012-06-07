<h1>Listing activity_finfees</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_finfee", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Name</th>
		<th>Display Name</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Amount</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_finfees">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#Name#</td>
		<td>#DisplayName#</td>
		<td>#StartDate#</td>
		<td>#EndDate#</td>
		<td>#Amount#</td>
		<td>#Created#</td>
		<td>#CreatedBy#</td>
		<td>#Updated#</td>
		<td>#UpdatedBy#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


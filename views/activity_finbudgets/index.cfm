<h1>Listing activity_finbudgets</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_finbudget", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Description</th>
		<th>Entry Type ID</th>
		<th>Amount</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_finbudgets">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#Description#</td>
		<td>#EntryTypeID#</td>
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


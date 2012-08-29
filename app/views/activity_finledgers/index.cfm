<h1>Listing activity_finledgers</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_finledger", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Entry Date</th>
		<th>Description</th>
		<th>Memo</th>
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
		<cfloop query="activity_finledgers">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#EntryDate#</td>
		<td>#Description#</td>
		<td>#Memo#</td>
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


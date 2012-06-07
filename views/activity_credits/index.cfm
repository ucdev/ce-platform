<h1>Listing activity_credits</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_credit", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Credit ID</th>
		<th>Amount</th>
		<th>Reference No</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_credits">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#CreditID#</td>
		<td>#Amount#</td>
		<td>#ReferenceNo#</td>
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


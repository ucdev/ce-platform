<h1>Listing attendeecredits</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New attendeecredit", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Attendee ID</th>
		<th>Credit ID</th>
		<th>Amount</th>
		<th>Reference No</th>
		<th>Expiration Date</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="attendeecredits">
		<tr>
			<td>#id#</td>
		<td>#AttendeeID#</td>
		<td>#CreditID#</td>
		<td>#Amount#</td>
		<td>#ReferenceNo#</td>
		<td>#ExpirationDate#</td>
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


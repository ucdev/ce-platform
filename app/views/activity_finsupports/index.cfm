<h1>Listing activity_finsupports</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_finsupport", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Supporter ID</th>
		<th>Support Type ID</th>
		<th>Amount</th>
		<th>Contract Num</th>
		<th>Budget Requested</th>
		<th>Budget Due Date</th>
		<th>Budget Sent Date</th>
		<th>Sent Date</th>
		<th>Funds Returned</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_finsupports">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#SupporterID#</td>
		<td>#SupportTypeID#</td>
		<td>#Amount#</td>
		<td>#ContractNum#</td>
		<td>#BudgetRequested#</td>
		<td>#BudgetDueDate#</td>
		<td>#BudgetSentDate#</td>
		<td>#SentDate#</td>
		<td>#FundsReturned#</td>
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


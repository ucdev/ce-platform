<h1>Listing activity_pubcomponents</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_pubcomponent", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Component ID</th>
		<th>Activity ID</th>
		<th>Sort</th>
		<th>Display Name</th>
		<th>Description</th>
		<th>External URL</th>
		<th>Assessment ID</th>
		<th>File ID</th>
		<th>Required Flag</th>
		<th>Created</th>
		<th>Created By</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_pubcomponents">
		<tr>
			<td>#id#</td>
		<td>#ComponentID#</td>
		<td>#ActivityID#</td>
		<td>#Sort#</td>
		<td>#DisplayName#</td>
		<td>#Description#</td>
		<td>#ExternalURL#</td>
		<td>#AssessmentID#</td>
		<td>#FileID#</td>
		<td>#RequiredFlag#</td>
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


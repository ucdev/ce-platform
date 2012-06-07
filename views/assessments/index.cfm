<h1>Listing assessments</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New assessment", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Assess Type ID</th>
		<th>Name</th>
		<th>Description</th>
		<th>Passing Score</th>
		<th>Max Attempts</th>
		<th>Required Flag</th>
		<th>Random Flag</th>
		<th>Comment Flag</th>
		<th>Sort</th>
		<th>Activity ID</th>
		<th>External ID</th>
		<th>Created By</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Updated By</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="assessments">
		<tr>
			<td>#id#</td>
		<td>#AssessTypeID#</td>
		<td>#Name#</td>
		<td>#Description#</td>
		<td>#PassingScore#</td>
		<td>#MaxAttempts#</td>
		<td>#RequiredFlag#</td>
		<td>#RandomFlag#</td>
		<td>#CommentFlag#</td>
		<td>#Sort#</td>
		<td>#ActivityID#</td>
		<td>#ExternalID#</td>
		<td>#CreatedBy#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#UpdatedBy#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


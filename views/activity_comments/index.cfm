<h1>Listing activity_comments</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_comment", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Comment</th>
		<th>Person ID</th>
		<th>Created</th>
		<th>Updated</th>
		<th>Deleted</th>
		<th>Deleted Flag</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_comments">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#Comment#</td>
		<td>#PersonID#</td>
		<td>#Created#</td>
		<td>#Updated#</td>
		<td>#Deleted#</td>
		<td>#DeletedFlag#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


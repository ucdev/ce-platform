<h1>Listing attendee_components</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New attendee_component", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Attendee ID</th>
		<th>Component ID</th>
		<th>Status ID</th>
		<th>Percent Complete</th>
		<th>Test Score</th>
		<th>Like Flag</th>
		<th>Feedback</th>
		<th>Ping Minutes</th>
		<th>Updated</th>
		
	</thead>
	<tbody>
		<cfloop query="attendee_components">
		<tr>
			<td>#id#</td>
		<td>#AttendeeID#</td>
		<td>#ComponentID#</td>
		<td>#StatusID#</td>
		<td>#PercentComplete#</td>
		<td>#TestScore#</td>
		<td>#LikeFlag#</td>
		<td>#Feedback#</td>
		<td>#PingMinutes#</td>
		<td>#Updated#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


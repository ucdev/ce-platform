<h1>Listing activity_applications</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_application", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Received Flag</th>
		<th>Received Date</th>
		<th>Sent Flag</th>
		<th>Sent Date</th>
		<th>Approved Flag</th>
		<th>Approved Date</th>
		<th>Needs Flag</th>
		<th>Needs Date</th>
		<th>Obj Flag</th>
		<th>Obj Date</th>
		<th>Supp Flag</th>
		<th>Supp Date</th>
		<th>Attend Flag</th>
		<th>Attend Date</th>
		<th>CVFlag</th>
		<th>CVDate</th>
		<th>Broch Flag</th>
		<th>Broch Date</th>
		<th>Memb Appr Flag</th>
		<th>Memb Appr Date</th>
		<th>Conflict Flag</th>
		<th>Conflict Date</th>
		<th>Eval Flag</th>
		<th>Eval Date</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_applications">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#ReceivedFlag#</td>
		<td>#ReceivedDate#</td>
		<td>#SentFlag#</td>
		<td>#SentDate#</td>
		<td>#ApprovedFlag#</td>
		<td>#ApprovedDate#</td>
		<td>#NeedsFlag#</td>
		<td>#NeedsDate#</td>
		<td>#ObjFlag#</td>
		<td>#ObjDate#</td>
		<td>#SuppFlag#</td>
		<td>#SuppDate#</td>
		<td>#AttendFlag#</td>
		<td>#AttendDate#</td>
		<td>#CVFlag#</td>
		<td>#CVDate#</td>
		<td>#BrochFlag#</td>
		<td>#BrochDate#</td>
		<td>#MembApprFlag#</td>
		<td>#MembApprDate#</td>
		<td>#ConflictFlag#</td>
		<td>#ConflictDate#</td>
		<td>#EvalFlag#</td>
		<td>#EvalDate#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


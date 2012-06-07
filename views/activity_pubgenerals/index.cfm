<h1>Listing activity_pubgenerals</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New activity_pubgeneral", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		<th>Id</th>
		<th>Activity ID</th>
		<th>Link Name</th>
		<th>Overview</th>
		<th>Keywords</th>
		<th>Objectives</th>
		<th>Goals</th>
		<th>Publish Flag</th>
		<th>Publish Date</th>
		<th>Remove Date</th>
		<th>Payment Flag</th>
		<th>Payment Fee</th>
		<th>Terms Flag</th>
		<th>Terms Text</th>
		<th>Allow Feedback</th>
		<th>Allow Comment Flag</th>
		<th>Comment Approve Flag</th>
		<th>Notify Emails</th>
		<th>Stat Views</th>
		<th>Stat Vote Count</th>
		<th>Stat Vote Value</th>
		<th>Featured Flag</th>
		<th>Ext Host Flag</th>
		<th>Ext Host Link</th>
		<th>Restricted Flag</th>
		<th>Updated</th>
		
	</thead>
	<tbody>
		<cfloop query="activity_pubgenerals">
		<tr>
			<td>#id#</td>
		<td>#ActivityID#</td>
		<td>#LinkName#</td>
		<td>#Overview#</td>
		<td>#Keywords#</td>
		<td>#Objectives#</td>
		<td>#Goals#</td>
		<td>#PublishFlag#</td>
		<td>#PublishDate#</td>
		<td>#RemoveDate#</td>
		<td>#PaymentFlag#</td>
		<td>#PaymentFee#</td>
		<td>#TermsFlag#</td>
		<td>#TermsText#</td>
		<td>#AllowFeedback#</td>
		<td>#AllowCommentFlag#</td>
		<td>#CommentApproveFlag#</td>
		<td>#NotifyEmails#</td>
		<td>#StatViews#</td>
		<td>#StatVoteCount#</td>
		<td>#StatVoteValue#</td>
		<td>#FeaturedFlag#</td>
		<td>#extHostFlag#</td>
		<td>#extHostLink#</td>
		<td>#RestrictedFlag#</td>
		<td>#Updated#</td>
		
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>


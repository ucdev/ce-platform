<h1>Showing activity_pubgeneral</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_pubgeneral.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_pubgeneral.ActivityID#</p>
				
					<p><span>Link Name</span> <br />
						#activity_pubgeneral.LinkName#</p>
				
					<p><span>Overview</span> <br />
						#activity_pubgeneral.Overview#</p>
				
					<p><span>Keywords</span> <br />
						#activity_pubgeneral.Keywords#</p>
				
					<p><span>Objectives</span> <br />
						#activity_pubgeneral.Objectives#</p>
				
					<p><span>Goals</span> <br />
						#activity_pubgeneral.Goals#</p>
				
					<p><span>Publish Flag</span> <br />
						#activity_pubgeneral.PublishFlag#</p>
				
					<p><span>Publish Date</span> <br />
						#activity_pubgeneral.PublishDate#</p>
				
					<p><span>Remove Date</span> <br />
						#activity_pubgeneral.RemoveDate#</p>
				
					<p><span>Payment Flag</span> <br />
						#activity_pubgeneral.PaymentFlag#</p>
				
					<p><span>Payment Fee</span> <br />
						#activity_pubgeneral.PaymentFee#</p>
				
					<p><span>Terms Flag</span> <br />
						#activity_pubgeneral.TermsFlag#</p>
				
					<p><span>Terms Text</span> <br />
						#activity_pubgeneral.TermsText#</p>
				
					<p><span>Allow Feedback</span> <br />
						#activity_pubgeneral.AllowFeedback#</p>
				
					<p><span>Allow Comment Flag</span> <br />
						#activity_pubgeneral.AllowCommentFlag#</p>
				
					<p><span>Comment Approve Flag</span> <br />
						#activity_pubgeneral.CommentApproveFlag#</p>
				
					<p><span>Notify Emails</span> <br />
						#activity_pubgeneral.NotifyEmails#</p>
				
					<p><span>Stat Views</span> <br />
						#activity_pubgeneral.StatViews#</p>
				
					<p><span>Stat Vote Count</span> <br />
						#activity_pubgeneral.StatVoteCount#</p>
				
					<p><span>Stat Vote Value</span> <br />
						#activity_pubgeneral.StatVoteValue#</p>
				
					<p><span>Featured Flag</span> <br />
						#activity_pubgeneral.FeaturedFlag#</p>
				
					<p><span>Ext Host Flag</span> <br />
						#activity_pubgeneral.extHostFlag#</p>
				
					<p><span>Ext Host Link</span> <br />
						#activity_pubgeneral.extHostLink#</p>
				
					<p><span>Restricted Flag</span> <br />
						#activity_pubgeneral.RestrictedFlag#</p>
				
					<p><span>Updated</span> <br />
						#activity_pubgeneral.Updated#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_pubgeneral", action="edit", key=activity_pubgeneral.id)#
</cfoutput>

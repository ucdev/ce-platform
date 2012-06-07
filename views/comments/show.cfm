<h1>Showing comment</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#comment.id#</p>
				
					<p><span>Activity ID</span> <br />
						#comment.ActivityID#</p>
				
					<p><span>Comment</span> <br />
						#comment.Comment#</p>
				
					<p><span>Approve Flag</span> <br />
						#comment.ApproveFlag#</p>
				
					<p><span>Approved By</span> <br />
						#comment.ApprovedBy#</p>
				
					<p><span>Created</span> <br />
						#comment.Created#</p>
				
					<p><span>Created By</span> <br />
						#comment.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#comment.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#comment.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#comment.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#comment.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this comment", action="edit", key=comment.id)#
</cfoutput>

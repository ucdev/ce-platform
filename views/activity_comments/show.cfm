<h1>Showing activity_comment</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_comment.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_comment.ActivityID#</p>
				
					<p><span>Comment</span> <br />
						#activity_comment.Comment#</p>
				
					<p><span>Person ID</span> <br />
						#activity_comment.PersonID#</p>
				
					<p><span>Created</span> <br />
						#activity_comment.Created#</p>
				
					<p><span>Updated</span> <br />
						#activity_comment.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#activity_comment.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_comment.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_comment", action="edit", key=activity_comment.id)#
</cfoutput>

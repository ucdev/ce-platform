<h1>Showing assessment</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#assessment.id#</p>
				
					<p><span>Assess Type ID</span> <br />
						#assessment.AssessTypeID#</p>
				
					<p><span>Name</span> <br />
						#assessment.Name#</p>
				
					<p><span>Description</span> <br />
						#assessment.Description#</p>
				
					<p><span>Passing Score</span> <br />
						#assessment.PassingScore#</p>
				
					<p><span>Max Attempts</span> <br />
						#assessment.MaxAttempts#</p>
				
					<p><span>Required Flag</span> <br />
						#assessment.RequiredFlag#</p>
				
					<p><span>Random Flag</span> <br />
						#assessment.RandomFlag#</p>
				
					<p><span>Comment Flag</span> <br />
						#assessment.CommentFlag#</p>
				
					<p><span>Sort</span> <br />
						#assessment.Sort#</p>
				
					<p><span>Activity ID</span> <br />
						#assessment.ActivityID#</p>
				
					<p><span>External ID</span> <br />
						#assessment.ExternalID#</p>
				
					<p><span>Created By</span> <br />
						#assessment.CreatedBy#</p>
				
					<p><span>Created</span> <br />
						#assessment.Created#</p>
				
					<p><span>Updated</span> <br />
						#assessment.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#assessment.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#assessment.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#assessment.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this assessment", action="edit", key=assessment.id)#
</cfoutput>

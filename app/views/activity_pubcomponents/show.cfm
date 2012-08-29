<h1>Showing activity_pubcomponent</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_pubcomponent.id#</p>
				
					<p><span>Component ID</span> <br />
						#activity_pubcomponent.ComponentID#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_pubcomponent.ActivityID#</p>
				
					<p><span>Sort</span> <br />
						#activity_pubcomponent.Sort#</p>
				
					<p><span>Display Name</span> <br />
						#activity_pubcomponent.DisplayName#</p>
				
					<p><span>Description</span> <br />
						#activity_pubcomponent.Description#</p>
				
					<p><span>External URL</span> <br />
						#activity_pubcomponent.ExternalURL#</p>
				
					<p><span>Assessment ID</span> <br />
						#activity_pubcomponent.AssessmentID#</p>
				
					<p><span>File ID</span> <br />
						#activity_pubcomponent.FileID#</p>
				
					<p><span>Required Flag</span> <br />
						#activity_pubcomponent.RequiredFlag#</p>
				
					<p><span>Created</span> <br />
						#activity_pubcomponent.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_pubcomponent.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_pubcomponent.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_pubcomponent.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_pubcomponent.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_pubcomponent.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_pubcomponent", action="edit", key=activity_pubcomponent.id)#
</cfoutput>

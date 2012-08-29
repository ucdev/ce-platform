<h1>Showing activity_note</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_note.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_note.ActivityID#</p>
				
					<p><span>Body</span> <br />
						#activity_note.Body#</p>
				
					<p><span>Created</span> <br />
						#activity_note.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_note.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_note.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_note.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_note.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_note.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_note", action="edit", key=activity_note.id)#
</cfoutput>

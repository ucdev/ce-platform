<h1>Showing agenda</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#agenda.id#</p>
				
					<p><span>Activity ID</span> <br />
						#agenda.ActivityID#</p>
				
					<p><span>Event Date</span> <br />
						#agenda.EventDate#</p>
				
					<p><span>Start Time</span> <br />
						#agenda.StartTime#</p>
				
					<p><span>End Time</span> <br />
						#agenda.EndTime#</p>
				
					<p><span>Description</span> <br />
						#agenda.Description#</p>
				
					<p><span>Created</span> <br />
						#agenda.Created#</p>
				
					<p><span>Created By</span> <br />
						#agenda.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#agenda.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#agenda.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#agenda.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#agenda.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this agenda", action="edit", key=agenda.id)#
</cfoutput>

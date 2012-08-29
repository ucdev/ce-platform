<h1>Showing activity_committee</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_committee.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_committee.ActivityID#</p>
				
					<p><span>Person ID</span> <br />
						#activity_committee.PersonID#</p>
				
					<p><span>Role ID</span> <br />
						#activity_committee.RoleID#</p>
				
					<p><span>Created</span> <br />
						#activity_committee.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_committee.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_committee.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#activity_committee.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_committee.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_committee", action="edit", key=activity_committee.id)#
</cfoutput>

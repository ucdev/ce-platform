<h1>Showing activity_specialtylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_specialtylms.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_specialtylms.ActivityID#</p>
				
					<p><span>Specialty ID</span> <br />
						#activity_specialtylms.SpecialtyID#</p>
				
					<p><span>Created</span> <br />
						#activity_specialtylms.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_specialtylms.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_specialtylms.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_specialtylms.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_specialtylms.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_specialtylms.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_specialtylms", action="edit", key=activity_specialtylms.id)#
</cfoutput>

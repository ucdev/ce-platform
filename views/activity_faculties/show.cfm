<h1>Showing activity_faculty</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_faculty.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_faculty.ActivityID#</p>
				
					<p><span>Person ID</span> <br />
						#activity_faculty.PersonID#</p>
				
					<p><span>CVFile ID</span> <br />
						#activity_faculty.CVFileID#</p>
				
					<p><span>CVApprove Flag</span> <br />
						#activity_faculty.CVApproveFlag#</p>
				
					<p><span>Disclosure File ID</span> <br />
						#activity_faculty.DisclosureFileID#</p>
				
					<p><span>Disclosure Approve Flag</span> <br />
						#activity_faculty.DisclosureApproveFlag#</p>
				
					<p><span>Role ID</span> <br />
						#activity_faculty.RoleID#</p>
				
					<p><span>Created</span> <br />
						#activity_faculty.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_faculty.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_faculty.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_faculty.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_faculty.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_faculty.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_faculty", action="edit", key=activity_faculty.id)#
</cfoutput>

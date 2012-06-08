<h1>Showing activity_category</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_category.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_category.ActivityID#</p>
				
					<p><span>Category ID</span> <br />
						#activity_category.CategoryID#</p>
				
					<p><span>Created</span> <br />
						#activity_category.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_category.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_category.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_category.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_category.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_category.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_category", action="edit", key=activity_category.id)#
</cfoutput>

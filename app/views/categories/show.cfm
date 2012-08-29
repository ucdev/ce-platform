<h1>Showing category</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#category.id#</p>
				
					<p><span>Name</span> <br />
						#category.Name#</p>
				
					<p><span>Description</span> <br />
						#category.Description#</p>
				
					<p><span>Activity Count</span> <br />
						#category.ActivityCount#</p>
				
					<p><span>Created</span> <br />
						#category.Created#</p>
				
					<p><span>Created By</span> <br />
						#category.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#category.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#category.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#category.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#category.DeletedFlag#</p>
				
					<p><span>Primary_image_id</span> <br />
						#category.primary_image_id#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this category", action="edit", key=category.id)#
</cfoutput>

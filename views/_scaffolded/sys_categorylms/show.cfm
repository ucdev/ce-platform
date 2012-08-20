<h1>Showing sys_categorylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_categorylms.id#</p>
				
					<p><span>Name</span> <br />
						#sys_categorylms.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_categorylms.Description#</p>
				
					<p><span>Parent_category_id</span> <br />
						#sys_categorylms.parent_category_id#</p>
				
					<p><span>Primary_image_id</span> <br />
						#sys_categorylms.primary_image_id#</p>
				
					<p><span>Created</span> <br />
						#sys_categorylms.created#</p>
				
					<p><span>Updated</span> <br />
						#sys_categorylms.updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_categorylms.deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_categorylms.deletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_categorylms", action="edit", key=sys_categorylms.id)#
</cfoutput>

<h1>Showing sys_specialtylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_specialtylms.id#</p>
				
					<p><span>Name</span> <br />
						#sys_specialtylms.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_specialtylms.Description#</p>
				
					<p><span>Parent_specialty_id</span> <br />
						#sys_specialtylms.parent_specialty_id#</p>
				
					<p><span>Primary_image_id</span> <br />
						#sys_specialtylms.primary_image_id#</p>
				
					<p><span>Created</span> <br />
						#sys_specialtylms.created#</p>
				
					<p><span>Updated</span> <br />
						#sys_specialtylms.updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_specialtylms.deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_specialtylms.deletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_specialtylms", action="edit", key=sys_specialtylms.id)#
</cfoutput>

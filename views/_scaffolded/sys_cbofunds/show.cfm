<h1>Showing sys_cbofund</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_cbofund.id#</p>
				
					<p><span>Name</span> <br />
						#sys_cbofund.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_cbofund.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_cbofund.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_cbofund", action="edit", key=sys_cbofund.id)#
</cfoutput>

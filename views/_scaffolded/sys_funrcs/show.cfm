<h1>Showing sys_funrc</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_funrc.id#</p>
				
					<p><span>Name</span> <br />
						#sys_funrc.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_funrc.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_funrc.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_funrc", action="edit", key=sys_funrc.id)#
</cfoutput>

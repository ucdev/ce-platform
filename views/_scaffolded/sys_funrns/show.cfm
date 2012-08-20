<h1>Showing sys_funrn</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_funrn.id#</p>
				
					<p><span>Name</span> <br />
						#sys_funrn.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_funrn.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_funrn.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_funrn", action="edit", key=sys_funrn.id)#
</cfoutput>

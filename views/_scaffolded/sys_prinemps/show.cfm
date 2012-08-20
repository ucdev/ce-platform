<h1>Showing sys_prinemp</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_prinemp.id#</p>
				
					<p><span>Name</span> <br />
						#sys_prinemp.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_prinemp.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_prinemp.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_prinemp", action="edit", key=sys_prinemp.id)#
</cfoutput>

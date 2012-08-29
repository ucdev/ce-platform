<h1>Showing sys_profn</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_profn.id#</p>
				
					<p><span>Name</span> <br />
						#sys_profn.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_profn.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_profn.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_profn", action="edit", key=sys_profn.id)#
</cfoutput>

<h1>Showing sys_profc</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_profc.id#</p>
				
					<p><span>Name</span> <br />
						#sys_profc.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_profc.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_profc.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_profc", action="edit", key=sys_profc.id)#
</cfoutput>

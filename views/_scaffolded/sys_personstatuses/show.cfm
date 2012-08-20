<h1>Showing sys_personstatus</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_personstatus.id#</p>
				
					<p><span>Name</span> <br />
						#sys_personstatus.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_personstatus.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_personstatus.Code#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_personstatus", action="edit", key=sys_personstatus.id)#
</cfoutput>

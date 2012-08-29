<h1>Showing sys_status</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_status.id#</p>
				
					<p><span>Name</span> <br />
						#sys_status.Name#</p>
				
					<p><span>Created</span> <br />
						#sys_status.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_status", action="edit", key=sys_status.id)#
</cfoutput>

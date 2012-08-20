<h1>Showing sys_attendeestatus</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_attendeestatus.id#</p>
				
					<p><span>Name</span> <br />
						#sys_attendeestatus.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_attendeestatus.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_attendeestatus.Code#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_attendeestatus", action="edit", key=sys_attendeestatus.id)#
</cfoutput>

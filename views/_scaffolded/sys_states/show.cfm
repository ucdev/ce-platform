<h1>Showing sys_state</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_state.id#</p>
				
					<p><span>Name</span> <br />
						#sys_state.name#</p>
				
					<p><span>Code</span> <br />
						#sys_state.code#</p>
				
					<p><span>APAbbrv</span> <br />
						#sys_state.APAbbrv#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_state", action="edit", key=sys_state.id)#
</cfoutput>

<h1>Showing sys_cbafund</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_cbafund.id#</p>
				
					<p><span>Name</span> <br />
						#sys_cbafund.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_cbafund.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_cbafund.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_cbafund", action="edit", key=sys_cbafund.id)#
</cfoutput>

<h1>Showing sys_orgtype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_orgtype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_orgtype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_orgtype.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_orgtype.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_orgtype", action="edit", key=sys_orgtype.id)#
</cfoutput>

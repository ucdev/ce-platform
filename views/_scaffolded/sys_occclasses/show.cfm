<h1>Showing sys_occclass</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_occclass.id#</p>
				
					<p><span>Name</span> <br />
						#sys_occclass.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_occclass.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_occclass.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_occclass", action="edit", key=sys_occclass.id)#
</cfoutput>

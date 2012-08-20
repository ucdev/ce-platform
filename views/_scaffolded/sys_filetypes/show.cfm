<h1>Showing sys_filetype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_filetype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_filetype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_filetype.Description#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_filetype", action="edit", key=sys_filetype.id)#
</cfoutput>

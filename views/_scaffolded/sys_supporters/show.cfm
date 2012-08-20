<h1>Showing sys_supporter</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_supporter.id#</p>
				
					<p><span>Name</span> <br />
						#sys_supporter.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_supporter.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_supporter.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_supporter.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_supporter.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_supporter.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_supporter", action="edit", key=sys_supporter.id)#
</cfoutput>

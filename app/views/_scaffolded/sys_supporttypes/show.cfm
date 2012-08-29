<h1>Showing sys_supporttype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_supporttype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_supporttype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_supporttype.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_supporttype.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_supporttype.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_supporttype.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_supporttype.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_supporttype", action="edit", key=sys_supporttype.id)#
</cfoutput>

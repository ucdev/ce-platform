<h1>Showing authority</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#authority.id#</p>
				
					<p><span>Name</span> <br />
						#authority.Name#</p>
				
					<p><span>Description</span> <br />
						#authority.Description#</p>
				
					<p><span>Created</span> <br />
						#authority.Created#</p>
				
					<p><span>Updated</span> <br />
						#authority.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#authority.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#authority.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this authority", action="edit", key=authority.id)#
</cfoutput>

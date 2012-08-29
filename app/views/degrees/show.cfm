<h1>Showing degree</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#degree.id#</p>
				
					<p><span>Name</span> <br />
						#degree.name#</p>
				
					<p><span>Abbrv</span> <br />
						#degree.abbrv#</p>
				
					<p><span>Created</span> <br />
						#degree.created#</p>
				
					<p><span>Updated</span> <br />
						#degree.updated#</p>
				
					<p><span>Deleted</span> <br />
						#degree.deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#degree.deletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this degree", action="edit", key=degree.id)#
</cfoutput>

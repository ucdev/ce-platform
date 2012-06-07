<h1>Showing imagetype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#imagetype.id#</p>
				
					<p><span>Name</span> <br />
						#imagetype.name#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this imagetype", action="edit", key=imagetype.id)#
</cfoutput>

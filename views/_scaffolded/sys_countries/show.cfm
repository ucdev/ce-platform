<h1>Showing sys_country</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_country.id#</p>
				
					<p><span>Name</span> <br />
						#sys_country.name#</p>
				
					<p><span>Code</span> <br />
						#sys_country.code#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_country", action="edit", key=sys_country.id)#
</cfoutput>

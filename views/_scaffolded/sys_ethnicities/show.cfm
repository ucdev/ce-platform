<h1>Showing sys_ethnicity</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_ethnicity.id#</p>
				
					<p><span>Name</span> <br />
						#sys_ethnicity.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_ethnicity.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_ethnicity.Code#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_ethnicity", action="edit", key=sys_ethnicity.id)#
</cfoutput>

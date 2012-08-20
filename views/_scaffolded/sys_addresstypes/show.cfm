<h1>Showing sys_addresstype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_addresstype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_addresstype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_addresstype.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_addresstype.Code#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_addresstype", action="edit", key=sys_addresstype.id)#
</cfoutput>

<h1>Showing sys_assesstype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_assesstype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_assesstype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_assesstype.Description#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_assesstype", action="edit", key=sys_assesstype.id)#
</cfoutput>

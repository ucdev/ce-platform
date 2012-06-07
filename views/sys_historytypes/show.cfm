<h1>Showing sys_historytype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_historytype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_historytype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_historytype.Description#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_historytype", action="edit", key=sys_historytype.id)#
</cfoutput>

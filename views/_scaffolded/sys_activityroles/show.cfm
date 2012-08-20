<h1>Showing sys_activityrole</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_activityrole.id#</p>
				
					<p><span>Name</span> <br />
						#sys_activityrole.name#</p>
				
					<p><span>Description</span> <br />
						#sys_activityrole.description#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_activityrole", action="edit", key=sys_activityrole.id)#
</cfoutput>

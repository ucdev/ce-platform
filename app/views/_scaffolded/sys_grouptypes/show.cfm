<h1>Showing sys_grouptype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_grouptype.id#</p>
				
					<p><span>Title</span> <br />
						#sys_grouptype.title#</p>
				
					<p><span>Details</span> <br />
						#sys_grouptype.details#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_grouptype", action="edit", key=sys_grouptype.id)#
</cfoutput>

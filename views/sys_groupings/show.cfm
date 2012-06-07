<h1>Showing sys_grouping</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_grouping.id#</p>
				
					<p><span>Activity Type ID</span> <br />
						#sys_grouping.ActivityTypeID#</p>
				
					<p><span>Name</span> <br />
						#sys_grouping.Name#</p>
				
					<p><span>Aliases</span> <br />
						#sys_grouping.Aliases#</p>
				
					<p><span>Created</span> <br />
						#sys_grouping.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_grouping", action="edit", key=sys_grouping.id)#
</cfoutput>

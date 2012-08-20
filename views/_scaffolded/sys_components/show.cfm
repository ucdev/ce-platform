<h1>Showing sys_component</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_component.id#</p>
				
					<p><span>Name</span> <br />
						#sys_component.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_component.Description#</p>
				
					<p><span>Type Code</span> <br />
						#sys_component.TypeCode#</p>
				
					<p><span>Sort Flag</span> <br />
						#sys_component.SortFlag#</p>
				
					<p><span>Max Usage</span> <br />
						#sys_component.MaxUsage#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_component", action="edit", key=sys_component.id)#
</cfoutput>

<h1>Showing sys_degree</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_degree.id#</p>
				
					<p><span>Name</span> <br />
						#sys_degree.Name#</p>
				
					<p><span>Abbrev</span> <br />
						#sys_degree.Abbrev#</p>
				
					<p><span>Sort</span> <br />
						#sys_degree.Sort#</p>
				
					<p><span>Profession</span> <br />
						#sys_degree.Profession#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_degree", action="edit", key=sys_degree.id)#
</cfoutput>

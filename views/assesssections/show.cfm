<h1>Showing assesssection</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#assesssection.id#</p>
				
					<p><span>Name</span> <br />
						#assesssection.Name#</p>
				
					<p><span>Description</span> <br />
						#assesssection.Description#</p>
				
					<p><span>Parent Section ID</span> <br />
						#assesssection.ParentSectionID#</p>
				
					<p><span>Assessment ID</span> <br />
						#assesssection.AssessmentID#</p>
				
					<p><span>Sort</span> <br />
						#assesssection.Sort#</p>
				
					<p><span>Created</span> <br />
						#assesssection.Created#</p>
				
					<p><span>Updated</span> <br />
						#assesssection.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#assesssection.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#assesssection.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this assesssection", action="edit", key=assesssection.id)#
</cfoutput>

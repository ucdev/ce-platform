<h1>Showing person_degree</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_degree.id#</p>
				
					<p><span>Person ID</span> <br />
						#person_degree.PersonID#</p>
				
					<p><span>Degree ID</span> <br />
						#person_degree.DegreeID#</p>
				
					<p><span>Created</span> <br />
						#person_degree.Created#</p>
				
					<p><span>Deleted Flag</span> <br />
						#person_degree.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_degree", action="edit", key=person_degree.id)#
</cfoutput>

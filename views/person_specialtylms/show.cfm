<h1>Showing person_specialtylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_specialtylms.id#</p>
				
					<p><span>Person ID</span> <br />
						#person_specialtylms.PersonID#</p>
				
					<p><span>Specialty ID</span> <br />
						#person_specialtylms.SpecialtyID#</p>
				
					<p><span>Created</span> <br />
						#person_specialtylms.Created#</p>
				
					<p><span>Deleted Flag</span> <br />
						#person_specialtylms.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_specialtylms", action="edit", key=person_specialtylms.id)#
</cfoutput>

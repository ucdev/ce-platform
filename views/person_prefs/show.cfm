<h1>Showing person_pref</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_pref.id#</p>
				
					<p><span>Person ID</span> <br />
						#person_pref.PersonID#</p>
				
					<p><span>Email Specialty Flag</span> <br />
						#person_pref.EmailSpecialtyFlag#</p>
				
					<p><span>Primary Email Id</span> <br />
						#person_pref.PrimaryEmailId#</p>
				
					<p><span>Created At</span> <br />
						#person_pref.createdAt#</p>
				
					<p><span>Updated At</span> <br />
						#person_pref.updatedAt#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_pref", action="edit", key=person_pref.id)#
</cfoutput>

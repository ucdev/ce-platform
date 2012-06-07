<h1>Showing person_interest_except</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_interest_except.id#</p>
				
					<p><span>Person ID</span> <br />
						#person_interest_except.PersonID#</p>
				
					<p><span>Activity ID</span> <br />
						#person_interest_except.ActivityID#</p>
				
					<p><span>Created</span> <br />
						#person_interest_except.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_interest_except", action="edit", key=person_interest_except.id)#
</cfoutput>

<h1>Showing degree_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#degree_credit.id#</p>
				
					<p><span>Degree Id</span> <br />
						#degree_credit.degreeId#</p>
				
					<p><span>Credit Id</span> <br />
						#degree_credit.creditId#</p>
				
					<p><span>Sort</span> <br />
						#degree_credit.sort#</p>
				
					<p><span>Created</span> <br />
						#degree_credit.created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this degree_credit", action="edit", key=degree_credit.id)#
</cfoutput>

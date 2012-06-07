<h1>Showing assessresult</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#assessresult.id#</p>
				
					<p><span>Person ID</span> <br />
						#assessresult.PersonID#</p>
				
					<p><span>Assessment ID</span> <br />
						#assessresult.AssessmentID#</p>
				
					<p><span>Result Status ID</span> <br />
						#assessresult.ResultStatusID#</p>
				
					<p><span>Score</span> <br />
						#assessresult.Score#</p>
				
					<p><span>Created</span> <br />
						#assessresult.Created#</p>
				
					<p><span>Updated</span> <br />
						#assessresult.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#assessresult.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#assessresult.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this assessresult", action="edit", key=assessresult.id)#
</cfoutput>

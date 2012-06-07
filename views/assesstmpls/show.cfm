<h1>Showing assesstmpl</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#assesstmpl.id#</p>
				
					<p><span>Name</span> <br />
						#assesstmpl.Name#</p>
				
					<p><span>Assessment ID</span> <br />
						#assesstmpl.AssessmentID#</p>
				
					<p><span>Assess Type ID</span> <br />
						#assesstmpl.AssessTypeID#</p>
				
					<p><span>Created</span> <br />
						#assesstmpl.Created#</p>
				
					<p><span>Created By</span> <br />
						#assesstmpl.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#assesstmpl.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#assesstmpl.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#assesstmpl.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#assesstmpl.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this assesstmpl", action="edit", key=assesstmpl.id)#
</cfoutput>

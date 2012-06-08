<h1>Showing file</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#file.id#</p>
				
					<p><span>Activity ID</span> <br />
						#file.ActivityID#</p>
				
					<p><span>Credit ID</span> <br />
						#file.CreditID#</p>
				
					<p><span>Amount</span> <br />
						#file.Amount#</p>
				
					<p><span>Reference No</span> <br />
						#file.ReferenceNo#</p>
				
					<p><span>Created</span> <br />
						#file.Created#</p>
				
					<p><span>Created By</span> <br />
						#file.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#file.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#file.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#file.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#file.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this file", action="edit", key=file.id)#
</cfoutput>

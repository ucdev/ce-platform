<h1>Showing activity_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_credit.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_credit.ActivityID#</p>
				
					<p><span>Credit ID</span> <br />
						#activity_credit.CreditID#</p>
				
					<p><span>Amount</span> <br />
						#activity_credit.Amount#</p>
				
					<p><span>Reference No</span> <br />
						#activity_credit.ReferenceNo#</p>
				
					<p><span>Created</span> <br />
						#activity_credit.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_credit.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_credit.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_credit.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_credit.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_credit.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_credit", action="edit", key=activity_credit.id)#
</cfoutput>

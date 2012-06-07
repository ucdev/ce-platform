<h1>Showing attendeecredit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#attendeecredit.id#</p>
				
					<p><span>Attendee ID</span> <br />
						#attendeecredit.AttendeeID#</p>
				
					<p><span>Credit ID</span> <br />
						#attendeecredit.CreditID#</p>
				
					<p><span>Amount</span> <br />
						#attendeecredit.Amount#</p>
				
					<p><span>Reference No</span> <br />
						#attendeecredit.ReferenceNo#</p>
				
					<p><span>Expiration Date</span> <br />
						#attendeecredit.ExpirationDate#</p>
				
					<p><span>Created</span> <br />
						#attendeecredit.Created#</p>
				
					<p><span>Created By</span> <br />
						#attendeecredit.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#attendeecredit.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#attendeecredit.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#attendeecredit.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#attendeecredit.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this attendeecredit", action="edit", key=attendeecredit.id)#
</cfoutput>

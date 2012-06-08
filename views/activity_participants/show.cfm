<h1>Showing attendee</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#attendee.id#</p>
				
					<p><span>Activity ID</span> <br />
						#attendee.ActivityID#</p>
				
					<p><span>Person ID</span> <br />
						#attendee.PersonID#</p>
				
					<p><span>Status ID</span> <br />
						#attendee.StatusID#</p>
				
					<p><span>Checked In Flag</span> <br />
						#attendee.CheckedInFlag#</p>
				
					<p><span>Check In</span> <br />
						#attendee.CheckIn#</p>
				
					<p><span>Checked Out Flag</span> <br />
						#attendee.CheckedOutFlag#</p>
				
					<p><span>Check Out</span> <br />
						#attendee.CheckOut#</p>
				
					<p><span>M Dflag</span> <br />
						#attendee.MDflag#</p>
				
					<p><span>Terms Flag</span> <br />
						#attendee.TermsFlag#</p>
				
					<p><span>Payment Flag</span> <br />
						#attendee.PaymentFlag#</p>
				
					<p><span>Pay Amount</span> <br />
						#attendee.PayAmount#</p>
				
					<p><span>Pay Order No</span> <br />
						#attendee.PayOrderNo#</p>
				
					<p><span>Payment Date</span> <br />
						#attendee.PaymentDate#</p>
				
					<p><span>Register Date</span> <br />
						#attendee.RegisterDate#</p>
				
					<p><span>Complete Date</span> <br />
						#attendee.CompleteDate#</p>
				
					<p><span>Term Date</span> <br />
						#attendee.TermDate#</p>
				
					<p><span>First Name</span> <br />
						#attendee.firstName#</p>
				
					<p><span>Middle Name</span> <br />
						#attendee.middleName#</p>
				
					<p><span>Last Name</span> <br />
						#attendee.lastName#</p>
				
					<p><span>Email</span> <br />
						#attendee.email#</p>
				
					<p><span>Cert Name</span> <br />
						#attendee.certName#</p>
				
					<p><span>Address1</span> <br />
						#attendee.address1#</p>
				
					<p><span>Address2</span> <br />
						#attendee.address2#</p>
				
					<p><span>City</span> <br />
						#attendee.city#</p>
				
					<p><span>State Province</span> <br />
						#attendee.stateProvince#</p>
				
					<p><span>State Id</span> <br />
						#attendee.stateId#</p>
				
					<p><span>Country Id</span> <br />
						#attendee.countryId#</p>
				
					<p><span>Postal Code</span> <br />
						#attendee.postalCode#</p>
				
					<p><span>Phone1</span> <br />
						#attendee.phone1#</p>
				
					<p><span>Phone1ext</span> <br />
						#attendee.phone1ext#</p>
				
					<p><span>Phone2</span> <br />
						#attendee.phone2#</p>
				
					<p><span>Phone2ext</span> <br />
						#attendee.phone2ext#</p>
				
					<p><span>Fax</span> <br />
						#attendee.fax#</p>
				
					<p><span>Faxext</span> <br />
						#attendee.faxext#</p>
				
					<p><span>Entry Method</span> <br />
						#attendee.entryMethod#</p>
				
					<p><span>Email Sent Flag</span> <br />
						#attendee.emailSentFlag#</p>
				
					<p><span>Created</span> <br />
						#attendee.Created#</p>
				
					<p><span>Created By</span> <br />
						#attendee.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#attendee.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#attendee.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#attendee.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#attendee.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this attendee", action="edit", key=attendee.id)#
</cfoutput>

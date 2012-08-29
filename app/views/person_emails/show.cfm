<h1>Showing person_email</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_email.id#</p>
				
					<p><span>Person_id</span> <br />
						#person_email.person_id#</p>
				
					<p><span>Email_address</span> <br />
						#person_email.email_address#</p>
				
					<p><span>Is_verified</span> <br />
						#person_email.is_verified#</p>
				
					<p><span>Verification_key</span> <br />
						#person_email.verification_key#</p>
				
					<p><span>Allow_login</span> <br />
						#person_email.allow_login#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_email", action="edit", key=person_email.id)#
</cfoutput>

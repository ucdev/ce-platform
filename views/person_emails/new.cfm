<h1>Create a New person_email</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("person_email")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='person_email', property='email_id', label='Email_id')#
																
				
					
						#textField(objectName='person_email', property='person_id', label='Person_id')#
																
				
					
						#textField(objectName='person_email', property='email_address', label='Email_address')#
																
				
					
						#checkBox(objectName='person_email', property='is_verified', label='Is_verified')#
																
				
					
						#textField(objectName='person_email', property='verification_key', label='Verification_key')#
																
				
					
						#checkBox(objectName='person_email', property='allow_login', label='Allow_login')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

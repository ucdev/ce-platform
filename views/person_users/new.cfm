<h1>Create a New person_user</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("person_user")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='person_user', property='person_id', label='Person_id')#
																
				
					
						#textField(objectName='person_user', property='displayname', label='Displayname')#
																
				
					
						#textField(objectName='person_user', property='primary_email_id', label='Primary_email_id')#
																
				
					
						#textField(objectName='person_user', property='primary_image_id', label='Primary_image_id')#
																
				
					
						#textField(objectName='person_user', property='primary_entity_id', label='Primary_entity_id')#
																
				
					
						#textField(objectName='person_user', property='password', label='Password')#
																
				
					
						#dateTimeSelect(objectName='person_user', property='last_login', dateOrder='year,month,day', monthDisplay='abbreviations', label='Last_login')#
																
				
					
						#textField(objectName='person_user', property='last_login_ip', label='Last_login_ip')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Create a New person_client</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("person_client")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='person_client', property='personConnectId', label='Person Connect Id')#
																
				
					
						#textField(objectName='person_client', property='personId', label='Person Id')#
																
				
					
						#textField(objectName='person_client', property='clientId', label='Client Id')#
																
				
					
						#textField(objectName='person_client', property='clientToken', label='Client Token')#
																
				
					
						#textField(objectName='person_client', property='revokeFlag', label='Revoke Flag')#
																
				
					
						#dateTimeSelect(objectName='person_client', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='person_client', property='updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='person_client', property='deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='person_client', property='deletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

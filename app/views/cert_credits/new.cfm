<h1>Create a New cert_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("cert_credit")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='cert_credit', property='certCreditId', label='Cert Credit Id')#
																
				
					
						#textField(objectName='cert_credit', property='certId', label='Cert Id')#
																
				
					
						#textField(objectName='cert_credit', property='creditId', label='Credit Id')#
																
				
					
						#dateTimeSelect(objectName='cert_credit', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

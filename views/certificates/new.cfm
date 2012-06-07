<h1>Create a New certificate</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("certificate")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='certificate', property='certificateId', label='Certificate Id')#
																
				
					
						#textField(objectName='certificate', property='title', label='Title')#
																
				
					
						#textField(objectName='certificate', property='detail', label='Detail')#
																
				
					
						#textField(objectName='certificate', property='certConfigFile', label='Cert Config File')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

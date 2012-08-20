<h1>Create a New sys_addresstype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_addresstype")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_addresstype', property='AddressTypeID', label='Address Type ID')#
																
				
					
						#textField(objectName='sys_addresstype', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_addresstype', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_addresstype', property='Code', label='Code')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

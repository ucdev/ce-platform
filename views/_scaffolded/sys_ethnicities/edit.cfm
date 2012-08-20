<h1>Editing sys_ethnicity</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_ethnicity")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_ethnicity', property='EthnicityID', label='Ethnicity ID')#
															
				
					
						#textField(objectName='sys_ethnicity', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_ethnicity', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_ethnicity', property='Code', label='Code')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

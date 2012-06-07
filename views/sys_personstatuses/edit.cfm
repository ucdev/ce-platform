<h1>Editing sys_personstatus</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_personstatus")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_personstatus', property='PersonStatusID', label='Person Status ID')#
															
				
					
						#textField(objectName='sys_personstatus', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_personstatus', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_personstatus', property='Code', label='Code')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

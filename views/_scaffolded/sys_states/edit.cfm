<h1>Editing sys_state</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_state")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_state', property='stateid', label='Stateid')#
															
				
					
						#textField(objectName='sys_state', property='name', label='Name')#
															
				
					
						#textField(objectName='sys_state', property='code', label='Code')#
															
				
					
						#textField(objectName='sys_state', property='APAbbrv', label='APAbbrv')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

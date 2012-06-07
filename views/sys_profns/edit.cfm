<h1>Editing sys_profn</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_profn")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_profn', property='ProfNID', label='Prof NID')#
															
				
					
						#textField(objectName='sys_profn', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_profn', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_profn', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing sys_profc</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_profc")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_profc', property='ProfCID', label='Prof CID')#
															
				
					
						#textField(objectName='sys_profc', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_profc', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_profc', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

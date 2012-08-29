<h1>Editing sys_status</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_status")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_status', property='StatusID', label='Status ID')#
															
				
					
						#textField(objectName='sys_status', property='Name', label='Name')#
															
				
					
						#dateTimeSelect(objectName='sys_status', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

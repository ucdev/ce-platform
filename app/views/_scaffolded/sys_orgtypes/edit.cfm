<h1>Editing sys_orgtype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_orgtype")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_orgtype', property='OrgTypeID', label='Org Type ID')#
															
				
					
						#textField(objectName='sys_orgtype', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_orgtype', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_orgtype', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Create a New sys_historytype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_historytype")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_historytype', property='HistoryTypeID', label='History Type ID')#
																
				
					
						#textField(objectName='sys_historytype', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_historytype', property='Description', label='Description')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

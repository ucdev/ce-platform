<h1>Editing sys_entrytype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_entrytype")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_entrytype', property='EntryTypeID', label='Entry Type ID')#
															
				
					
						#textField(objectName='sys_entrytype', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_entrytype', property='ExpenseFlag', label='Expense Flag')#
															
				
					
						#textField(objectName='sys_entrytype', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_entrytype', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

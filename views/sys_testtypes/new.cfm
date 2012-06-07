<h1>Create a New sys_testtype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_testtype")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_testtype', property='TestTypeID', label='Test Type ID')#
																
				
					
						#textField(objectName='sys_testtype', property='Name', label='Name')#
																
				
					
						#textArea(objectName='sys_testtype', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_testtype', property='Code', label='Code')#
																
				
					
						#dateTimeSelect(objectName='sys_testtype', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='sys_testtype', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='sys_testtype', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='sys_testtype', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

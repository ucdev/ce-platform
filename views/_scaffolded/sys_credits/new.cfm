<h1>Create a New sys_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_credit")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_credit', property='CreditID', label='Credit ID')#
																
				
					
						#textField(objectName='sys_credit', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_credit', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_credit', property='Code', label='Code')#
																
				
					
						#textField(objectName='sys_credit', property='ReferenceFlag', label='Reference Flag')#
																
				
					
						#textField(objectName='sys_credit', property='Statement', label='Statement')#
																
				
					
						#dateTimeSelect(objectName='sys_credit', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='sys_credit', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='sys_credit', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='sys_credit', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Create a New sys_supporter</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_supporter")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_supporter', property='ContributorID', label='Contributor ID')#
																
				
					
						#textField(objectName='sys_supporter', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_supporter', property='Description', label='Description')#
																
				
					
						#dateTimeSelect(objectName='sys_supporter', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='sys_supporter', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='sys_supporter', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='sys_supporter', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

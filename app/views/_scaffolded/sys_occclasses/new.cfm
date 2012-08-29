<h1>Create a New sys_occclass</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_occclass")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_occclass', property='OccClassID', label='Occ Class ID')#
																
				
					
						#textField(objectName='sys_occclass', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_occclass', property='Description', label='Description')#
																
				
					
						#dateTimeSelect(objectName='sys_occclass', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

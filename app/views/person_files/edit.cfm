<h1>Editing person_file</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("person_file")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='person_file', property='PersonFileID', label='Person File ID')#
															
				
					
						#textField(objectName='person_file', property='FileID', label='File ID')#
															
				
					
						#textField(objectName='person_file', property='PersonID', label='Person ID')#
															
				
					
						#textField(objectName='person_file', property='FileGroupID', label='File Group ID')#
															
				
					
						#dateTimeSelect(objectName='person_file', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='person_file', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='person_file', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='person_file', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

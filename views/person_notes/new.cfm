<h1>Create a New person_note</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("person_note")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='person_note', property='NoteID', label='Note ID')#
																
				
					
						#textField(objectName='person_note', property='PersonID', label='Person ID')#
																
				
					
						#textField(objectName='person_note', property='Body', label='Body')#
																
				
					
						#dateTimeSelect(objectName='person_note', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='person_note', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='person_note', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='person_note', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='person_note', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='person_note', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

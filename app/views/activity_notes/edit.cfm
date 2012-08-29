<h1>Editing activity_note</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_note")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_note', property='NoteID', label='Note ID')#
															
				
					
						#textField(objectName='activity_note', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_note', property='Body', label='Body')#
															
				
					
						#dateTimeSelect(objectName='activity_note', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_note', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_note', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_note', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_note', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_note', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

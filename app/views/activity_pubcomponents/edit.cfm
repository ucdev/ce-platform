<h1>Editing activity_pubcomponent</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_pubcomponent")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_pubcomponent', property='PubComponentID', label='Pub Component ID')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='ComponentID', label='Component ID')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='Sort', label='Sort')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='DisplayName', label='Display Name')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='Description', label='Description')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='ExternalURL', label='External URL')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='AssessmentID', label='Assessment ID')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='FileID', label='File ID')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='RequiredFlag', label='Required Flag')#
															
				
					
						#dateTimeSelect(objectName='activity_pubcomponent', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_pubcomponent', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_pubcomponent', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_pubcomponent', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

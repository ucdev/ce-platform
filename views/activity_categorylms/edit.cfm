<h1>Editing activity_categorylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_categorylms")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_categorylms', property='Activity_LMS_CategoryID', label='Activity_ LMS_ Category ID')#
															
				
					
						#textField(objectName='activity_categorylms', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_categorylms', property='CategoryID', label='Category ID')#
															
				
					
						#dateTimeSelect(objectName='activity_categorylms', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_categorylms', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_categorylms', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_categorylms', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_categorylms', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_categorylms', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

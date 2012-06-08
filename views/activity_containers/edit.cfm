<h1>Editing activity_category</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_category")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_category', property='Activity_CategoryID', label='Activity_ Category ID')#
															
				
					
						#textField(objectName='activity_category', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_category', property='CategoryID', label='Category ID')#
															
				
					
						#dateTimeSelect(objectName='activity_category', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_category', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_category', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_category', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_category', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_category', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

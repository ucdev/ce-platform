<h1>Create a New activity_finbudget</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_finbudget")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='activity_finbudget', property='BudgetID', label='Budget ID')#
																
				
					
						#textField(objectName='activity_finbudget', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_finbudget', property='Description', label='Description')#
																
				
					
						#textField(objectName='activity_finbudget', property='EntryTypeID', label='Entry Type ID')#
																
				
					
						#textField(objectName='activity_finbudget', property='Amount', label='Amount')#
																
				
					
						#dateTimeSelect(objectName='activity_finbudget', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='activity_finbudget', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='activity_finbudget', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='activity_finbudget', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='activity_finbudget', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='activity_finbudget', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing activity_finledger</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_finledger")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_finledger', property='EntryID', label='Entry ID')#
															
				
					
						#textField(objectName='activity_finledger', property='ActivityID', label='Activity ID')#
															
				
					
						#dateTimeSelect(objectName='activity_finledger', property='EntryDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Entry Date')#
															
				
					
						#textField(objectName='activity_finledger', property='Description', label='Description')#
															
				
					
						#textField(objectName='activity_finledger', property='Memo', label='Memo')#
															
				
					
						#textField(objectName='activity_finledger', property='EntryTypeID', label='Entry Type ID')#
															
				
					
						#textField(objectName='activity_finledger', property='Amount', label='Amount')#
															
				
					
						#dateTimeSelect(objectName='activity_finledger', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_finledger', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_finledger', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_finledger', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_finledger', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_finledger', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

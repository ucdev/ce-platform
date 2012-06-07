<h1>Editing activity_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_credit")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_credit', property='Activity_CreditID', label='Activity_ Credit ID')#
															
				
					
						#textField(objectName='activity_credit', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_credit', property='CreditID', label='Credit ID')#
															
				
					
						#textField(objectName='activity_credit', property='Amount', label='Amount')#
															
				
					
						#textField(objectName='activity_credit', property='ReferenceNo', label='Reference No')#
															
				
					
						#dateTimeSelect(objectName='activity_credit', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_credit', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_credit', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_credit', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_credit', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_credit', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

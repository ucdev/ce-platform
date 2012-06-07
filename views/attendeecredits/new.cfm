<h1>Create a New attendeecredit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("attendeecredit")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='attendeecredit', property='AttendeeCreditID', label='Attendee Credit ID')#
																
				
					
						#textField(objectName='attendeecredit', property='AttendeeID', label='Attendee ID')#
																
				
					
						#textField(objectName='attendeecredit', property='CreditID', label='Credit ID')#
																
				
					
						#textField(objectName='attendeecredit', property='Amount', label='Amount')#
																
				
					
						#textField(objectName='attendeecredit', property='ReferenceNo', label='Reference No')#
																
				
					
						#dateTimeSelect(objectName='attendeecredit', property='ExpirationDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Expiration Date')#
																
				
					
						#dateTimeSelect(objectName='attendeecredit', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='attendeecredit', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='attendeecredit', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='attendeecredit', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='attendeecredit', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='attendeecredit', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

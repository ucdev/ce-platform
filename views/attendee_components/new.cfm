<h1>Create a New attendee_component</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("attendee_component")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='attendee_component', property='CompStatusID', label='Comp Status ID')#
																
				
					
						#textField(objectName='attendee_component', property='AttendeeID', label='Attendee ID')#
																
				
					
						#textField(objectName='attendee_component', property='ComponentID', label='Component ID')#
																
				
					
						#textField(objectName='attendee_component', property='StatusID', label='Status ID')#
																
				
					
						#textField(objectName='attendee_component', property='PercentComplete', label='Percent Complete')#
																
				
					
						#textField(objectName='attendee_component', property='TestScore', label='Test Score')#
																
				
					
						#textField(objectName='attendee_component', property='LikeFlag', label='Like Flag')#
																
				
					
						#textField(objectName='attendee_component', property='Feedback', label='Feedback')#
																
				
					
						#textField(objectName='attendee_component', property='PingMinutes', label='Ping Minutes')#
																
				
					
						#dateTimeSelect(objectName='attendee_component', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

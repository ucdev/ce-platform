<h1>Editing sys_attendeestatus</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_attendeestatus")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_attendeestatus', property='AttendeeStatusID', label='Attendee Status ID')#
															
				
					
						#textField(objectName='sys_attendeestatus', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_attendeestatus', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_attendeestatus', property='Code', label='Code')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing agenda</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("agenda")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='agenda', property='AgendaID', label='Agenda ID')#
															
				
					
						#textField(objectName='agenda', property='ActivityID', label='Activity ID')#
															
				
					
						#dateTimeSelect(objectName='agenda', property='EventDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Event Date')#
															
				
					
						#dateTimeSelect(objectName='agenda', property='StartTime', dateOrder='year,month,day', monthDisplay='abbreviations', label='Start Time')#
															
				
					
						#dateTimeSelect(objectName='agenda', property='EndTime', dateOrder='year,month,day', monthDisplay='abbreviations', label='End Time')#
															
				
					
						#textField(objectName='agenda', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='agenda', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='agenda', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='agenda', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='agenda', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='agenda', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='agenda', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

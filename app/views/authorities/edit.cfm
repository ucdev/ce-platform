<h1>Editing authority</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("authority")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='authority', property='AuthorityID', label='Authority ID')#
															
				
					
						#textField(objectName='authority', property='Name', label='Name')#
															
				
					
						#textField(objectName='authority', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='authority', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='authority', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='authority', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='authority', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

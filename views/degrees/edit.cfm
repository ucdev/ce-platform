<h1>Editing degree</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("degree")#
	
			#startFormTag(action="update", key=params.key)#
		
				
															
				
					
						#textField(objectName='degree', property='name', label='Name')#
															
				
					
						#textField(objectName='degree', property='abbrv', label='Abbrv')#
															
				
					
						#dateTimeSelect(objectName='degree', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='degree', property='updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='degree', property='deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='degree', property='deletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

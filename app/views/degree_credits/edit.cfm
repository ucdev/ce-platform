<h1>Editing degree_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("degree_credit")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='degree_credit', property='degreeCreditId', label='Degree Credit Id')#
															
				
					
						#textField(objectName='degree_credit', property='degreeId', label='Degree Id')#
															
				
					
						#textField(objectName='degree_credit', property='creditId', label='Credit Id')#
															
				
					
						#textField(objectName='degree_credit', property='sort', label='Sort')#
															
				
					
						#dateTimeSelect(objectName='degree_credit', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

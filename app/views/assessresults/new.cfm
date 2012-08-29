<h1>Create a New assessresult</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("assessresult")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='assessresult', property='ResultID', label='Result ID')#
																
				
					
						#textField(objectName='assessresult', property='PersonID', label='Person ID')#
																
				
					
						#textField(objectName='assessresult', property='AssessmentID', label='Assessment ID')#
																
				
					
						#textField(objectName='assessresult', property='ResultStatusID', label='Result Status ID')#
																
				
					
						#textField(objectName='assessresult', property='Score', label='Score')#
																
				
					
						#dateTimeSelect(objectName='assessresult', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='assessresult', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='assessresult', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='assessresult', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing assesssection</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("assesssection")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='assesssection', property='SectionID', label='Section ID')#
															
				
					
						#textField(objectName='assesssection', property='Name', label='Name')#
															
				
					
						#textField(objectName='assesssection', property='Description', label='Description')#
															
				
					
						#textField(objectName='assesssection', property='ParentSectionID', label='Parent Section ID')#
															
				
					
						#textField(objectName='assesssection', property='AssessmentID', label='Assessment ID')#
															
				
					
						#textField(objectName='assesssection', property='Sort', label='Sort')#
															
				
					
						#dateTimeSelect(objectName='assesssection', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='assesssection', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='assesssection', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='assesssection', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing assessanswer</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("assessanswer")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='assessanswer', property='AnswerID', label='Answer ID')#
															
				
					
						#textField(objectName='assessanswer', property='ResultID', label='Result ID')#
															
				
					
						#textField(objectName='assessanswer', property='AssessmentID', label='Assessment ID')#
															
				
					
						#textField(objectName='assessanswer', property='QuestionID', label='Question ID')#
															
				
					
						#textField(objectName='assessanswer', property='I1', label='I1')#
															
				
					
						#textField(objectName='assessanswer', property='I2', label='I2')#
															
				
					
						#textField(objectName='assessanswer', property='VC1', label='V C1')#
															
				
					
						#textField(objectName='assessanswer', property='VC2', label='V C2')#
															
				
					
						#dateTimeSelect(objectName='assessanswer', property='DT1', dateOrder='year,month,day', monthDisplay='abbreviations', label='D T1')#
															
				
					
						#dateTimeSelect(objectName='assessanswer', property='DT2', dateOrder='year,month,day', monthDisplay='abbreviations', label='D T2')#
															
				
					
						#textField(objectName='assessanswer', property='TXT1', label='TXT1')#
															
				
					
						#textField(objectName='assessanswer', property='TXT2', label='TXT2')#
															
				
					
						#textField(objectName='assessanswer', property='CorrectFlag', label='Correct Flag')#
															
				
					
						#dateTimeSelect(objectName='assessanswer', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='assessanswer', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='assessanswer', property='updatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='assessanswer', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='assessanswer', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

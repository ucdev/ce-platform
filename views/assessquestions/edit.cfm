<h1>Editing assessquestion</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("assessquestion")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='assessquestion', property='QuestionID', label='Question ID')#
															
				
					
						#textField(objectName='assessquestion', property='QuestionTypeID', label='Question Type ID')#
															
				
					
						#textField(objectName='assessquestion', property='AssessmentID', label='Assessment ID')#
															
				
					
						#textField(objectName='assessquestion', property='LabelText', label='Label Text')#
															
				
					
						#textField(objectName='assessquestion', property='DetailText', label='Detail Text')#
															
				
					
						#textField(objectName='assessquestion', property='RequiredFlag', label='Required Flag')#
															
				
					
						#textField(objectName='assessquestion', property='CorrectField', label='Correct Field')#
															
				
					
						#textField(objectName='assessquestion', property='SectionID', label='Section ID')#
															
				
					
						#textField(objectName='assessquestion', property='Sort', label='Sort')#
															
				
					
						#textField(objectName='assessquestion', property='i1', label='I1')#
															
				
					
						#textField(objectName='assessquestion', property='i2', label='I2')#
															
				
					
						#textField(objectName='assessquestion', property='i3', label='I3')#
															
				
					
						#textField(objectName='assessquestion', property='i4', label='I4')#
															
				
					
						#textField(objectName='assessquestion', property='i5', label='I5')#
															
				
					
						#textField(objectName='assessquestion', property='i6', label='I6')#
															
				
					
						#textField(objectName='assessquestion', property='i7', label='I7')#
															
				
					
						#textField(objectName='assessquestion', property='i8', label='I8')#
															
				
					
						#textField(objectName='assessquestion', property='i9', label='I9')#
															
				
					
						#textField(objectName='assessquestion', property='i10', label='I10')#
															
				
					
						#textField(objectName='assessquestion', property='vc1', label='Vc1')#
															
				
					
						#textField(objectName='assessquestion', property='vc2', label='Vc2')#
															
				
					
						#textField(objectName='assessquestion', property='vc3', label='Vc3')#
															
				
					
						#textField(objectName='assessquestion', property='vc4', label='Vc4')#
															
				
					
						#textField(objectName='assessquestion', property='vc5', label='Vc5')#
															
				
					
						#textField(objectName='assessquestion', property='vc6', label='Vc6')#
															
				
					
						#textField(objectName='assessquestion', property='vc7', label='Vc7')#
															
				
					
						#textField(objectName='assessquestion', property='vc8', label='Vc8')#
															
				
					
						#textField(objectName='assessquestion', property='vc9', label='Vc9')#
															
				
					
						#textField(objectName='assessquestion', property='vc10', label='Vc10')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='dt1', dateOrder='year,month,day', monthDisplay='abbreviations', label='Dt1')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='dt2', dateOrder='year,month,day', monthDisplay='abbreviations', label='Dt2')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='dt3', dateOrder='year,month,day', monthDisplay='abbreviations', label='Dt3')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='dt4', dateOrder='year,month,day', monthDisplay='abbreviations', label='Dt4')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='dt5', dateOrder='year,month,day', monthDisplay='abbreviations', label='Dt5')#
															
				
					
						#textField(objectName='assessquestion', property='txt1', label='Txt1')#
															
				
					
						#textField(objectName='assessquestion', property='txt2', label='Txt2')#
															
				
					
						#textField(objectName='assessquestion', property='txt3', label='Txt3')#
															
				
					
						#textField(objectName='assessquestion', property='txt4', label='Txt4')#
															
				
					
						#textField(objectName='assessquestion', property='txt5', label='Txt5')#
															
				
					
						#textField(objectName='assessquestion', property='ExternalID', label='External ID')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='assessquestion', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='assessquestion', property='DeletedBy', label='Deleted By')#
															
				
					
						#textField(objectName='assessquestion', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Create a New sys_assessquestiontype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_assessquestiontype")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_assessquestiontype', property='QuestionTypeID', label='Question Type ID')#
																
				
					
						#textField(objectName='sys_assessquestiontype', property='Name', label='Name')#
																
				
					
						#textArea(objectName='sys_assessquestiontype', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_assessquestiontype', property='Code', label='Code')#
																
				
					
						#dateTimeSelect(objectName='sys_assessquestiontype', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='sys_assessquestiontype', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='sys_assessquestiontype', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='sys_assessquestiontype', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Create a New assesstmpl</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("assesstmpl")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='assesstmpl', property='AssessTmplID', label='Assess Tmpl ID')#
																
				
					
						#textField(objectName='assesstmpl', property='Name', label='Name')#
																
				
					
						#textField(objectName='assesstmpl', property='AssessmentID', label='Assessment ID')#
																
				
					
						#textField(objectName='assesstmpl', property='AssessTypeID', label='Assess Type ID')#
																
				
					
						#dateTimeSelect(objectName='assesstmpl', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='assesstmpl', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='assesstmpl', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='assesstmpl', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='assesstmpl', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='assesstmpl', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

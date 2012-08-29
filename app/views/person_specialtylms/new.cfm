<h1>Create a New person_specialtylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("person_specialtylms")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='person_specialtylms', property='PersonSpecialtyID', label='Person Specialty ID')#
																
				
					
						#textField(objectName='person_specialtylms', property='PersonID', label='Person ID')#
																
				
					
						#textField(objectName='person_specialtylms', property='SpecialtyID', label='Specialty ID')#
																
				
					
						#dateTimeSelect(objectName='person_specialtylms', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='person_specialtylms', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

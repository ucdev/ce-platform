<h1>Editing person_pref</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("person_pref")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='person_pref', property='PersonPrefID', label='Person Pref ID')#
															
				
					
						#textField(objectName='person_pref', property='PersonID', label='Person ID')#
															
				
					
						#textField(objectName='person_pref', property='EmailSpecialtyFlag', label='Email Specialty Flag')#
															
				
					
						#textField(objectName='person_pref', property='PrimaryEmailId', label='Primary Email Id')#
															
				
															
				
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

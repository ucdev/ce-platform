<h1>Editing person_degree</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("person_degree")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='person_degree', property='PersonDegreeID', label='Person Degree ID')#
															
				
					
						#textField(objectName='person_degree', property='PersonID', label='Person ID')#
															
				
					
						#textField(objectName='person_degree', property='DegreeID', label='Degree ID')#
															
				
					
						#dateTimeSelect(objectName='person_degree', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='person_degree', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

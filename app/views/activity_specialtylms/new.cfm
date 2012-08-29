<h1>Create a New activity_specialtylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_specialtylms")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='activity_specialtylms', property='Activity_LMS_SpecialtyID', label='Activity_ LMS_ Specialty ID')#
																
				
					
						#textField(objectName='activity_specialtylms', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_specialtylms', property='SpecialtyID', label='Specialty ID')#
																
				
					
						#dateTimeSelect(objectName='activity_specialtylms', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='activity_specialtylms', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='activity_specialtylms', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='activity_specialtylms', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='activity_specialtylms', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='activity_specialtylms', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

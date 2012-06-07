<h1>Create a New activity_faculty</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_faculty")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='activity_faculty', property='FacultyID', label='Faculty ID')#
																
				
					
						#textField(objectName='activity_faculty', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_faculty', property='PersonID', label='Person ID')#
																
				
					
						#textField(objectName='activity_faculty', property='CVFileID', label='CVFile ID')#
																
				
					
						#textField(objectName='activity_faculty', property='CVApproveFlag', label='CVApprove Flag')#
																
				
					
						#textField(objectName='activity_faculty', property='DisclosureFileID', label='Disclosure File ID')#
																
				
					
						#textField(objectName='activity_faculty', property='DisclosureApproveFlag', label='Disclosure Approve Flag')#
																
				
					
						#textField(objectName='activity_faculty', property='RoleID', label='Role ID')#
																
				
					
						#dateTimeSelect(objectName='activity_faculty', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='activity_faculty', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='activity_faculty', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='activity_faculty', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='activity_faculty', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='activity_faculty', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

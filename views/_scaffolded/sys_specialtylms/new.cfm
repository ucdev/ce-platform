<h1>Create a New sys_specialtylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_specialtylms")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_specialtylms', property='SpecialtyID', label='Specialty ID')#
																
				
					
						#textField(objectName='sys_specialtylms', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_specialtylms', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_specialtylms', property='parent_specialty_id', label='Parent_specialty_id')#
																
				
					
						#textField(objectName='sys_specialtylms', property='primary_image_id', label='Primary_image_id')#
																
				
					
						#dateTimeSelect(objectName='sys_specialtylms', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='sys_specialtylms', property='updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='sys_specialtylms', property='deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='sys_specialtylms', property='deletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

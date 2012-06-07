<h1>Create a New cert</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("cert")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='cert', property='certId', label='Cert Id')#
																
				
					
						#textField(objectName='cert', property='title', label='Title')#
																
				
					
						#textField(objectName='cert', property='details', label='Details')#
																
				
					
						#textField(objectName='cert', property='template', label='Template')#
																
				
					
						#dateTimeSelect(objectName='cert', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='cert', property='createdBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='cert', property='updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='cert', property='updatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='cert', property='deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='cert', property='deletedFlag', label='Deleted Flag')#
																
				
					
						#textField(objectName='cert', property='deletedBy', label='Deleted By')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

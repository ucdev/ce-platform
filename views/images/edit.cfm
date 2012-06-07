<h1>Editing image</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("image")#
	
			#startFormTag(action="update", key=params.key)#
		
				
															
				
					
						#textField(objectName='image', property='imagetype_id', label='Imagetype_id')#
															
				
					
						#textField(objectName='image', property='data_key', label='Data_key')#
															
				
					
						#textField(objectName='image', property='caption', label='Caption')#
															
				
					
						#textField(objectName='image', property='filename', label='Filename')#
															
				
					
						#textField(objectName='image', property='file_ext', label='File_ext')#
															
				
					
						#textField(objectName='image', property='orig_filename', label='Orig_filename')#
															
				
					
						#dateTimeSelect(objectName='image', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='image', property='created_by', label='Created_by')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing file</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("file")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='file', property='FileID', label='File ID')#
															
				
					
						#textField(objectName='file', property='FileName', label='File Name')#
															
				
					
						#textField(objectName='file', property='FileCaption', label='File Caption')#
															
				
					
						#textField(objectName='file', property='FileSize', label='File Size')#
															
				
					
						#textField(objectName='file', property='FileTypeID', label='File Type ID')#
															
				
					
						#textField(objectName='file', property='PersonID', label='Person ID')#
															
				
					
						#textField(objectName='file', property='ActivityID', label='Activity ID')#
															
				
					
						#dateTimeSelect(objectName='file', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='file', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='file', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='file', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='file', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='file', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

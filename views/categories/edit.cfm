<h1>Editing category</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("category")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='category', property='CategoryID', label='Category ID')#
															
				
					
						#textField(objectName='category', property='Name', label='Name')#
															
				
					
						#textField(objectName='category', property='Description', label='Description')#
															
				
					
						#textField(objectName='category', property='ActivityCount', label='Activity Count')#
															
				
					
						#dateTimeSelect(objectName='category', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='category', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='category', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='category', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='category', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='category', property='DeletedFlag', label='Deleted Flag')#
															
				
					
						#textField(objectName='category', property='primary_image_id', label='Primary_image_id')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

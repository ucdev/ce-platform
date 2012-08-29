<h1>Editing sys_categorylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_categorylms")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_categorylms', property='CategoryID', label='Category ID')#
															
				
					
						#textField(objectName='sys_categorylms', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_categorylms', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_categorylms', property='parent_category_id', label='Parent_category_id')#
															
				
					
						#textField(objectName='sys_categorylms', property='primary_image_id', label='Primary_image_id')#
															
				
					
						#dateTimeSelect(objectName='sys_categorylms', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='sys_categorylms', property='updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='sys_categorylms', property='deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='sys_categorylms', property='deletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

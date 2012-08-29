<h1>Editing assessment</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("assessment")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='assessment', property='AssessmentID', label='Assessment ID')#
															
				
					
						#textField(objectName='assessment', property='AssessTypeID', label='Assess Type ID')#
															
				
					
						#textField(objectName='assessment', property='Name', label='Name')#
															
				
					
						#textArea(objectName='assessment', property='Description', label='Description')#
															
				
					
						#textField(objectName='assessment', property='PassingScore', label='Passing Score')#
															
				
					
						#textField(objectName='assessment', property='MaxAttempts', label='Max Attempts')#
															
				
					
						#textField(objectName='assessment', property='RequiredFlag', label='Required Flag')#
															
				
					
						#textField(objectName='assessment', property='RandomFlag', label='Random Flag')#
															
				
					
						#textField(objectName='assessment', property='CommentFlag', label='Comment Flag')#
															
				
					
						#textField(objectName='assessment', property='Sort', label='Sort')#
															
				
					
						#textField(objectName='assessment', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='assessment', property='ExternalID', label='External ID')#
															
				
					
						#textField(objectName='assessment', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='assessment', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='assessment', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='assessment', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='assessment', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='assessment', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

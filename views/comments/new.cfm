<h1>Create a New comment</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("comment")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='comment', property='CommentID', label='Comment ID')#
																
				
					
						#textField(objectName='comment', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='comment', property='Comment', label='Comment')#
																
				
					
						#textField(objectName='comment', property='ApproveFlag', label='Approve Flag')#
																
				
					
						#textField(objectName='comment', property='ApprovedBy', label='Approved By')#
																
				
					
						#dateTimeSelect(objectName='comment', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='comment', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='comment', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='comment', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='comment', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='comment', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

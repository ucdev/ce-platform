<h1>Create a New activity_comment</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_comment")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='activity_comment', property='ActivityCommentID', label='Activity Comment ID')#
																
				
					
						#textField(objectName='activity_comment', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_comment', property='Comment', label='Comment')#
																
				
					
						#textField(objectName='activity_comment', property='PersonID', label='Person ID')#
																
				
					
						#dateTimeSelect(objectName='activity_comment', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='activity_comment', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='activity_comment', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='activity_comment', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

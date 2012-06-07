<h1>Create a New activity_pubgeneral</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_pubgeneral")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='activity_pubgeneral', property='PubGeneralID', label='Pub General ID')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='LinkName', label='Link Name')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='Overview', label='Overview')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='Keywords', label='Keywords')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='Objectives', label='Objectives')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='Goals', label='Goals')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='PublishFlag', label='Publish Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_pubgeneral', property='PublishDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Publish Date')#
																
				
					
						#dateTimeSelect(objectName='activity_pubgeneral', property='RemoveDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Remove Date')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='PaymentFlag', label='Payment Flag')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='PaymentFee', label='Payment Fee')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='TermsFlag', label='Terms Flag')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='TermsText', label='Terms Text')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='AllowFeedback', label='Allow Feedback')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='AllowCommentFlag', label='Allow Comment Flag')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='CommentApproveFlag', label='Comment Approve Flag')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='NotifyEmails', label='Notify Emails')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='StatViews', label='Stat Views')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='StatVoteCount', label='Stat Vote Count')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='StatVoteValue', label='Stat Vote Value')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='FeaturedFlag', label='Featured Flag')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='extHostFlag', label='Ext Host Flag')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='extHostLink', label='Ext Host Link')#
																
				
					
						#textField(objectName='activity_pubgeneral', property='RestrictedFlag', label='Restricted Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_pubgeneral', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

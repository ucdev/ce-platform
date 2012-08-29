<h1>Create a New activity_application</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_application")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='activity_application', property='ApplicationID', label='Application ID')#
																
				
					
						#textField(objectName='activity_application', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_application', property='ReceivedFlag', label='Received Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='ReceivedDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Received Date')#
																
				
					
						#textField(objectName='activity_application', property='SentFlag', label='Sent Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='SentDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Sent Date')#
																
				
					
						#textField(objectName='activity_application', property='ApprovedFlag', label='Approved Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='ApprovedDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Approved Date')#
																
				
					
						#textField(objectName='activity_application', property='NeedsFlag', label='Needs Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='NeedsDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Needs Date')#
																
				
					
						#textField(objectName='activity_application', property='ObjFlag', label='Obj Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='ObjDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Obj Date')#
																
				
					
						#textField(objectName='activity_application', property='SuppFlag', label='Supp Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='SuppDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Supp Date')#
																
				
					
						#textField(objectName='activity_application', property='AttendFlag', label='Attend Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='AttendDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Attend Date')#
																
				
					
						#textField(objectName='activity_application', property='CVFlag', label='CVFlag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='CVDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='CVDate')#
																
				
					
						#textField(objectName='activity_application', property='BrochFlag', label='Broch Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='BrochDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Broch Date')#
																
				
					
						#textField(objectName='activity_application', property='MembApprFlag', label='Memb Appr Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='MembApprDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Memb Appr Date')#
																
				
					
						#textField(objectName='activity_application', property='ConflictFlag', label='Conflict Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='ConflictDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Conflict Date')#
																
				
					
						#textField(objectName='activity_application', property='EvalFlag', label='Eval Flag')#
																
				
					
						#dateTimeSelect(objectName='activity_application', property='EvalDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Eval Date')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

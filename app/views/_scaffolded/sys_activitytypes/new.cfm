<h1>Create a New sys_activitytype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_activitytype")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_activitytype', property='ActivityTypeID', label='Activity Type ID')#
																
				
					
						#textField(objectName='sys_activitytype', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_activitytype', property='DisplayName', label='Display Name')#
																
				
					
						#textField(objectName='sys_activitytype', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_activitytype', property='Code', label='Code')#
																
				
					
						#dateTimeSelect(objectName='sys_activitytype', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#dateTimeSelect(objectName='sys_activitytype', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#dateTimeSelect(objectName='sys_activitytype', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='sys_activitytype', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

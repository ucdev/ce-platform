<h1>Editing sys_apiclient</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_apiclient")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_apiclient', property='clientid', label='Clientid')#
															
				
					
						#textField(objectName='sys_apiclient', property='name', label='Name')#
															
				
					
						#textField(objectName='sys_apiclient', property='contactName', label='Contact Name')#
															
				
					
						#textField(objectName='sys_apiclient', property='contactPhone', label='Contact Phone')#
															
				
					
						#textField(objectName='sys_apiclient', property='hostName', label='Host Name')#
															
				
					
						#textField(objectName='sys_apiclient', property='clientKey', label='Client Key')#
															
				
					
						#textField(objectName='sys_apiclient', property='statUsers', label='Stat Users')#
															
				
					
						#textField(objectName='sys_apiclient', property='statCalls', label='Stat Calls')#
															
				
					
						#textField(objectName='sys_apiclient', property='statUpdate', label='Stat Update')#
															
				
					
						#textField(objectName='sys_apiclient', property='statSignup', label='Stat Signup')#
															
				
					
						#textField(objectName='sys_apiclient', property='statLogin', label='Stat Login')#
															
				
					
						#dateTimeSelect(objectName='sys_apiclient', property='lastAccessed', dateOrder='year,month,day', monthDisplay='abbreviations', label='Last Accessed')#
															
				
					
						#dateTimeSelect(objectName='sys_apiclient', property='created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='sys_apiclient', property='updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

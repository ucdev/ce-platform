<h1>Editing sys_cbofund</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_cbofund")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_cbofund', property='CBOFundID', label='CBO Fund ID')#
															
				
					
						#textField(objectName='sys_cbofund', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_cbofund', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_cbofund', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

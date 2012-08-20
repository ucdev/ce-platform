<h1>Create a New sys_cbafund</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_cbafund")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_cbafund', property='CBAFundID', label='CBA Fund ID')#
																
				
					
						#textField(objectName='sys_cbafund', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_cbafund', property='Description', label='Description')#
																
				
					
						#dateTimeSelect(objectName='sys_cbafund', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

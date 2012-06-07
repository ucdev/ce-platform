<h1>Create a New sys_funrc</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_funrc")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_funrc', property='FunRCID', label='Fun RCID')#
																
				
					
						#textField(objectName='sys_funrc', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_funrc', property='Description', label='Description')#
																
				
					
						#dateTimeSelect(objectName='sys_funrc', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing sys_funrn</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_funrn")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_funrn', property='FunRNID', label='Fun RNID')#
															
				
					
						#textField(objectName='sys_funrn', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_funrn', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_funrn', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

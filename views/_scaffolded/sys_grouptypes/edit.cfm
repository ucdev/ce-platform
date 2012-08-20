<h1>Editing sys_grouptype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_grouptype")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_grouptype', property='partnerTypeId', label='Partner Type Id')#
															
				
					
						#textField(objectName='sys_grouptype', property='title', label='Title')#
															
				
					
						#textField(objectName='sys_grouptype', property='details', label='Details')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

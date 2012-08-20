<h1>Editing sys_activityrole</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_activityrole")#
	
			#startFormTag(action="update", key=params.key)#
		
				
															
				
					
						#textField(objectName='sys_activityrole', property='name', label='Name')#
															
				
					
						#textField(objectName='sys_activityrole', property='description', label='Description')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Editing sys_component</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_component")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_component', property='ComponentID', label='Component ID')#
															
				
					
						#textField(objectName='sys_component', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_component', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_component', property='TypeCode', label='Type Code')#
															
				
					
						#textField(objectName='sys_component', property='SortFlag', label='Sort Flag')#
															
				
					
						#textField(objectName='sys_component', property='MaxUsage', label='Max Usage')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

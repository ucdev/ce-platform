<h1>Editing sys_assesstype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_assesstype")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_assesstype', property='AssessTypeID', label='Assess Type ID')#
															
				
					
						#textField(objectName='sys_assesstype', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_assesstype', property='Description', label='Description')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

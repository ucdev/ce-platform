<h1>Create a New sys_prinemp</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_prinemp")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_prinemp', property='PrinEmpID', label='Prin Emp ID')#
																
				
					
						#textField(objectName='sys_prinemp', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_prinemp', property='Description', label='Description')#
																
				
					
						#textField(objectName='sys_prinemp', property='Created', label='Created')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

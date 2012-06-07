<h1>Create a New sys_emailstyle</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_emailstyle")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_emailstyle', property='EmailStyleID', label='Email Style ID')#
																
				
					
						#textField(objectName='sys_emailstyle', property='Subject', label='Subject')#
																
				
					
						#textField(objectName='sys_emailstyle', property='TemplateHTML', label='Template HTML')#
																
				
					
						#textField(objectName='sys_emailstyle', property='TemplatePlain', label='Template Plain')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

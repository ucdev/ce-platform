<h1>Create a New sys_historystyle</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_historystyle")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_historystyle', property='HistoryStyleID', label='History Style ID')#
																
				
					
						#textField(objectName='sys_historystyle', property='HistoryTypeID', label='History Type ID')#
																
				
					
						#textField(objectName='sys_historystyle', property='Title', label='Title')#
																
				
					
						#textField(objectName='sys_historystyle', property='TemplateFrom', label='Template From')#
																
				
					
						#textField(objectName='sys_historystyle', property='TemplateTo', label='Template To')#
																
				
					
						#textField(objectName='sys_historystyle', property='PossessiveFlag', label='Possessive Flag')#
																
				
					
						#textField(objectName='sys_historystyle', property='IconImg', label='Icon Img')#
																
				
					
						#textField(objectName='sys_historystyle', property='OldTitles', label='Old Titles')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

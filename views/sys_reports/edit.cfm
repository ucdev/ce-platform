<h1>Editing sys_report</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_report")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_report', property='ReportID', label='Report ID')#
															
				
					
						#textField(objectName='sys_report', property='Title', label='Title')#
															
				
					
						#textField(objectName='sys_report', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_report', property='FileName', label='File Name')#
															
				
					
						#dateTimeSelect(objectName='sys_report', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='sys_report', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

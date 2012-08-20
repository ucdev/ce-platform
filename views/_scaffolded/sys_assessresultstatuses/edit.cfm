<h1>Editing sys_assessresultstatus</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_assessresultstatus")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_assessresultstatus', property='ResultStatusID', label='Result Status ID')#
															
				
					
						#textField(objectName='sys_assessresultstatus', property='Name', label='Name')#
															
				
					
						#textArea(objectName='sys_assessresultstatus', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_assessresultstatus', property='Code', label='Code')#
															
				
					
						#dateTimeSelect(objectName='sys_assessresultstatus', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='sys_assessresultstatus', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='sys_assessresultstatus', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='sys_assessresultstatus', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

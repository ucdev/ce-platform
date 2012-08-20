<h1>Editing sys_supporttype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_supporttype")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_supporttype', property='ContribTypeID', label='Contrib Type ID')#
															
				
					
						#textField(objectName='sys_supporttype', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_supporttype', property='Description', label='Description')#
															
				
					
						#dateTimeSelect(objectName='sys_supporttype', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#dateTimeSelect(objectName='sys_supporttype', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='sys_supporttype', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='sys_supporttype', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

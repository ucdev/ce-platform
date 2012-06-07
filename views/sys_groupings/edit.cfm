<h1>Editing sys_grouping</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_grouping")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_grouping', property='GroupingID', label='Grouping ID')#
															
				
					
						#textField(objectName='sys_grouping', property='ActivityTypeID', label='Activity Type ID')#
															
				
					
						#textField(objectName='sys_grouping', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_grouping', property='Aliases', label='Aliases')#
															
				
					
						#dateTimeSelect(objectName='sys_grouping', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

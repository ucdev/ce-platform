<h1>Editing sys_sitelms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("sys_sitelms")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='sys_sitelms', property='SiteID', label='Site ID')#
															
				
					
						#textField(objectName='sys_sitelms', property='Name', label='Name')#
															
				
					
						#textField(objectName='sys_sitelms', property='NameShort', label='Name Short')#
															
				
					
						#textField(objectName='sys_sitelms', property='Description', label='Description')#
															
				
					
						#textField(objectName='sys_sitelms', property='DomainName', label='Domain Name')#
															
				
					
						#textField(objectName='sys_sitelms', property='ContactName', label='Contact Name')#
															
				
					
						#textField(objectName='sys_sitelms', property='ContactPhone', label='Contact Phone')#
															
				
					
						#dateTimeSelect(objectName='sys_sitelms', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='sys_sitelms', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='sys_sitelms', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='sys_sitelms', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='sys_sitelms', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='sys_sitelms', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

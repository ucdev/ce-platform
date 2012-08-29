<h1>Editing activity_site</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_site")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_site', property='ActivitySiteID', label='Activity Site ID')#
															
				
					
						#textField(objectName='activity_site', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_site', property='SiteID', label='Site ID')#
															
				
					
						#dateTimeSelect(objectName='activity_site', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_site', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_site', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='activity_site', property='UpdatedBy', label='Updated By')#
															
				
					
						#dateTimeSelect(objectName='activity_site', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_site', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

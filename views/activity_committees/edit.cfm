<h1>Editing activity_committee</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_committee")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='activity_committee', property='CommitteeID', label='Committee ID')#
															
				
					
						#textField(objectName='activity_committee', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_committee', property='PersonID', label='Person ID')#
															
				
					
						#textField(objectName='activity_committee', property='RoleID', label='Role ID')#
															
				
					
						#dateTimeSelect(objectName='activity_committee', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='activity_committee', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='activity_committee', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#dateTimeSelect(objectName='activity_committee', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
															
				
					
						#textField(objectName='activity_committee', property='DeletedFlag', label='Deleted Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

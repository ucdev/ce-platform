<h1>Editing history</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("history")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='history', property='HistoryID', label='History ID')#
															
				
					
						#textField(objectName='history', property='HistoryStyleID', label='History Style ID')#
															
				
					
						#textField(objectName='history', property='HistoryHTML', label='History HTML')#
															
				
					
						#textField(objectName='history', property='FromPersonID', label='From Person ID')#
															
				
					
						#textField(objectName='history', property='FromActivityID', label='From Activity ID')#
															
				
					
						#textField(objectName='history', property='ToPersonID', label='To Person ID')#
															
				
					
						#textField(objectName='history', property='ToActivityID', label='To Activity ID')#
															
				
					
						#textField(objectName='history', property='ToHistoryID', label='To History ID')#
															
				
					
						#textField(objectName='history', property='ToContainerID', label='To Container ID')#
															
				
					
						#textField(objectName='history', property='ToContent', label='To Content')#
															
				
					
						#textField(objectName='history', property='ToCreditID', label='To Credit ID')#
															
				
					
						#textField(objectName='history', property='ToSiteID', label='To Site ID')#
															
				
					
						#textField(objectName='history', property='OldActionID', label='Old Action ID')#
															
				
					
						#dateTimeSelect(objectName='history', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='history', property='HiddenFlag', label='Hidden Flag')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

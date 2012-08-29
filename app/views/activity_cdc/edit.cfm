<h1>Editing activity_cdc</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_cdc")#
	
			#startFormTag(action="update", key=params.key)#
		
				
															
				
					
						#textField(objectName='activity_cdc', property='ActivityID', label='Activity ID')#
															
				
					
						#textField(objectName='activity_cdc', property='DidacticHrs', label='Didactic Hrs')#
															
				
					
						#textField(objectName='activity_cdc', property='ExperimentalHrs', label='Experimental Hrs')#
															
				
					
						#textField(objectName='activity_cdc', property='SecClinSiteFlag', label='Sec Clin Site Flag')#
															
				
					
						#textField(objectName='activity_cdc', property='CollabPTCFlag', label='Collab PTC Flag')#
															
				
					
						#textField(objectName='activity_cdc', property='CollabPTCSpecify', label='Collab PTC Specify')#
															
				
					
						#textField(objectName='activity_cdc', property='CollabAgencyFlag', label='Collab Agency Flag')#
															
				
					
						#textField(objectName='activity_cdc', property='CollabAgencySpecify', label='Collab Agency Specify')#
															
				
					
						#checkBox(objectName='activity_cdc', property='competenceDesign', label='Competence Design')#
															
				
					
						#checkBox(objectName='activity_cdc', property='performanceDesign', label='Performance Design')#
															
				
					
						#checkBox(objectName='activity_cdc', property='outcomesDesign', label='Outcomes Design')#
															
				
					
						#checkBox(objectName='activity_cdc', property='competenceEval', label='Competence Eval')#
															
				
					
						#checkBox(objectName='activity_cdc', property='performanceEval', label='Performance Eval')#
															
				
					
						#checkBox(objectName='activity_cdc', property='outcomesEval', label='Outcomes Eval')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

<h1>Create a New activity_accme</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("activity_accme")#
	
			#startFormTag(action="create")#
		
				
																
				
					
						#textField(objectName='activity_accme', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='activity_accme', property='DidacticHrs', label='Didactic Hrs')#
																
				
					
						#textField(objectName='activity_accme', property='ExperimentalHrs', label='Experimental Hrs')#
																
				
					
						#textField(objectName='activity_accme', property='SecClinSiteFlag', label='Sec Clin Site Flag')#
																
				
					
						#textField(objectName='activity_accme', property='CollabPTCFlag', label='Collab PTC Flag')#
																
				
					
						#textField(objectName='activity_accme', property='CollabPTCSpecify', label='Collab PTC Specify')#
																
				
					
						#textField(objectName='activity_accme', property='CollabAgencyFlag', label='Collab Agency Flag')#
																
				
					
						#textField(objectName='activity_accme', property='CollabAgencySpecify', label='Collab Agency Specify')#
																
				
					
						#checkBox(objectName='activity_accme', property='competenceDesign', label='Competence Design')#
																
				
					
						#checkBox(objectName='activity_accme', property='performanceDesign', label='Performance Design')#
																
				
					
						#checkBox(objectName='activity_accme', property='outcomesDesign', label='Outcomes Design')#
																
				
					
						#checkBox(objectName='activity_accme', property='competenceEval', label='Competence Eval')#
																
				
					
						#checkBox(objectName='activity_accme', property='performanceEval', label='Performance Eval')#
																
				
					
						#checkBox(objectName='activity_accme', property='outcomesEval', label='Outcomes Eval')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

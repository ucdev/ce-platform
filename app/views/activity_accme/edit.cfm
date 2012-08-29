<h1>Editing activity_accme</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("activity_accme")#
	
			#bStartFormTag(action="update", key=params.key)#
		
				
															
				
					
						#textField(objectName='activity_accme', property='ActivityID', label='Activity ID')#
															
				
					
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

<h1>Showing activity_cdc</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Other ID</span> <br />
						#activity_cdc.OtherID#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_cdc.ActivityID#</p>
				
					<p><span>Didactic Hrs</span> <br />
						#activity_cdc.DidacticHrs#</p>
				
					<p><span>Experimental Hrs</span> <br />
						#activity_cdc.ExperimentalHrs#</p>
				
					<p><span>Sec Clin Site Flag</span> <br />
						#activity_cdc.SecClinSiteFlag#</p>
				
					<p><span>Collab PTC Flag</span> <br />
						#activity_cdc.CollabPTCFlag#</p>
				
					<p><span>Collab PTC Specify</span> <br />
						#activity_cdc.CollabPTCSpecify#</p>
				
					<p><span>Collab Agency Flag</span> <br />
						#activity_cdc.CollabAgencyFlag#</p>
				
					<p><span>Collab Agency Specify</span> <br />
						#activity_cdc.CollabAgencySpecify#</p>
				
					<p><span>Competence Design</span> <br />
						#activity_cdc.competenceDesign#</p>
				
					<p><span>Performance Design</span> <br />
						#activity_cdc.performanceDesign#</p>
				
					<p><span>Outcomes Design</span> <br />
						#activity_cdc.outcomesDesign#</p>
				
					<p><span>Competence Eval</span> <br />
						#activity_cdc.competenceEval#</p>
				
					<p><span>Performance Eval</span> <br />
						#activity_cdc.performanceEval#</p>
				
					<p><span>Outcomes Eval</span> <br />
						#activity_cdc.outcomesEval#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_cdc", action="edit", key=activity_cdc.OtherID)#
</cfoutput>

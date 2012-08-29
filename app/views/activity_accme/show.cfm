<h1>Showing activity_accme</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Other ID</span> <br />
						#activity_accme.OtherID#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_accme.ActivityID#</p>
				
					<p><span>Didactic Hrs</span> <br />
						#activity_accme.DidacticHrs#</p>
				
					<p><span>Experimental Hrs</span> <br />
						#activity_accme.ExperimentalHrs#</p>
				
					<p><span>Sec Clin Site Flag</span> <br />
						#activity_accme.SecClinSiteFlag#</p>
				
					<p><span>Collab PTC Flag</span> <br />
						#activity_accme.CollabPTCFlag#</p>
				
					<p><span>Collab PTC Specify</span> <br />
						#activity_accme.CollabPTCSpecify#</p>
				
					<p><span>Collab Agency Flag</span> <br />
						#activity_accme.CollabAgencyFlag#</p>
				
					<p><span>Collab Agency Specify</span> <br />
						#activity_accme.CollabAgencySpecify#</p>
				
					<p><span>Competence Design</span> <br />
						#activity_accme.competenceDesign#</p>
				
					<p><span>Performance Design</span> <br />
						#activity_accme.performanceDesign#</p>
				
					<p><span>Outcomes Design</span> <br />
						#activity_accme.outcomesDesign#</p>
				
					<p><span>Competence Eval</span> <br />
						#activity_accme.competenceEval#</p>
				
					<p><span>Performance Eval</span> <br />
						#activity_accme.performanceEval#</p>
				
					<p><span>Outcomes Eval</span> <br />
						#activity_accme.outcomesEval#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_accme", action="edit", key=activity_accme.OtherID)#
</cfoutput>

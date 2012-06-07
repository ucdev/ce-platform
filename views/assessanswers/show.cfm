<h1>Showing assessanswer</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#assessanswer.id#</p>
				
					<p><span>Result ID</span> <br />
						#assessanswer.ResultID#</p>
				
					<p><span>Assessment ID</span> <br />
						#assessanswer.AssessmentID#</p>
				
					<p><span>Question ID</span> <br />
						#assessanswer.QuestionID#</p>
				
					<p><span>I1</span> <br />
						#assessanswer.I1#</p>
				
					<p><span>I2</span> <br />
						#assessanswer.I2#</p>
				
					<p><span>V C1</span> <br />
						#assessanswer.VC1#</p>
				
					<p><span>V C2</span> <br />
						#assessanswer.VC2#</p>
				
					<p><span>D T1</span> <br />
						#assessanswer.DT1#</p>
				
					<p><span>D T2</span> <br />
						#assessanswer.DT2#</p>
				
					<p><span>TXT1</span> <br />
						#assessanswer.TXT1#</p>
				
					<p><span>TXT2</span> <br />
						#assessanswer.TXT2#</p>
				
					<p><span>Correct Flag</span> <br />
						#assessanswer.CorrectFlag#</p>
				
					<p><span>Created</span> <br />
						#assessanswer.Created#</p>
				
					<p><span>Updated</span> <br />
						#assessanswer.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#assessanswer.updatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#assessanswer.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#assessanswer.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this assessanswer", action="edit", key=assessanswer.id)#
</cfoutput>

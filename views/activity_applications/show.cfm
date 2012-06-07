<h1>Showing activity_application</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_application.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_application.ActivityID#</p>
				
					<p><span>Received Flag</span> <br />
						#activity_application.ReceivedFlag#</p>
				
					<p><span>Received Date</span> <br />
						#activity_application.ReceivedDate#</p>
				
					<p><span>Sent Flag</span> <br />
						#activity_application.SentFlag#</p>
				
					<p><span>Sent Date</span> <br />
						#activity_application.SentDate#</p>
				
					<p><span>Approved Flag</span> <br />
						#activity_application.ApprovedFlag#</p>
				
					<p><span>Approved Date</span> <br />
						#activity_application.ApprovedDate#</p>
				
					<p><span>Needs Flag</span> <br />
						#activity_application.NeedsFlag#</p>
				
					<p><span>Needs Date</span> <br />
						#activity_application.NeedsDate#</p>
				
					<p><span>Obj Flag</span> <br />
						#activity_application.ObjFlag#</p>
				
					<p><span>Obj Date</span> <br />
						#activity_application.ObjDate#</p>
				
					<p><span>Supp Flag</span> <br />
						#activity_application.SuppFlag#</p>
				
					<p><span>Supp Date</span> <br />
						#activity_application.SuppDate#</p>
				
					<p><span>Attend Flag</span> <br />
						#activity_application.AttendFlag#</p>
				
					<p><span>Attend Date</span> <br />
						#activity_application.AttendDate#</p>
				
					<p><span>CVFlag</span> <br />
						#activity_application.CVFlag#</p>
				
					<p><span>CVDate</span> <br />
						#activity_application.CVDate#</p>
				
					<p><span>Broch Flag</span> <br />
						#activity_application.BrochFlag#</p>
				
					<p><span>Broch Date</span> <br />
						#activity_application.BrochDate#</p>
				
					<p><span>Memb Appr Flag</span> <br />
						#activity_application.MembApprFlag#</p>
				
					<p><span>Memb Appr Date</span> <br />
						#activity_application.MembApprDate#</p>
				
					<p><span>Conflict Flag</span> <br />
						#activity_application.ConflictFlag#</p>
				
					<p><span>Conflict Date</span> <br />
						#activity_application.ConflictDate#</p>
				
					<p><span>Eval Flag</span> <br />
						#activity_application.EvalFlag#</p>
				
					<p><span>Eval Date</span> <br />
						#activity_application.EvalDate#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_application", action="edit", key=activity_application.id)#
</cfoutput>

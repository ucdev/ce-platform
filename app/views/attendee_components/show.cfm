<h1>Showing attendee_component</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#attendee_component.id#</p>
				
					<p><span>Attendee ID</span> <br />
						#attendee_component.AttendeeID#</p>
				
					<p><span>Component ID</span> <br />
						#attendee_component.ComponentID#</p>
				
					<p><span>Status ID</span> <br />
						#attendee_component.StatusID#</p>
				
					<p><span>Percent Complete</span> <br />
						#attendee_component.PercentComplete#</p>
				
					<p><span>Test Score</span> <br />
						#attendee_component.TestScore#</p>
				
					<p><span>Like Flag</span> <br />
						#attendee_component.LikeFlag#</p>
				
					<p><span>Feedback</span> <br />
						#attendee_component.Feedback#</p>
				
					<p><span>Ping Minutes</span> <br />
						#attendee_component.PingMinutes#</p>
				
					<p><span>Updated</span> <br />
						#attendee_component.Updated#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this attendee_component", action="edit", key=attendee_component.id)#
</cfoutput>

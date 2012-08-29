<h1>Showing history</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#history.id#</p>
				
					<p><span>History Style ID</span> <br />
						#history.HistoryStyleID#</p>
				
					<p><span>History HTML</span> <br />
						#history.HistoryHTML#</p>
				
					<p><span>From Person ID</span> <br />
						#history.FromPersonID#</p>
				
					<p><span>From Activity ID</span> <br />
						#history.FromActivityID#</p>
				
					<p><span>To Person ID</span> <br />
						#history.ToPersonID#</p>
				
					<p><span>To Activity ID</span> <br />
						#history.ToActivityID#</p>
				
					<p><span>To History ID</span> <br />
						#history.ToHistoryID#</p>
				
					<p><span>To Container ID</span> <br />
						#history.ToContainerID#</p>
				
					<p><span>To Content</span> <br />
						#history.ToContent#</p>
				
					<p><span>To Credit ID</span> <br />
						#history.ToCreditID#</p>
				
					<p><span>To Site ID</span> <br />
						#history.ToSiteID#</p>
				
					<p><span>Old Action ID</span> <br />
						#history.OldActionID#</p>
				
					<p><span>Created</span> <br />
						#history.Created#</p>
				
					<p><span>Hidden Flag</span> <br />
						#history.HiddenFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this history", action="edit", key=history.id)#
</cfoutput>

<h1>Showing activity_site</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_site.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_site.ActivityID#</p>
				
					<p><span>Site ID</span> <br />
						#activity_site.SiteID#</p>
				
					<p><span>Created</span> <br />
						#activity_site.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_site.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_site.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_site.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_site.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_site.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_site", action="edit", key=activity_site.id)#
</cfoutput>

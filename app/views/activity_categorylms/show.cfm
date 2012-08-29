<h1>Showing activity_categorylms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_categorylms.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_categorylms.ActivityID#</p>
				
					<p><span>Category ID</span> <br />
						#activity_categorylms.CategoryID#</p>
				
					<p><span>Created</span> <br />
						#activity_categorylms.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_categorylms.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_categorylms.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_categorylms.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_categorylms.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_categorylms.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_categorylms", action="edit", key=activity_categorylms.id)#
</cfoutput>

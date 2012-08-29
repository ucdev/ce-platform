<h1>Showing activity_finbudget</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_finbudget.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_finbudget.ActivityID#</p>
				
					<p><span>Description</span> <br />
						#activity_finbudget.Description#</p>
				
					<p><span>Entry Type ID</span> <br />
						#activity_finbudget.EntryTypeID#</p>
				
					<p><span>Amount</span> <br />
						#activity_finbudget.Amount#</p>
				
					<p><span>Created</span> <br />
						#activity_finbudget.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_finbudget.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_finbudget.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_finbudget.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_finbudget.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_finbudget.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_finbudget", action="edit", key=activity_finbudget.id,id)#
</cfoutput>

<h1>Showing activity_finledger</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_finledger.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_finledger.ActivityID#</p>
				
					<p><span>Entry Date</span> <br />
						#activity_finledger.EntryDate#</p>
				
					<p><span>Description</span> <br />
						#activity_finledger.Description#</p>
				
					<p><span>Memo</span> <br />
						#activity_finledger.Memo#</p>
				
					<p><span>Entry Type ID</span> <br />
						#activity_finledger.EntryTypeID#</p>
				
					<p><span>Amount</span> <br />
						#activity_finledger.Amount#</p>
				
					<p><span>Created</span> <br />
						#activity_finledger.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_finledger.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_finledger.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_finledger.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_finledger.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_finledger.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_finledger", action="edit", key=activity_finledger.id)#
</cfoutput>

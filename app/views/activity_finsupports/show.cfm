<h1>Showing activity_finsupport</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#activity_finsupport.id#</p>
				
					<p><span>Activity ID</span> <br />
						#activity_finsupport.ActivityID#</p>
				
					<p><span>Supporter ID</span> <br />
						#activity_finsupport.SupporterID#</p>
				
					<p><span>Support Type ID</span> <br />
						#activity_finsupport.SupportTypeID#</p>
				
					<p><span>Amount</span> <br />
						#activity_finsupport.Amount#</p>
				
					<p><span>Contract Num</span> <br />
						#activity_finsupport.ContractNum#</p>
				
					<p><span>Budget Requested</span> <br />
						#activity_finsupport.BudgetRequested#</p>
				
					<p><span>Budget Due Date</span> <br />
						#activity_finsupport.BudgetDueDate#</p>
				
					<p><span>Budget Sent Date</span> <br />
						#activity_finsupport.BudgetSentDate#</p>
				
					<p><span>Sent Date</span> <br />
						#activity_finsupport.SentDate#</p>
				
					<p><span>Funds Returned</span> <br />
						#activity_finsupport.FundsReturned#</p>
				
					<p><span>Created</span> <br />
						#activity_finsupport.Created#</p>
				
					<p><span>Created By</span> <br />
						#activity_finsupport.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#activity_finsupport.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#activity_finsupport.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#activity_finsupport.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#activity_finsupport.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this activity_finsupport", action="edit", key=activity_finsupport.id)#
</cfoutput>

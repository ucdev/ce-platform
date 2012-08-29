<h1>Showing sys_entrytype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_entrytype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_entrytype.Name#</p>
				
					<p><span>Expense Flag</span> <br />
						#sys_entrytype.ExpenseFlag#</p>
				
					<p><span>Description</span> <br />
						#sys_entrytype.Description#</p>
				
					<p><span>Created</span> <br />
						#sys_entrytype.Created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_entrytype", action="edit", key=sys_entrytype.id)#
</cfoutput>

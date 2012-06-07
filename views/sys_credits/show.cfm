<h1>Showing sys_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_credit.id#</p>
				
					<p><span>Name</span> <br />
						#sys_credit.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_credit.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_credit.Code#</p>
				
					<p><span>Reference Flag</span> <br />
						#sys_credit.ReferenceFlag#</p>
				
					<p><span>Statement</span> <br />
						#sys_credit.Statement#</p>
				
					<p><span>Created</span> <br />
						#sys_credit.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_credit.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_credit.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_credit.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_credit", action="edit", key=sys_credit.id)#
</cfoutput>

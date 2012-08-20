<h1>Showing sys_assessresultstatus</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_assessresultstatus.id#</p>
				
					<p><span>Name</span> <br />
						#sys_assessresultstatus.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_assessresultstatus.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_assessresultstatus.Code#</p>
				
					<p><span>Created</span> <br />
						#sys_assessresultstatus.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_assessresultstatus.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_assessresultstatus.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_assessresultstatus.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_assessresultstatus", action="edit", key=sys_assessresultstatus.id)#
</cfoutput>

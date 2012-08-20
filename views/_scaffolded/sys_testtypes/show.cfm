<h1>Showing sys_testtype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_testtype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_testtype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_testtype.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_testtype.Code#</p>
				
					<p><span>Created</span> <br />
						#sys_testtype.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_testtype.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_testtype.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_testtype.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_testtype", action="edit", key=sys_testtype.id)#
</cfoutput>

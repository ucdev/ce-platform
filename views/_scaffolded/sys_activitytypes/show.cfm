<h1>Showing sys_activitytype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_activitytype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_activitytype.Name#</p>
				
					<p><span>Display Name</span> <br />
						#sys_activitytype.DisplayName#</p>
				
					<p><span>Description</span> <br />
						#sys_activitytype.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_activitytype.Code#</p>
				
					<p><span>Created</span> <br />
						#sys_activitytype.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_activitytype.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_activitytype.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_activitytype.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_activitytype", action="edit", key=sys_activitytype.id)#
</cfoutput>

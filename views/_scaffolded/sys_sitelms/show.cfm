<h1>Showing sys_sitelms</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_sitelms.id#</p>
				
					<p><span>Name</span> <br />
						#sys_sitelms.Name#</p>
				
					<p><span>Name Short</span> <br />
						#sys_sitelms.NameShort#</p>
				
					<p><span>Description</span> <br />
						#sys_sitelms.Description#</p>
				
					<p><span>Domain Name</span> <br />
						#sys_sitelms.DomainName#</p>
				
					<p><span>Contact Name</span> <br />
						#sys_sitelms.ContactName#</p>
				
					<p><span>Contact Phone</span> <br />
						#sys_sitelms.ContactPhone#</p>
				
					<p><span>Created</span> <br />
						#sys_sitelms.Created#</p>
				
					<p><span>Created By</span> <br />
						#sys_sitelms.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#sys_sitelms.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#sys_sitelms.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#sys_sitelms.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_sitelms.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_sitelms", action="edit", key=sys_sitelms.id)#
</cfoutput>

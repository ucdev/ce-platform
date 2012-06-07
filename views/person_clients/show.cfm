<h1>Showing person_client</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_client.id#</p>
				
					<p><span>Person Id</span> <br />
						#person_client.personId#</p>
				
					<p><span>Client Id</span> <br />
						#person_client.clientId#</p>
				
					<p><span>Client Token</span> <br />
						#person_client.clientToken#</p>
				
					<p><span>Revoke Flag</span> <br />
						#person_client.revokeFlag#</p>
				
					<p><span>Created</span> <br />
						#person_client.created#</p>
				
					<p><span>Updated</span> <br />
						#person_client.updated#</p>
				
					<p><span>Deleted</span> <br />
						#person_client.deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#person_client.deletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_client", action="edit", key=person_client.id)#
</cfoutput>

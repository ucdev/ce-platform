<h1>Showing sys_apiclient</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_apiclient.id#</p>
				
					<p><span>Name</span> <br />
						#sys_apiclient.name#</p>
				
					<p><span>Contact Name</span> <br />
						#sys_apiclient.contactName#</p>
				
					<p><span>Contact Phone</span> <br />
						#sys_apiclient.contactPhone#</p>
				
					<p><span>Host Name</span> <br />
						#sys_apiclient.hostName#</p>
				
					<p><span>Client Key</span> <br />
						#sys_apiclient.clientKey#</p>
				
					<p><span>Stat Users</span> <br />
						#sys_apiclient.statUsers#</p>
				
					<p><span>Stat Calls</span> <br />
						#sys_apiclient.statCalls#</p>
				
					<p><span>Stat Update</span> <br />
						#sys_apiclient.statUpdate#</p>
				
					<p><span>Stat Signup</span> <br />
						#sys_apiclient.statSignup#</p>
				
					<p><span>Stat Login</span> <br />
						#sys_apiclient.statLogin#</p>
				
					<p><span>Last Accessed</span> <br />
						#sys_apiclient.lastAccessed#</p>
				
					<p><span>Created</span> <br />
						#sys_apiclient.created#</p>
				
					<p><span>Updated</span> <br />
						#sys_apiclient.updated#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_apiclient", action="edit", key=sys_apiclient.id)#
</cfoutput>

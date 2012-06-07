<h1>Showing person_file</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_file.id#</p>
				
					<p><span>File ID</span> <br />
						#person_file.FileID#</p>
				
					<p><span>Person ID</span> <br />
						#person_file.PersonID#</p>
				
					<p><span>File Group ID</span> <br />
						#person_file.FileGroupID#</p>
				
					<p><span>Created</span> <br />
						#person_file.Created#</p>
				
					<p><span>Updated</span> <br />
						#person_file.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#person_file.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#person_file.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_file", action="edit", key=person_file.id)#
</cfoutput>

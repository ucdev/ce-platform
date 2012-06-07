<h1>Showing person_note</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_note.id#</p>
				
					<p><span>Person ID</span> <br />
						#person_note.PersonID#</p>
				
					<p><span>Body</span> <br />
						#person_note.Body#</p>
				
					<p><span>Created</span> <br />
						#person_note.Created#</p>
				
					<p><span>Created By</span> <br />
						#person_note.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#person_note.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#person_note.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#person_note.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#person_note.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_note", action="edit", key=person_note.id)#
</cfoutput>

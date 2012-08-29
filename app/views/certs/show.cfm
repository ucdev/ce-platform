<h1>Showing cert</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#cert.id#</p>
				
					<p><span>Title</span> <br />
						#cert.title#</p>
				
					<p><span>Details</span> <br />
						#cert.details#</p>
				
					<p><span>Template</span> <br />
						#cert.template#</p>
				
					<p><span>Created</span> <br />
						#cert.created#</p>
				
					<p><span>Created By</span> <br />
						#cert.createdBy#</p>
				
					<p><span>Updated</span> <br />
						#cert.updated#</p>
				
					<p><span>Updated By</span> <br />
						#cert.updatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#cert.deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#cert.deletedFlag#</p>
				
					<p><span>Deleted By</span> <br />
						#cert.deletedBy#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this cert", action="edit", key=cert.id)#
</cfoutput>

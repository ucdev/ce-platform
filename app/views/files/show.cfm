<h1>Showing file</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#file.id#</p>
				
					<p><span>File Name</span> <br />
						#file.FileName#</p>
				
					<p><span>File Caption</span> <br />
						#file.FileCaption#</p>
				
					<p><span>File Size</span> <br />
						#file.FileSize#</p>
				
					<p><span>File Type ID</span> <br />
						#file.FileTypeID#</p>
				
					<p><span>Person ID</span> <br />
						#file.PersonID#</p>
				
					<p><span>Activity ID</span> <br />
						#file.ActivityID#</p>
				
					<p><span>Created</span> <br />
						#file.Created#</p>
				
					<p><span>Created By</span> <br />
						#file.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#file.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#file.UpdatedBy#</p>
				
					<p><span>Deleted</span> <br />
						#file.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#file.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this file", action="edit", key=file.id)#
</cfoutput>

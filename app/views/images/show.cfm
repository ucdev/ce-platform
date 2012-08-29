<h1>Showing image</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#image.id#</p>
				
					<p><span>Imagetype_id</span> <br />
						#image.imagetype_id#</p>
				
					<p><span>Data_key</span> <br />
						#image.data_key#</p>
				
					<p><span>Caption</span> <br />
						#image.caption#</p>
				
					<p><span>Filename</span> <br />
						#image.filename#</p>
				
					<p><span>File_ext</span> <br />
						#image.file_ext#</p>
				
					<p><span>Orig_filename</span> <br />
						#image.orig_filename#</p>
				
					<p><span>Created</span> <br />
						#image.created#</p>
				
					<p><span>Created_by</span> <br />
						#image.created_by#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this image", action="edit", key=image.id)#
</cfoutput>

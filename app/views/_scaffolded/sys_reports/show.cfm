<h1>Showing sys_report</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_report.id#</p>
				
					<p><span>Title</span> <br />
						#sys_report.Title#</p>
				
					<p><span>Description</span> <br />
						#sys_report.Description#</p>
				
					<p><span>File Name</span> <br />
						#sys_report.FileName#</p>
				
					<p><span>Created</span> <br />
						#sys_report.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_report.Updated#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_report", action="edit", key=sys_report.id)#
</cfoutput>

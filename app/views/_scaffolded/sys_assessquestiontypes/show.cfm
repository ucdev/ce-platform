<h1>Showing sys_assessquestiontype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_assessquestiontype.id#</p>
				
					<p><span>Name</span> <br />
						#sys_assessquestiontype.Name#</p>
				
					<p><span>Description</span> <br />
						#sys_assessquestiontype.Description#</p>
				
					<p><span>Code</span> <br />
						#sys_assessquestiontype.Code#</p>
				
					<p><span>Created</span> <br />
						#sys_assessquestiontype.Created#</p>
				
					<p><span>Updated</span> <br />
						#sys_assessquestiontype.Updated#</p>
				
					<p><span>Deleted</span> <br />
						#sys_assessquestiontype.Deleted#</p>
				
					<p><span>Deleted Flag</span> <br />
						#sys_assessquestiontype.DeletedFlag#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_assessquestiontype", action="edit", key=sys_assessquestiontype.id)#
</cfoutput>

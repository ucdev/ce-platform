<h1>Showing sys_emailstyle</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_emailstyle.id#</p>
				
					<p><span>Subject</span> <br />
						#sys_emailstyle.Subject#</p>
				
					<p><span>Template HTML</span> <br />
						#sys_emailstyle.TemplateHTML#</p>
				
					<p><span>Template Plain</span> <br />
						#sys_emailstyle.TemplatePlain#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_emailstyle", action="edit", key=sys_emailstyle.id)#
</cfoutput>

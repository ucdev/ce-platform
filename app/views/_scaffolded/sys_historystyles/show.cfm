<h1>Showing sys_historystyle</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#sys_historystyle.id#</p>
				
					<p><span>History Type ID</span> <br />
						#sys_historystyle.HistoryTypeID#</p>
				
					<p><span>Title</span> <br />
						#sys_historystyle.Title#</p>
				
					<p><span>Template From</span> <br />
						#sys_historystyle.TemplateFrom#</p>
				
					<p><span>Template To</span> <br />
						#sys_historystyle.TemplateTo#</p>
				
					<p><span>Possessive Flag</span> <br />
						#sys_historystyle.PossessiveFlag#</p>
				
					<p><span>Icon Img</span> <br />
						#sys_historystyle.IconImg#</p>
				
					<p><span>Old Titles</span> <br />
						#sys_historystyle.OldTitles#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this sys_historystyle", action="edit", key=sys_historystyle.id)#
</cfoutput>
